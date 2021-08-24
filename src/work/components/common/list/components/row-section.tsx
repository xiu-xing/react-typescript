import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import ListSubheader from "@material-ui/core/ListSubheader";
import { EXTRA_HORIZONTAL_PADDING } from '../list'

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      borderRadius: EXTRA_HORIZONTAL_PADDING,
      paddingLeft: EXTRA_HORIZONTAL_PADDING,
    },
  }),
);

// interface RowSectionProps {}

const RowSection: React.FunctionComponent<{}> = ({ children }) => {
  const classes = useStyles();
return <ListSubheader className={classes.root}>{children}</ListSubheader>;
}

export default RowSection;