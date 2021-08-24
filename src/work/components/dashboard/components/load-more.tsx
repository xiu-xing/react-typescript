import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { ChevronRight } from "mdi-material-ui";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
    },
    label: {
      fontSize: 14,
      fontWeight: 500,
      color: theme.palette.primary.main,
    },
    icon: {
      fontSize: 16,
      color: theme.palette.primary.main,
    },
  }),
);

interface LoadMoreProps {}

const LoadMore: React.FunctionComponent<LoadMoreProps> = (props) => {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <Typography className={classes.label}>查看更多</Typography>
      <ChevronRight className={classes.icon} />
    </div>
  );
};

export default LoadMore;
