import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Typography, Button, Box, Popover, Badge } from "@material-ui/core";
import { Bell } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import ImportResultList from "./components/import-result-list/import-result-list";
import { TaskStatus, useGetTimelyMessagesQuery } from "../../../../generated/graphql";
import InstitutionContainer from "../../institutionContainer";
import { NoDataWEBP } from "../../assets/index";
const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    postmanBox: {
      display: "flex",
      alignItems: "center",
      fontSize: 14,
      cursor: "pointer",
      marginRight: 32,
    },
    homeIcon: {
      fontSize: 16,
    },
    homeText: {
      fontSize: 14,
      marginLeft: 4,
    },
    resultList: {
      width: 364,
      maxHeight: 800,
      minHeight: 338,
      padding: "0 24px",
    },
    title: {
      padding: "0 24px",
      height: 58,
      fontSize: 18,
      color: "#333",
      display: "flex",
      alignItems: "center",
      borderBottom: "1px rgba(0, 0, 0, 0.11) solid",
    },
    dot: {
      height: "5px",
      minWidth: "5px",
    },
    noDataRoot: {
      display: "flex",
      flexDirection: "column",
      justifyContent: "center",
      alignItems: "center",
      height: 308,
    },
    noData: {
      fontSize: 16,
      color: "#A6A6A6",
    },
  }),
);

const ImportProcessButton: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const [GetTimelyMessagesQueryResult, executeGetTimelyMessagesQuery] = useGetTimelyMessagesQuery({
    requestPolicy: "network-only",
  });
  const {
    isCallLittleBell,
    setIsCallLittleBell,
    anchorEl,
    setAnchorEl,
    popoverCloseHandler,
  } = InstitutionContainer.useContainer();
  const [noData, setNoData] = useState<boolean>(true);

  function onButtonClick(event: React.MouseEvent<HTMLButtonElement>): void {
    setAnchorEl(event.currentTarget);
  }

  let interval: NodeJS.Timer;

  // 轮询小铃铛
  useEffect(() => {
    executeGetTimelyMessagesQuery();
    if (isCallLittleBell) {
      // eslint-disable-next-line react-hooks/exhaustive-deps
      interval = setInterval(() => {
        executeGetTimelyMessagesQuery();
      }, 5000);
    }
    return (): void => {
      interval && clearInterval(interval);
    };
  }, [isCallLittleBell]);

  useEffect(() => {
    if (!GetTimelyMessagesQueryResult.fetching && GetTimelyMessagesQueryResult.data) {
      if (
        GetTimelyMessagesQueryResult.data.getTimelyMessages &&
        GetTimelyMessagesQueryResult.data.getTimelyMessages > 0
      ) {
        setIsCallLittleBell(false);
        interval && clearInterval(interval);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [GetTimelyMessagesQueryResult]);

  return (
    <>
      <Button className={classes.postmanBox} onClick={onButtonClick}>
        <Badge classes={{ dot: classes.dot }} color="error" variant="dot" invisible={isCallLittleBell}>
          <Bell fontSize="small" color="primary" className={classes.homeIcon} />
        </Badge>
        <Typography color="primary" className={classes.homeText}>
          导入进程
        </Typography>
      </Button>

      <Popover
        onClose={popoverCloseHandler}
        anchorEl={anchorEl}
        open={Boolean(anchorEl)}
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "left",
        }}
      >
        <Box>
          <Typography className={classes.title}>导入进程</Typography>
          <Box className={classes.resultList}>
            <ImportResultList taskStatus={TaskStatus.Matched} title={"待确认"} setNoData={setNoData} />
            <ImportResultList taskStatus={TaskStatus.Matching} title={"处理中"} setNoData={setNoData} />
            <ImportResultList taskStatus={TaskStatus.Complete} title={"已确认"} setNoData={setNoData} />
            {noData && (
              <div className={classes.noDataRoot}>
                <img src={NoDataWEBP} />
                <span className={classes.noData}> 暂无数据 </span>
              </div>
            )}
          </Box>
        </Box>
      </Popover>
    </>
  );
};

export default ImportProcessButton;
