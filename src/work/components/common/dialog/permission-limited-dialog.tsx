import {
  Backdrop,
  Box,
  Button,
  CircularProgress,
  Dialog,
  DialogActions,
  DialogContent,
  DialogProps,
  DialogTitle,
  Typography,
} from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    paperRoot: {
      minWidth: 420,
      maxWidth: 420,
    },
    dialogTitleRoot: {
      minHeight: 60,
      padding: "16px 24px",
      fontSize: 16,
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
    },
    dialogTitle: {
      background: theme.palette.primary.main,
      color: "#FFFFFF",
    },
    title: {
      fontSize: 16,
      fontWeight: 500,
      flexGrow: 1,
    },
    dialogContentRoot: {
      padding: "3px 24px 16px",
    },
    dialogContent: {
      color: "#737373",
      fontSize: 16,
      borderBottom: "1px rgba(0, 0, 0, 0.11) solid",
    },
    dialogContentTop: {
      marginTop: 24,
    },
    dialogContentBottom: {
      marginTop: 24,
      marginBottom: 25,
    },
    cancelButton: {
      color: "#666",
    },
    backdrop: {
      zIndex: theme.zIndex.drawer + 1,
      color: "#fff",
    },
  }),
);

interface PermissionLimitedDialogProps extends DialogProps {
  dialogTitle: string;
  loading?: boolean;
  onCancel?: () => void;
  onConfirm?: () => void;
}

const PermissionLimitedDialog: React.FunctionComponent<PermissionLimitedDialogProps> = (props) => {
  const classes = useStyles();

  const { dialogTitle, loading, onCancel, onConfirm, onClose, open, children } = props;

  return (
    <Dialog open={open} classes={{ paper: classes.paperRoot }} onClose={onClose}>
      <DialogTitle className={classes.dialogTitle}>
        <Typography className={classes.title}>{dialogTitle}</Typography>
      </DialogTitle>
      <DialogContent className={classes.dialogContent}>{children}</DialogContent>
      <DialogActions>
        <Button className={classes.cancelButton} onClick={onCancel}>
          取消
        </Button>
        <Button color="primary" onClick={onConfirm}>
          确认
        </Button>
      </DialogActions>

      <Backdrop className={classes.backdrop} open={!!loading}>
        <CircularProgress color="inherit" size={30} />
      </Backdrop>
    </Dialog>
  );
};

export default PermissionLimitedDialog;
