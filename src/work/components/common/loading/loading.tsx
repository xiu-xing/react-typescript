import CircularProgress, { CircularProgressProps } from "@material-ui/core/CircularProgress";
import { makeStyles, Theme } from "@material-ui/core/styles";
import React, { FunctionComponent } from "react";

// Inspired by the Facebook spinners.
const useStyles = makeStyles((theme: Theme) => ({
  root: {
    width: 22,
    height: 22,
    position: "relative",
  },
  top: {
    color: "#d3e6ee",
    position: "absolute",
  },
  bottom: {
    color: theme.palette.primary.main,
    animationDuration: "550ms",
    position: "absolute",
  },
}));

const Loading: FunctionComponent<CircularProgressProps> = (props) => {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <CircularProgress variant="determinate" value={100} className={classes.top} size={22} thickness={4} {...props} />
      <CircularProgress
        variant="indeterminate"
        disableShrink
        className={classes.bottom}
        size={22}
        thickness={4}
        {...props}
      />
    </div>
  );
};

export default Loading;
