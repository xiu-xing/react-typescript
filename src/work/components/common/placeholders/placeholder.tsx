import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: 200,
      width: "100%",
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
  }),
);

interface PlaceholderProps {
  content?: ReactNode;
}

const Placeholder: React.FunctionComponent<PlaceholderProps> = props => {
  const classes = useStyles();
  const { content = "暂无数据" } = props;
  return (
    <Typography component="div" noWrap className={classes.root}>
      <Box color="#666">{content}</Box>
    </Typography>
  );
};

export default Placeholder;
