import {
  Box,
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  List,
  Theme,
  Typography,
} from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import { Close } from "mdi-material-ui";
import React, { ReactNode, useEffect, useRef, useState } from "react";
import { useClient } from "urql";
import {
  InvalidateMatchedResultsDocument,
  InvalidateMatchedResultsMutation,
  InvalidateMatchedResultsMutationVariables,
  MatchingTask,
  MatchItem,
  useGetMatchedResultsQuery,
} from "../../../../../../generated/graphql";
import SnackbarContainer from "../../../../../common/snackbar/snackbarContainer";
import ImportResultListContainer from "../import-result-list/importResultListContainer";
import DataListItem from "./list-item";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    paperRoot: {
      minWidth: 900,
      maxWidth: 900,
      maxHeight: 520,
    },
    dialogTitle: {
      paddingBottom: 0,
    },
    dialogContent: {
      paddingLeft: 0,
      paddingRight: 0,
      paddingBottom: 0,
    },
    title: {
      fontSize: 20,
      color: "#666666",
    },
    titleClose: {
      position: "absolute",
      fontSize: 32,
      right: 8,
      top: 3,
    },
    cancelButton: {
      color: "#666",
    },
    feedback: {
      color: "#737373",
      fontSize: 16,
      paddingLeft: 24,
      paddingRight: 24,
    },
    virtualBox: {
      flexGrow: 1,
    },
    statistic: {
      color: theme.palette.primary.main,
    },
    bottomFeedback: {
      color: "#666666",
      fontSize: 14,
      marginLeft: 16,
    },
  }),
);

interface ImportFileDataDialogProps {
  open: boolean;
  close(): void;
  dialogTitle: string;
  importRecord: MatchingTask;
}
const ImportFileDataDialog: React.FunctionComponent<ImportFileDataDialogProps> = (props) => {
  const classes = useStyles();
  const contentRef = useRef<HTMLDivElement>(null);
  const [page, setPage] = useState(1);
  const [hasNextPage, setHasNextPage] = useState(false);

  const { open, close, dialogTitle, importRecord } = props;
  const {
    setConfirmDialogOpen,
    mismatch,
    setMismatchCount,
    executeGetEntitiesCountFromRelevantGroupsByTaskQuery,
  } = ImportResultListContainer.useContainer();

  const [matchResults, setMatchResults] = useState<MatchItem[]>([]);
  const { openSnackbar } = SnackbarContainer.useContainer();
  const client = useClient();
  client.requestPolicy = "network-only";

  const PAGE_SIZE = 10;
  const SCROLL_OFFSET = 0;
  const [findGetMatchedResultsQueryResult, executeGetMatchedResultsQuery] = useGetMatchedResultsQuery({
    variables: {
      taskId: importRecord.taskID as string,
      first: PAGE_SIZE,
      after: page == 1 ? undefined : btoa(`${(page - 1) * PAGE_SIZE - 1}`),
    },
    requestPolicy: "network-only",
  });

  function loadMore(): void {
    if (hasNextPage) {
      setPage((old) => old + 1);
    }
  }

  const scrollHandler = _.throttle(() => {
    if (contentRef.current) {
      if (
        contentRef.current.scrollTop + SCROLL_OFFSET ==
        contentRef.current.scrollHeight - contentRef.current.clientHeight
      ) {
        loadMore();
      }
    }
  }, 100);

  useEffect(() => {
    if (hasNextPage && contentRef.current) {
      contentRef.current.addEventListener("scroll", scrollHandler);
      return (): void => {
        contentRef.current?.removeEventListener("scroll", scrollHandler);
      };
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [hasNextPage]);

  useEffect(() => {
    executeGetMatchedResultsQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page]);

  useEffect(() => {
    if (!findGetMatchedResultsQueryResult.fetching && findGetMatchedResultsQueryResult.data) {
      const nodes = findGetMatchedResultsQueryResult.data.getMatchedResults?.nodes;
      const pageInfo = findGetMatchedResultsQueryResult.data.getMatchedResults?.pageInfo;

      if (pageInfo?.hasNextPage) {
        setHasNextPage(true);
      } else {
        setHasNextPage(false);
      }

      if (page == 1) {
        setMatchResults(nodes as MatchItem[]);
      } else {
        setMatchResults((oldValue) => {
          const newValue = Array.from(oldValue);
          return newValue.concat(nodes as MatchItem[]);
        });
      }
    }

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [findGetMatchedResultsQueryResult]);

  async function executeInvalidateMatchedResults(): Promise<void> {
    const result = await client
      .query<InvalidateMatchedResultsMutation, InvalidateMatchedResultsMutationVariables>(
        InvalidateMatchedResultsDocument,
        {
          input: {
            importId: importRecord.importID as string,
            taskID: importRecord.taskID as string,
            matchName: mismatch,
          },
        },
      )
      .toPromise();
    if (result.data) {
      setMismatchCount(result?.data?.invalidateMatchedResults ?? 0);
      executeGetEntitiesCountFromRelevantGroupsByTaskQuery();
      executeGetMatchedResultsQuery();
    }
    if (result.error) {
      openSnackbar("删除匹配数据出错", "error");
    }
  }

  function getFeedbackText(): ReactNode {
    return importRecord.importRowNum !== importRecord.taskCount ? (
      <Typography className={classes.feedback}>
        您一共上传 <span className={classes.statistic}>{` ${importRecord.importRowNum ?? 0} `}</span>
        条数据，已成功匹配
        <span className={classes.statistic}>{` ${importRecord.taskCount ?? 0} `}</span>条， 还有
        <span className={classes.statistic}>{` ${
          (importRecord.importRowNum ?? 0) - (importRecord.taskCount ?? 0)
        } `}</span>
        条数据暂未匹配成功，未匹配成功数据已交予人工处理，请耐心等待...
      </Typography>
    ) : (
      <Typography className={classes.feedback}>
        您一共上传 <span className={classes.statistic}>{` ${importRecord.importRowNum ?? 0} `}</span>
        条数据，已成功匹配
        <span className={classes.statistic}>{` ${importRecord.taskCount ?? 0} `}</span>条。
      </Typography>
    );
  }

  return (
    <Dialog open={open} classes={{ paper: classes.paperRoot }} onClose={close}>
      <DialogTitle className={classes.dialogTitle}>
        <Typography className={classes.title}>{dialogTitle}</Typography>
        <IconButton className={classes.titleClose} onClick={close}>
          <Close />
        </IconButton>
      </DialogTitle>
      <DialogContent className={classes.dialogContent} ref={contentRef}>
        {getFeedbackText()}
        <List style={{ paddingBottom: 0 }}>
          {matchResults &&
            matchResults.map((item, index) => {
              return <DataListItem key={index} index={index} item={item} />;
            })}
        </List>
      </DialogContent>
      <DialogActions>
        {mismatch.length > 0 ? (
          <Typography className={classes.bottomFeedback}>
            已反馈 <span style={{ color: "#C62828" }}>{mismatch.length}</span> 条匹配有误数据
          </Typography>
        ) : null}
        <Box className={classes.virtualBox}> </Box>
        <Button
          className={classes.cancelButton}
          onClick={(): void => {
            close();
          }}
        >
          取消
        </Button>
        <Button
          color="primary"
          onClick={(): void => {
            if (mismatch.length > 0) {
              executeInvalidateMatchedResults();
            }
            setConfirmDialogOpen(true);
            close();
          }}
        >
          确认
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ImportFileDataDialog;
