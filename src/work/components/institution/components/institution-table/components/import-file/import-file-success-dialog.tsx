import { Badge, Box, Dialog, DialogContent, DialogTitle, IconButton, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Bell, Close } from "mdi-material-ui";
import React from "react";
import { SuccessWEBP } from "../../../../assets/index";

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
    },
    dialogContent: {
      display: "flex",
      alignItems: "center",
      flexDirection: "column",
    },
    titleClose: {
      position: "absolute",
      right: 8,
      top: 3,
    },
    confirm: {
      color: "#fff",
      background: theme.palette.primary.main,
      fontSize: 14,
      width: 160,
      height: 42,
      cursor: "pointer",
      borderRadius: 4,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      marginBottom: 60,
    },
    importSuccess: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
    tip: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      marginTop: 27,
      marginBottom: 42,
    },
    tipText: {
      color: "#666",
      fontSize: 22,
    },
    importSuccessText: {
      color: "#333",
      fontSize: 24,
      marginLeft: 8,
    },
    dot: {
      height: 5,
      minWidth: 5,
    },
    homeIcon: {
      fontSize: 24,
      margin: "0 4px",
    },
  }),
);

interface ImportFileSuccessDialogProps {
  open: boolean;
  close(): void;
  dialogTitle: string;
}

const ImportFileSuccessDialog: React.FunctionComponent<ImportFileSuccessDialogProps> = (props) => {
  const classes = useStyles();
  const { open, close, dialogTitle } = props;
  return (
    <Dialog open={open} classes={{ paper: classes.paperRoot }} onClose={close}>
      <DialogTitle className={classes.dialogTitle}>
        <Typography>{dialogTitle}</Typography>
        <IconButton className={classes.titleClose} onClick={close}>
          <Close />
        </IconButton>
      </DialogTitle>
      <DialogContent className={classes.dialogContent}>
        <Box className={classes.importSuccess}>
          <img src={SuccessWEBP} />
          <Typography className={classes.importSuccessText}>导入成功</Typography>
        </Box>
        <Box className={classes.tip}>
          <Typography className={classes.tipText}>文件导入进程可点击右上角</Typography>
          <Badge classes={{ dot: classes.dot }} color="error" variant="dot" invisible={false}>
            <Bell fontSize="small" color="primary" className={classes.homeIcon} />
          </Badge>
          <Typography className={classes.tipText}>查看</Typography>
        </Box>
        <Box
          className={classes.confirm}
          onClick={(): void => {
            close();
          }}
        >
          我已知晓
        </Box>
      </DialogContent>
    </Dialog>
  );
};

export default ImportFileSuccessDialog;
