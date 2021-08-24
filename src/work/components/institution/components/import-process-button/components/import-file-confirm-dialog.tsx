import {
  Box,
  Button,
  Checkbox,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  List,
  ListItem,
  Theme,
  Typography,
} from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Close } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import { useClient } from "urql";
import {
  CommitMatchedResultsDocument,
  CommitMatchedResultsMutation,
  CommitMatchedResultsMutationVariables,
  MatchingTask,
  RelevantGroupCount,
} from "../../../../../generated/graphql";
import { errorParse } from "../../../../../utils/errorHandler";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import InstitutionContainer, { InstitutionType } from "../../../institutionContainer";
import ImportResultListContainer from "./import-result-list/importResultListContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    paperRoot: {
      minWidth: 480,
      maxWidth: 480,
    },
    dialogTitle: {
      display: "flex",
      justifyContent: "space-between",
      paddingBottom: 0,
    },
    dialogContent: {
      borderBottom: "1px rgba(0, 0, 0, 0.11) solid",
    },
    cell: {
      display: "flex",
      justifyContent: "flex-start",
    },
    title: {
      fontSize: 22,
      color: "#666666",
    },
    titleClose: {
      position: "absolute",
      fontSize: 32,

      right: 8,
      top: 3,
    },
    text: {
      marginTop: 27,
      marginBottom: 35,
      color: "#333",
      fontSize: 24,
    },
    checkbox: {
      display: "flex",
      justifyContent: " flex-start",
      alignItems: "center",
      marginLeft: 16,
      color: theme.palette.primary.main,
    },
    checkboxText: {
      marginLeft: 3,
      fontSize: 14,
    },
    dialogAction: {
      display: "flex",
      justifyContent: "space-between",
    },
    listItemRoot: {
      paddingLeft: 0,
    },
    count: {
      color: theme.palette.primary.main,
      fontSize: 24,
    },
    name: {
      fontSize: 24,
    },
    feedback: {
      fontSize: 20,
      color: "#666666",
      marginBottom: 20,
    },
    checkboxRoot: {
      padding: "0",
    },
  }),
);

interface ImportFileConfirmDialogProps {
  open: boolean;
  close(): void;
  dialogTitle: string;
  importRecord: MatchingTask;
  mismatchCount: number;
  onSuccess(): void;
}

const ImportFileConfirmDialog: React.FunctionComponent<ImportFileConfirmDialogProps> = (props) => {
  const classes = useStyles();
  const { open, close, dialogTitle, importRecord, mismatchCount, onSuccess } = props;
  const [checkStatus, setCheckStatus] = useState(true);
  const [relevantGroups, setRelevantGroups] = useState<RelevantGroupCount[]>([]);
  const { openSnackbar } = SnackbarContainer.useContainer();
  const {
    getTypeName,
    setErrorCode,
    setErrorMessage,
    setFailDialogOpen,
    setFileUpload,
    setIsCallLittleBell,
  } = InstitutionContainer.useContainer();
  const [checkoutDisable, setCheckoutDisable] = useState(true);
  const { getEntitiesCountFromRelevantGroupsByTaskQueryResult } = ImportResultListContainer.useContainer();

  const client = useClient();
  client.requestPolicy = "network-only";

  useEffect(() => {
    if (
      getEntitiesCountFromRelevantGroupsByTaskQueryResult.data?.getEntitiesCountFromRelevantGroupsByTask
        .relevantGroupCounts
    ) {
      setRelevantGroups(
        getEntitiesCountFromRelevantGroupsByTaskQueryResult.data.getEntitiesCountFromRelevantGroupsByTask
          .relevantGroupCounts as RelevantGroupCount[],
      );
    }
  }, [getEntitiesCountFromRelevantGroupsByTaskQueryResult]);

  useEffect(() => {
    if (relevantGroups.length > 1) {
      setCheckoutDisable(false);
      setCheckStatus(true);
    } else {
      setCheckoutDisable(true);
      setCheckStatus(false);
    }
  }, [relevantGroups]);

  const handleCheckboxChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
    setCheckStatus(event.target.checked);
  };

  async function executeCommitMatchedResults(): Promise<void> {
    const mutationResult = await client
      .query<CommitMatchedResultsMutation, CommitMatchedResultsMutationVariables>(CommitMatchedResultsDocument, {
        input: {
          taskID: importRecord.taskID as string,
          importID: importRecord.importID as string,
          processRelevantGroups: checkStatus,
        },
      })
      .toPromise();

    if (mutationResult.data?.commitMatchedResults) {
      openSnackbar("导入成功!", "success");
      onSuccess();
      return;
    }

    if (mutationResult.error) {
      const err = errorParse(mutationResult.error);
      setErrorCode(err.Code);
      setErrorMessage(err.Message);
      setIsCallLittleBell(true);
      setFileUpload(false);
      setFailDialogOpen(true);
      close();
      return;
    }
  }

  return (
    <Dialog open={open} classes={{ paper: classes.paperRoot }} onClose={close}>
      <DialogTitle className={classes.dialogTitle}>
        <Typography className={classes.title}>{dialogTitle}</Typography>
        <IconButton className={classes.titleClose} onClick={close}>
          <Close />
        </IconButton>
      </DialogTitle>
      <DialogContent className={classes.dialogContent}>
        <List>
          {relevantGroups.map((item, index) => {
            return item?.count ?? 0 > 0 ? (
              <ListItem key={index} className={classes.listItemRoot}>
                <Box className={classes.cell} flex={6}>
                  <Typography className={classes.name}>{getTypeName(item.groupCode as InstitutionType)}</Typography>
                </Box>
                <Box className={classes.cell} flex={4}>
                  <Typography className={classes.count}>{`+${item.count}`}</Typography>
                </Box>
              </ListItem>
            ) : null;
          })}
        </List>

        {mismatchCount > 0 ? (
          <Typography className={classes.feedback}>
            您反馈的<span style={{ color: "#C62828" }}>{` ${mismatchCount} `}</span>条匹配有误数据已交予人工处理
          </Typography>
        ) : null}
      </DialogContent>
      <DialogActions className={classes.dialogAction}>
        <Box className={classes.checkbox}>
          <Checkbox
            classes={{
              root: classes.checkboxRoot,
            }}
            checked={checkStatus}
            color="primary"
            disabled={checkoutDisable}
            inputProps={{ "aria-label": "secondary checkbox" }}
            onChange={handleCheckboxChange}
          />
          <Typography className={classes.checkboxText}>导入关联数据</Typography>
        </Box>
        <Button
          color="primary"
          onClick={(): void => {
            executeCommitMatchedResults();
            close();
          }}
        >
          确认
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ImportFileConfirmDialog;
