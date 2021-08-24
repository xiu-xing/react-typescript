import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Box, Dialog, DialogContent, Typography, DialogActions, Button } from "@material-ui/core";
import React from "react";
import InstitutionTableContainer from "../../institutionTableContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    paperRoot: {
      minWidth: 400,
      maxWidth: 400,
    },
    dialogContent: {
      display: "flex",
      alignItems: "center",
      flexDirection: "column",
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
    cancelButton: {
      color: "#666",
    },
    dialogActions: {
      padding: "0px 8px",
    },
  }),
);

interface DeleteDataConfirmDialogProps {
  open: boolean;
  close(): void;
}

const DeleteDataConfirmDialog: React.FunctionComponent<DeleteDataConfirmDialogProps> = (props) => {
  const classes = useStyles();
  const { deleteEntity } = InstitutionTableContainer.useContainer();
  const { open, close } = props;
  return (
    <Dialog open={open} classes={{ paper: classes.paperRoot }} onClose={close}>
      <DialogContent className={classes.dialogContent}>
        <Box className={classes.tip}>
          <Typography className={classes.tipText}>确定删除已选择的数据？</Typography>
        </Box>
      </DialogContent>
      <DialogActions className={classes.dialogActions}>
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
            deleteEntity();
            close();
          }}
        >
          确认
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default DeleteDataConfirmDialog;
