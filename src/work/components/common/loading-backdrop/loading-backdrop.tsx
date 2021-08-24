import { Backdrop, CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    backdrop: {
      zIndex: 1299,
      color: "#fff",
    },
  }),
);

interface LoadingBackdropProps {
  open: boolean;
  onClick?: () => void;
}

/**
 * 遮罩
 * @param props
 */
const LoadingBackdrop: React.FunctionComponent<LoadingBackdropProps> = (props) => {
  const classes = useStyles();

  const { open, onClick } = props;

  return (
    <Backdrop
      className={classes.backdrop}
      open={open}
      onClick={(): void => {
        onClick?.();
      }}
    >
      <CircularProgress color="inherit" size={30} />
    </Backdrop>
  );
};

export default LoadingBackdrop;
