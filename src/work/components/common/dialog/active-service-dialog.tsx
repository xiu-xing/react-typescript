import { Dialog, DialogContent, DialogTitle, IconButton, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import CloseIcon from "@material-ui/icons/Close";
import React from "react";
import UserContainer from "../../../containers/userContainer";
import ContactInformation from "../contact-information";
import Logo from "./assets/logo.svg";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    description: {
      margin: "16px 0 0 0",
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
    proDialogRoot: {
      minWidth: 479,
      width: 479,
      minHeight: 320,
      height: 320,
    },
    proDialogCloseButton: {
      position: "absolute",
      right: 0,
      top: 4,
      color: "#ffffff",
    },
    qrImg: {
      width: 100,
      height: 100,
    },
    contactInfoTitle: {
      marginBottom: "8px",
      fontWeight: 500,
      fontSize: "16px",
      color: "#333333",
    },
    contactInfo: {
      marginBottom: "1px",
      fontWeight: 400,
      fontSize: "14px",
      color: "#666666",
    },
    dialogTitle: {
      background: theme.palette.primary.main,
      color: "#ffffff",
      paddingBottom: "12px",
    },
  }),
);

const ActiveServiceDialog: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { activeServiceDialogOpen, setActiveServiceDialogOpen } = UserContainer.useContainer();

  return (
    <Dialog classes={{ paper: classes.proDialogRoot }} open={activeServiceDialogOpen}>
      <DialogTitle classes={{ root: classes.dialogTitle }}>
        <Logo />
        <IconButton
          aria-label="close"
          className={classes.proDialogCloseButton}
          onClick={(): void => {
            setActiveServiceDialogOpen(false);
          }}
        >
          <CloseIcon />
        </IconButton>
      </DialogTitle>
      <DialogContent>
        <Typography className={classes.description}>购买正式账号，查看全量数据，解锁更多功能</Typography>
        <Typography className={classes.subDescription}>
          添加下方客服微信，购买 RIME DATA 正式账号 ，拥有更丰富的市场研究数据，助您全面掌握市场新动态。
        </Typography>
        <Typography className={classes.subDescription}></Typography>
        <ContactInformation />
      </DialogContent>
    </Dialog>
  );
};

export default ActiveServiceDialog;
