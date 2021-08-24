import { Box, CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: 50,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
    noData: {},
    noMore: {
      color: "#9b9b9b",
      fontSize: 14,
    },
  }),
);

interface ListLoadingBarProps {
  state: "loading" | "noData" | "noMore";
  circularProgressSize?: number;
  noDataText?: string;
  noMoreText?: string;
  noData?: JSX.Element;
  noMore?: JSX.Element;
}

const ListLoadingBar: React.FunctionComponent<ListLoadingBarProps> = ({
  state,
  circularProgressSize = 30,
  noDataText = "没有数据",
  noMoreText = "没有更多",
  noData,
  noMore,
}) => {
  const classes = useStyles();
  const getContent = (): JSX.Element => {
    switch (state) {
      case "loading":
        return <CircularProgress size={circularProgressSize} disableShrink />;
      case "noData":
        return noData ? noData : <Typography className={classes.noData}>{noDataText}</Typography>;
      case "noMore":
        return noMore ? noMore : <Typography className={classes.noMore}>{noMoreText}</Typography>;
    }
  };
  return <Box className={classes.root}>{getContent()}</Box>;
};

export default ListLoadingBar;
