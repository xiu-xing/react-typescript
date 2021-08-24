import { Dialog, DialogContent, DialogTitle, IconButton, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Close } from "mdi-material-ui";
import React from "react";
import ContactInformation from "../../contact-information";
import { LogoSVG } from "../assets";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    dialogPaper: {
      width: 400,
      minWidth: 400,
      borderRadius: 0,
    },
    dialogTitle: {
      background: theme.palette.primary.main,
      height: 60,
      padding: "16px 32px",
    },
    title: {
      fontSize: 16,
      fontWeight: 500,
      color: "#333",
    },
    closeBtn: {
      position: "absolute",
      right: 21,
      top: 13,
      color: "#fff",
    },
    dialogContent: {
      padding: "32px 50px 24px 58px",
    },
  }),
);

interface ContactUsDialogProps {
  open: boolean;
  onClose: () => void;
}

const ContactUsDialog: React.FunctionComponent<ContactUsDialogProps> = (props) => {
  const classes = useStyles();

  const { open, onClose } = props;

  return (
    <Dialog
      open={open}
      className={classes.root}
      classes={{
        paper: classes.dialogPaper,
      }}
      onClose={onClose}
    >
      <DialogTitle className={classes.dialogTitle}>
        <LogoSVG />
        <IconButton size="small" className={classes.closeBtn} onClick={onClose}>
          <Close />
        </IconButton>
      </DialogTitle>
      <DialogContent className={classes.dialogContent}>
        <ContactInformation />
      </DialogContent>
    </Dialog>
  );
};

export default ContactUsDialog;
