import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
// import { ToolbarHeight } from "../../advanced-seach/advanced-search-display";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: 48,
    },
  }),
);

const ToolbarPlaceholder: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  return <div className={classes.root} />;
};

export default ToolbarPlaceholder;
