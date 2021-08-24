import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useTabContext } from "@material-ui/lab";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    result: {
      width: "100%",
      padding: "0px 24px",
      overflowY: "scroll",
      overflowX: "hidden",
      "&:hover": {
        overflowY: "scroll",
      },
      "&::-webkit-scrollbar": {
        height: 5,
        width: 5,
      },
      "&::-webkit-scrollbar-thumb": {
        borderRadius: 2.5,
        backgroundColor: "rgba(0, 0, 0, 0.2)",
      },
    },
    container: {
      width: "100%",
      height: "calc(100vh - 144px)",
    },
    content: {
      display: "flex",
      height: "100%",
      flexDirection: "column",
      alignItems: "center",
      padding: "16px 0px 0px",
    },
  }),
);

interface TabsProps {
  tabId: string;
}

const TabPanel: React.FunctionComponent<TabsProps> = (props) => {
  const classes = useStyles();
  const tabContext = useTabContext();

  return (
    <Box className={classes.result} hidden={props.tabId !== tabContext?.value}>
      <Box className={classes.container}>
        <Box className={classes.content}>{props.children}</Box>
      </Box>
    </Box>
  );
};

export default TabPanel;
