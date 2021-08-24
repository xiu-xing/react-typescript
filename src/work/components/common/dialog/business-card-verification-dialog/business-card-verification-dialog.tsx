import {
  Box,
  Button,
  createStyles,
  Dialog,
  DialogClassKey,
  DialogTitle,
  IconButton,
  makeStyles,
  StyledComponentProps,
  Theme,
  Typography,
} from "@material-ui/core";
import CloseIcon from "@material-ui/icons/Close";
import clsx from "clsx";
import { useRouter } from "next/router";
import { destroyCookie } from "nookies";
import React from "react";
import ContactInformation from "../../contact-information";
import Logo from "../assets/logo.svg";
import CheckBusinessCard from "./components/check-business-card";
import CheckPhoneOrEmail from "./components/check-phone-or-email";
import UploadBusinessCard from "./components/upload-business-card";
import BusinessCardVerificationDialogContainer, { BusinessCardVerificationDialogIninitialState } from "./container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    titleBox: {
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
    },
    title: {
      margin: 0,
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: 500,
    },
    changeAccountButton: {
      position: "relative",
      right: -8,
    },
    subDescription: {
      margin: "4px 0 16px 0",
      fontSize: 16,
      lineHeight: "24px",
      color: "#737373",
      fontWeight: 400,
    },
    activeDialog: {
      minWidth: 480,
      width: 480,
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
    input: {
      display: "none",
    },
    footerBox: {
      margin: 0,
    },
  }),
);

function getStepContent(index: number): React.ReactNode {
  switch (index) {
    case 0:
      return <UploadBusinessCard />;
    case 1:
      return <CheckBusinessCard />;
    case 2:
      return <CheckPhoneOrEmail />;
    default:
      return <></>;
  }
}

interface BusinessCardVerificationDialogDisplayProps extends StyledComponentProps<DialogClassKey> {
  disableCloseIcon?: boolean;
  hideBackdrop?: boolean;
}

const BusinessCardVerificationDialogDisplay: React.FunctionComponent<BusinessCardVerificationDialogDisplayProps> = (
  props,
) => {
  const classes = useStyles();
  const { open, activeStep, onClose, steps } = BusinessCardVerificationDialogContainer.useContainer();
  const router = useRouter();

  function onChangeAccountButtonClick(): void {
    destroyCookie(null, "access_token", {
      path: "/",
    });
    router.push("/login");
  }

  return (
    <Dialog
      classes={{ paper: clsx(classes.activeDialog, props.classes?.paper) }}
      open={open}
      hideBackdrop={props.hideBackdrop}
    >
      <DialogTitle classes={{ root: classes.dialogTitle }}>
        <Logo />
        {!props.disableCloseIcon && (
          <IconButton
            aria-label="close"
            className={classes.proDialogCloseButton}
            onClick={(): void => {
              onClose?.();
            }}
          >
            <CloseIcon />
          </IconButton>
        )}
      </DialogTitle>
      <Box padding="24px 32px">
        <div className={classes.titleBox}>
          <Typography className={classes.title}>{steps[activeStep]}</Typography>
          <Button color="primary" className={classes.changeAccountButton} onClick={onChangeAccountButtonClick}>
            换个账号？
          </Button>
        </div>
        {getStepContent(activeStep)}
        <ContactInformation />
      </Box>
    </Dialog>
  );
};

interface BusinessCardVerificationDialogProps
  extends BusinessCardVerificationDialogIninitialState,
    BusinessCardVerificationDialogDisplayProps {}

const BusinessCardVerificationDialog: React.FunctionComponent<BusinessCardVerificationDialogProps> = (props) => {
  const { disableCloseIcon, classes, hideBackdrop, ...restProps } = props;

  return (
    <BusinessCardVerificationDialogContainer.Provider initialState={restProps}>
      <BusinessCardVerificationDialogDisplay
        disableCloseIcon={disableCloseIcon}
        classes={classes}
        hideBackdrop={hideBackdrop}
      />
    </BusinessCardVerificationDialogContainer.Provider>
  );
};

export default BusinessCardVerificationDialog;
