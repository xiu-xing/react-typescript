import { Button, createStyles, IconButton, InputAdornment, makeStyles, Theme } from "@material-ui/core";
import { Visibility, VisibilityOff } from "@material-ui/icons";
import React from "react";
import CounterContainer, { CounterState } from "../../../containers/counterContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    visibleIconButton: {
      fontSize: "1rem",
      padding: 5,
    },
    verificationButton: {
      fontSize: 14,
      borderRadius: 5,
      padding: 4,
    },
    verificationLink: {
      //color: "#999999",
    },
    verificationLinkActive: {
      color: theme.palette.primary.main,
    },
  }),
);

interface EndAdornmentProps {
  disabled?: boolean;
  sendVerificationCode?: (callback?: (success: boolean) => void) => void;
  visible?: boolean;
  setVisible?: (visible: boolean) => void;
  buttonType: ButtonType;
}

export enum ButtonType {
  VERIFICATION_CODE = "verification_code",
  PASSWORD = "password",
}

/**
 * Render a EndAdornment in input field
 */
const EndAdornmentContent: React.FunctionComponent<EndAdornmentProps> = ({
  disabled = false,
  sendVerificationCode,
  visible,
  buttonType,
  setVisible,
}) => {
  const classes = useStyles();

  const { count, countingStart, countingStop } = CounterContainer.useContainer();

  function verificationCodeCounterHandler(): void {
    if (sendVerificationCode) {
      sendVerificationCode((success: boolean): void => {
        if (!success) {
          countingStop();
        }
      });
      countingStart();
    }
  }

  function visibilityIconButtonHandler(): void {
    if (setVisible) {
      setVisible(!visible);
    }
  }

  const renderVerificationCodeButton: React.ReactNode = (
    <Button
      onClick={verificationCodeCounterHandler}
      disabled={disabled || count > CounterState.stop}
      className={classes.verificationButton}
      aria-label="toggle password visibility"
      color="primary"
    >
      {count <= 0 ? (
        "获取验证码"
      ) : (
        <>
          <span className={classes.verificationLink}>{count}</span> s
        </>
      )}
    </Button>
  );

  const renderPasswordVisibilityButton: React.ReactNode = (
    <IconButton
      onClick={visibilityIconButtonHandler}
      className={classes.visibleIconButton}
      aria-label="toggle password visibility"
    >
      {visible ? <Visibility /> : <VisibilityOff />}
    </IconButton>
  );

  return (
    <InputAdornment position="end">
      {ButtonType.PASSWORD === buttonType ? renderPasswordVisibilityButton : null}
      {ButtonType.VERIFICATION_CODE === buttonType ? renderVerificationCodeButton : null}
    </InputAdornment>
  );
};

const EndAdornment: React.FunctionComponent<EndAdornmentProps> = (props) => {
  return (
    <CounterContainer.Provider>
      <EndAdornmentContent {...props} />
    </CounterContainer.Provider>
  );
};

export default EndAdornment;
