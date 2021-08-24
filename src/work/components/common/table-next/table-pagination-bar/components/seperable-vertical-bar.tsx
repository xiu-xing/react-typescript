import { Box } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import {TABLE_PAGINATION_BAR_HEIGHT} from '../table-pagination-bar'

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "2px",
      height: TABLE_PAGINATION_BAR_HEIGHT,
      background: "#F8F8F8",
      marginLeft: theme.spacing(2),
      marginRight: theme.spacing(2),
    },
  }),
);

const SeperableVerticalBar: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  return <Box className={classes.root} />;
}

export default SeperableVerticalBar;