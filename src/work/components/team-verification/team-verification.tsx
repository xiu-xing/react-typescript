import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { SVGBackground } from "../authorization/assets/svg";
import BusinessCardVerificationDialog from "../common/dialog/business-card-verification-dialog/business-card-verification-dialog";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: "100vh",
      width: "100vw",
      position: "relative",
      backgroundColor: "#fcfcfc",
      minHeight: 660,
    },
    backgroundImg: {
      width: "100%",
      height: "100%",
      position: "fixed",
      pointerEvents: "none",
    },
    dialogPaper: {
      boxShadow:
        "0px 5px 6px -3px rgba(247, 247, 247, 0.2), 0px 9px 12px 1px rgba(241, 227, 227, 0.14), 0px 16px 22px 15px rgba(96, 96, 96, 0.12)",
    },
  }),
);

const TeamVerification: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <SVGBackground className={classes.backgroundImg} />
      <BusinessCardVerificationDialog
        open={true}
        initialStep={0}
        classes={{ paper: classes.dialogPaper }}
        hideBackdrop
        disableCloseIcon
      />
    </div>
  );
};

export default TeamVerification;
