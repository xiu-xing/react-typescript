import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import TableContainer from "../../tableContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      marginLeft: theme.spacing(2),
      marginRight: theme.spacing(2),
      fontSize: "14px",
      whiteSpace: "nowrap",
      color: '#333',
    },
  }),
);

interface PageDetailsProps {
  currentPage: number;
  totalPage: number;
}

const PageDetails: React.FunctionComponent<PageDetailsProps> = props => {
  const classes = useStyles();
  const tableContainer = TableContainer.useContainer();
  if (tableContainer.rowCount !== 0) {
    return <Typography className={classes.root}>{`${props.currentPage + 1} / ${props.totalPage}`}</Typography>;
  } else {
    return <Typography className={classes.root}>{`- / -`}</Typography>;
  }
};

export default PageDetails;
