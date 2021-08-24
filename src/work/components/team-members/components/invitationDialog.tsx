import { Button, Dialog, DialogActions, DialogContent, DialogTitle, InputBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import CopyToClipboard from "react-copy-to-clipboard";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      minWidth: 660,
    },
    title: {
      fontSize: 18,
      marginTop: 8,
    },
    dialogContent: {
      paddingTop: 0,
    },
    description: {
      fontSize: 14,
      color: "#666",
    },
    input: {
      width: "100%",
      height: 42,
      fontSize: 14,
      color: "#666",
      marginTop: 16,
      marginBottom: 8,
      backgroundColor: "rgba(102, 140, 157, 0.06)",
      paddingLeft: 8,
    },
    tip: {
      fontSize: 14,
      color: "#999",
      minWidth: 46,
    },
    dialogAction: {
      padding: "8px 24px 24px",
    },
    button: {
      fontSize: 14,
      height: 40,
    },
    copybutton: {
      width: 130,
    },
    cancelButton: {
      width: 80,
      color: "#999",
    },
  }),
);

interface InvitationDialogProps {
  open: boolean;
  onClose?: () => void;
  link: string;
}

const InvitationDialog: React.FunctionComponent<InvitationDialogProps> = (props) => {
  const classes = useStyles();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const { open, link, onClose } = props;

  function onCopy(value: string, result: boolean): void {
    if (result) {
      openSnackbar("复制成功", "success");
      setTimeout(() => {
        onClose?.();
      }, 150);
    }
  }

  return (
    <Dialog open={open} classes={{ paper: classes.root }} onClose={onClose}>
      <DialogTitle>
        <Typography className={classes.title}>邀请链接</Typography>
      </DialogTitle>
      <DialogContent className={classes.dialogContent}>
        <Typography className={classes.description}>发送链接邀请成员加入机构，即可体验更多功能</Typography>
        <InputBase
          className={classes.input}
          startAdornment={<Typography className={classes.tip}>链接：</Typography>}
          value={link}
          disabled
        />
        <Typography className={classes.tip}>邀请链接有效期为 14 天，过期后链接作废</Typography>
      </DialogContent>
      <DialogActions className={classes.dialogAction}>
        <Button className={clsx(classes.button, classes.cancelButton)} onClick={onClose}>
          取消
        </Button>
        <CopyToClipboard text={link} onCopy={onCopy}>
          <Button variant="contained" color="primary" className={clsx(classes.button, classes.copybutton)}>
            复制链接
          </Button>
        </CopyToClipboard>
      </DialogActions>
    </Dialog>
  );
};

export default InvitationDialog;
