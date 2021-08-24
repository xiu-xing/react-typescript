import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
  }),
);

interface SheetTabProps { }

const SheetTab: React.FunctionComponent<SheetTabProps> = (props) => {
  const classes = useStyles();
  return <div className={classes.root}>Sheet</div>;
};

export default SheetTab;
