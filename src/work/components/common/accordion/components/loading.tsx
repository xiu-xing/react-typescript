import { CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      height: 356,
      flexDirection: "row",
      justifyContent: "center",
      alignItems: "center",
    },
  }),
);

const CommonAccordionLoading: React.FunctionComponent = (props) => {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <CircularProgress size={30} />
    </div>
  );
};

export default CommonAccordionLoading;
