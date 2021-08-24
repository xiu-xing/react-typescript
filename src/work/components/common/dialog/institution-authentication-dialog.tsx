import { Dialog, DialogContent, DialogTitle, IconButton, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import CloseIcon from "@material-ui/icons/Close";
import React from "react";
import UserContainer from "../../../containers/userContainer";
import ContactInformation from "../contact-information";
import Logo from "./assets/logo.svg";
import uploadCard from "./assets/upload-card.webp";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    description: {
      margin: "14px 0 0 0",
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: 500,
    },
    subDescription: {
      margin: "4px 0 16px 0",
      fontSize: 16,
      lineHeight: "24px",
      color: "#737373",
      fontWeight: 400,
    },
    activeDialog: {
      minWidth: 479,
      width: 479,
      minHeight: 548,
      height: 548,
    },
    proDialogCloseButton: {
      position: "absolute",
      right: 0,
      top: 4,
      color: "#ffffff",
    },
    dialogTitle: {
      background: theme.palette.primary.main,
      color: "#ffffff",
      paddingBottom: "12px",
    },
    input: {
      display: "none",
    },
  }),
);

const InstitutionAuthenticationDialog: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { institutionAuthenticationDialog, setInstitutionAuthenticationDialog } = UserContainer.useContainer();

  return (
    <Dialog classes={{ paper: classes.activeDialog }} open={institutionAuthenticationDialog}>
      <DialogTitle classes={{ root: classes.dialogTitle }}>
        <Logo />
        <IconButton
          aria-label="close"
          className={classes.proDialogCloseButton}
          onClick={(): void => {
            setInstitutionAuthenticationDialog(false);
          }}
        >
          <CloseIcon />
        </IconButton>
      </DialogTitle>
      <DialogContent>
        <Typography className={classes.description}>认证机构</Typography>
        <Typography className={classes.subDescription}>只需上传名片，查看全量数据，解锁更多功能</Typography>
        <input accept="image/*" className={classes.input} id="contained-button-file" multiple type="file" />
        <label htmlFor="contained-button-file">
          <img src={uploadCard} style={{ cursor: "pointer" }} />
        </label>
        <Typography className={classes.subDescription}></Typography>
        <ContactInformation />
      </DialogContent>
    </Dialog>
  );
};

export default InstitutionAuthenticationDialog;
