import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import MuiListItem from "@material-ui/core/ListItem";
import { EXTRA_HORIZONTAL_PADDING } from "../list";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      borderRadius: EXTRA_HORIZONTAL_PADDING,
      paddingLeft: EXTRA_HORIZONTAL_PADDING,
    },
  }),
);

const ListItem: React.FunctionComponent<{}> = ({ children }) => {
  const classes = useStyles();
  return (
    <MuiListItem className={classes.root} classes={classes} dense>
      {children}
    </MuiListItem>
  );
};

export default ListItem;
