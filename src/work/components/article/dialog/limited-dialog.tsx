import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import PermissionLimitedDialog from "../../common/dialog/permission-limited-dialog";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    tip: {
      fontSize: 18,
      marginTop: 24,
      color: "#333",
    },
    bottom: {
      marginTop: 24,
      marginBottom: 25,
    },
    usedTip: {
      fontSize: 14,
      color: "#666666",
      marginTop: 2,
      marginBottom: 2,
    },
    unusedTip: {
      fontSize: 14,
      color: "#666666",
      marginTop: 2,
      marginBottom: 2,
    },
  }),
);

interface ReadLimitedDialogProps {
  numberOfUsedCount?: number;
  numberOfUnusedCount?: number;
  open: boolean;
  onClose: () => void;
  type: "read" | "download";
}

const ArticleLimitedDialog: React.FunctionComponent<ReadLimitedDialogProps> = (props) => {
  const classes = useStyles();

  const { type, numberOfUnusedCount, numberOfUsedCount, open, onClose: onClose } = props;

  const text = type == "read" ? "查看" : "下载";

  return (
    <PermissionLimitedDialog
      open={open}
      dialogTitle={`${text}次数限制`}
      onClose={onClose}
      onConfirm={onClose}
      onCancel={onClose}
    >
      <Typography className={classes.tip}>剩余{text}次数不足</Typography>
      <Box className={classes.bottom}>
        <Typography className={classes.usedTip}>
          已{text}次数：{numberOfUsedCount != undefined ? numberOfUsedCount : "-"} 次
        </Typography>
        <Typography className={classes.unusedTip}>
          剩余{text}次数：{numberOfUnusedCount != undefined ? numberOfUnusedCount : "-"} 次
        </Typography>
      </Box>
    </PermissionLimitedDialog>
  );
};

export default ArticleLimitedDialog;
