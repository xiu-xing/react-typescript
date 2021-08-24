import { Box, List, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { ChevronDown } from "mdi-material-ui";
import React, { useEffect } from "react";
import { MatchingTask, TaskStatus, useGetActiveMatchingTasksQuery } from "../../../../../../generated/graphql";
import { CompletedWEBP, MatchedWEBP, MatchingWEBP } from "../../../../assets/index";
import InstitutionContainer from "../../../../institutionContainer";
import ImportFileConfirmDialog from "../import-file-confirm-dialog";
import ImportFileDataDialog from "../import-file-data-dialog/import-file-data-dialog";
import ImportResultListContainer from "./importResultListContainer";
import ImportResultListItem from "./list-item";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    contentBox: {
      width: "100%",
      margin: "10px 0",
    },
    contentTitle: {
      width: "100%",
      display: "flex",
      justifyContent: "flex-start",
      alignItems: "center",
      marginTop: 16,
    },
    logo: {
      marginRight: 4,
    },
    logoText: {
      fontSize: 16,
      color: "#333",
    },
    loadMore: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      cursor: "pointer",
      marginTop: 8,
    },
    loadMoreText: {
      fontSize: 14,
      color: theme.palette.primary.main,
    },
    loadMoreIcon: {
      fontSize: 16,
      color: theme.palette.primary.main,
    },
    itemList: {
      padding: "0",
    },
  }),
);

interface ImportResultListProps {
  taskStatus: TaskStatus;
  title: string;
  setNoData(noData: boolean): void;
}

const ImportResultListDisplay: React.FunctionComponent<ImportResultListProps> = (props) => {
  const classes = useStyles();
  const { taskStatus, title, setNoData } = props;
  const {
    setIsCallLittleBell,
    executeTeamGroupOverviewQuery,
    setRefreshTable,
    popoverCloseHandler,
  } = InstitutionContainer.useContainer();
  const {
    confirmDialogOpen,
    setConfirmDialogOpen,
    showDataDialogOpen,
    setShowDataDialogOpen,
    importRecord,
    pageInfo,
    setPageInfo,
    totalCount,
    setTotalCount,
    matchedData,
    setMatchedData,
    clickLoadMore,
    setClickLoadMore,
    setMismatch,
    setShowMatchError,
    mismatchCount,
  } = ImportResultListContainer.useContainer();

  const [getActiveMatchingTasksQueryResult, executeGetActiveMatchingTasksQuery] = useGetActiveMatchingTasksQuery({
    variables: {
      taskStatus: props.taskStatus,
      ...pageInfo,
    },
    requestPolicy: "network-only",
  });

  useEffect(() => {
    if (getActiveMatchingTasksQueryResult.data && getActiveMatchingTasksQueryResult.data.getActiveMatchingTasks) {
      setTotalCount(getActiveMatchingTasksQueryResult.data.getActiveMatchingTasks.totalCount ?? 0);
      const matchedData: MatchingTask[] = getActiveMatchingTasksQueryResult.data.getActiveMatchingTasks
        .nodes as MatchingTask[];
      setMatchedData(matchedData);
      if (matchedData && matchedData.length > 0) {
        setNoData(false);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [getActiveMatchingTasksQueryResult]);

  // 小铃铛列表加载更多
  function handleLoadMoreClick(): void {
    setClickLoadMore(true);
    setPageInfo({ first: totalCount });
    executeGetActiveMatchingTasksQuery();
  }

  // 点加确认框之后刷新页面
  function refreshPage(): void {
    executeGetActiveMatchingTasksQuery();
    executeTeamGroupOverviewQuery();
    setRefreshTable((old) => !old);
    setIsCallLittleBell(true);
  }

  function GetImgIcon(): string {
    switch (taskStatus) {
      case TaskStatus.Matched:
        return MatchedWEBP;
      case TaskStatus.Matching:
        return MatchingWEBP;
      case TaskStatus.Complete:
        return CompletedWEBP;
      default:
        return "";
    }
  }

  return matchedData && matchedData.length > 0 ? (
    <Box className={classes.contentBox}>
      <Box className={classes.contentTitle}>
        <img src={GetImgIcon()} className={classes.logo} />
        <Typography className={classes.logoText}>{title}</Typography>
      </Box>
      <List className={classes.itemList}>
        {matchedData.map((item, index) => (
          <ImportResultListItem key={index} item={item} index={index} taskStatus={taskStatus} />
        ))}
        {totalCount > 5 && !clickLoadMore ? (
          <Box className={classes.loadMore} onClick={handleLoadMoreClick}>
            <Typography className={classes.loadMoreText}>查看更多</Typography>
            <ChevronDown className={classes.loadMoreIcon} />
          </Box>
        ) : null}
      </List>
      <ImportFileDataDialog
        open={showDataDialogOpen}
        close={(): void => {
          setShowDataDialogOpen(false);
          setMismatch([]);
          setShowMatchError([]);
        }}
        dialogTitle={"文件导入"}
        importRecord={importRecord}
      />
      <ImportFileConfirmDialog
        open={confirmDialogOpen}
        close={(): void => {
          setConfirmDialogOpen(false);
          executeGetActiveMatchingTasksQuery();
          popoverCloseHandler();
        }}
        dialogTitle={"文件导入"}
        importRecord={importRecord}
        mismatchCount={mismatchCount}
        onSuccess={refreshPage}
      />
    </Box>
  ) : null;
};

const ImportResultList: React.FunctionComponent<ImportResultListProps> = (props) => {
  return (
    <ImportResultListContainer.Provider>
      <ImportResultListDisplay {...props} />
    </ImportResultListContainer.Provider>
  );
};

export default ImportResultList;
