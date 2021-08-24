import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: 24,
      display: "grid",
      gridAutoFlow: "column",
      gridAutoColumns: "1fr 15px 1fr",
    },
    or: {
      color: "#999",
      fontSize: "14px",
    },
    left: {
      marginTop: "14px",
      marginBottom: "9px",
      background: "linear-gradient(45deg,white,#EEEEEE)",
      marginRight: "8px",
    },
    right: {
      marginTop: "14px",
      marginBottom: "9px",
      background: "linear-gradient(45deg,#EEEEEE,white)",
      marginLeft: "8px",
    },
  }),
);

const OR: React.FunctionComponent = () => {
  const classes = useStyles();
  return (
    <Box className={classes.root}>
      <Box className={classes.left} />
      <Typography className={classes.or}>or</Typography>
      <Box className={classes.right} />
    </Box>
  );
};

export default OR;
