import { Box, ListItem, Theme, Tooltip, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { ChevronRight } from "mdi-material-ui";
import React from "react";
import { withAlphaHex } from "with-alpha-hex";
import { MatchingTask, TaskStatus } from "../../../../../../generated/graphql";
import theme from "../../../../../../theme";
import InstitutionContainer, { InstitutionType } from "../../../../institutionContainer";
import ImportResultListContainer from "./importResultListContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    cell: {
      padding: "4px 0px",
      flexDirection: "column",
    },
    isManual: {
      width: 49,
      height: 20,
      background: withAlphaHex(theme.palette.primary.main, 0.16),
      borderRadius: 2,
      fontSize: 10,
      color: theme.palette.primary.main,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      marginLeft: 8,
    },
    info: {
      width: "100%",
      display: "flex",
      justifyContent: "flex-start",
      alignItems: "center",
    },
    count: {
      width: "100%",
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      marginTop: 3,
    },
    countText: {
      color: "#666",
      fontSize: 14,
    },
    toBeConfirmed: {
      display: "flex",
      justifyContent: "flex-start",
      alignItems: "center",
      cursor: "pointer",
    },
    toBeConfirmedText: {
      fontSize: 14,
      color: theme.palette.primary.main,
    },
    toBeConfirmedLogo: {
      fontSize: 16,
      color: theme.palette.primary.main,
    },
    fileName: {
      fontSize: 16,
      color: "#333",
      maxWidth: "70%",
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
    },
  }),
);

interface ImportResultListItemProps {
  item: MatchingTask;
  index: number;
  taskStatus: TaskStatus;
}

const ImportResultListItem: React.FunctionComponent<ImportResultListItemProps> = (props) => {
  const classes = useStyles();
  const { item, index, taskStatus } = props;
  const { setShowDataDialogOpen, setImportRecord } = ImportResultListContainer.useContainer();
  const { getTypeName } = InstitutionContainer.useContainer();

  function GetItemText(): string {
    switch (taskStatus) {
      case TaskStatus.Matched:
        return "条数据等待确认";
      case TaskStatus.Matching:
        return "条数据正在匹配中";
      case TaskStatus.Complete:
        return "条数据已匹配成功";
      default:
        return "";
    }
  }

  return (
    <ListItem key={index} className={classes.cell}>
      <Box className={classes.info}>
        <Tooltip title={<Typography>{item.fileName}</Typography>} placement={"top"}>
          <Typography className={classes.fileName}>{`${getTypeName(item.groupCode as InstitutionType)} - ${
            item.fileName
          }`}</Typography>
        </Tooltip>

        <Typography className={classes.isManual}>{item.isManual ? "人工处理" : "系统处理"}</Typography>
      </Box>
      <Box className={classes.count}>
        <Typography className={classes.countText}>
          共 <span style={{ color: theme.palette.primary.main }}>{item.taskCount}</span> {GetItemText()}
        </Typography>
        {taskStatus === TaskStatus.Matched ? (
          <Box
            className={classes.toBeConfirmed}
            onClick={(): void => {
              setShowDataDialogOpen(true);
              setImportRecord(item);
            }}
          >
            <Typography className={classes.toBeConfirmedText}>前往确认</Typography>
            <ChevronRight className={classes.toBeConfirmedLogo} />
          </Box>
        ) : null}
      </Box>
    </ListItem>
  );
};

export default ImportResultListItem;
