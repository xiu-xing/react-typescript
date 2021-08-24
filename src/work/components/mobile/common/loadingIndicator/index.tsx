import { Box, CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    text: {
      textAlign: "center",
      paddingTop: 12,
      color: "#666",
      height: 50,
      display: "flex",
      justifyContent: "center",
    },
  }),
);

interface LoadingIndicatorProps {
  hasNextPage?: boolean;
}

const LoadingIndicator: React.FunctionComponent<LoadingIndicatorProps> = ({ hasNextPage = true }) => {
  const classes = useStyles();

  return hasNextPage ? (
    <Box display="grid" alignItems="center" justifyContent="center">
      <CircularProgress size={30} />
    </Box>
  ) : (
    <div className={classes.text}>滑到底啦！</div>
  );
};

export default LoadingIndicator;
