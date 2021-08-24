import {
  Button,
  createStyles,
  Dialog as MuiDialog,
  DialogActions as MuiDialogActions,
  DialogContent as MuiDialogContent,
  DialogTitle as MuiDialogTitle,
  makeStyles,
  Theme,
} from "@material-ui/core";
import React from "react";

interface DialogProps {
  open: boolean;
  title?: string;
  width?: "sm" | "xs" | "md" | "lg" | "xl";
  confirm?: boolean;
  onConfirm?: VoidFunction;
  onClose?: VoidFunction;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    title: {
      height: 46,
      color: "#737373",
      fontSize: 16,
      fontWeight: 500,
      padding: "12px 24px",
      borderBottom: "1px solid #EEE",
    },
    cancel: {
      color: "#666",
    },
    save: {
      color: theme.palette.primary.main,
    },
  }),
);

const Dialog: React.FC<DialogProps> = (props) => {
  const classes = useStyles();

  const handleClose = (): void => {
    if (props.onClose) {
      props.onClose();
    }
  };

  return (
    <MuiDialog open={props.open} onClose={handleClose} maxWidth={props.width ? props.width : false} fullWidth>
      {props.title ? (
        <MuiDialogTitle className={classes.title} disableTypography>
          {props.title}
        </MuiDialogTitle>
      ) : null}
      <MuiDialogContent>{props.children}</MuiDialogContent>
      {props.confirm ? (
        <MuiDialogActions>
          <Button className={classes.cancel} onClick={handleClose}>
            取消
          </Button>
          <Button className={classes.save} onClick={props.onConfirm}>
            保存
          </Button>
        </MuiDialogActions>
      ) : null}
    </MuiDialog>
  );
};

export default Dialog;
