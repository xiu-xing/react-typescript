import { Button, InputAdornment, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import CounterContainer, { CounterState } from "../../../containers/counterContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      fontSize: "12px",
      cursor: "pointer",
      color: theme.palette.primary.main,
    },
  }),
);

interface EndAdornmentProps {
  disabled: boolean;
  sendVerificationCode(): void;
}

const EndAdornment: React.FunctionComponent<EndAdornmentProps> = (props) => {
  const classes = useStyles();
  const { count, countingStart } = CounterContainer.useContainer();

  return (
    <InputAdornment position="end">
      <Button
        className={classes.root}
        disabled={props.disabled || count > CounterState.stop}
        onClick={(): void => {
          props.sendVerificationCode();
          countingStart();
        }}
      >
        {count <= 0 ? "获取验证码" : `${count}s`}
      </Button>
    </InputAdornment>
  );
};

export default EndAdornment;
