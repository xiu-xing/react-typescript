import { Box, Button, createStyles, makeStyles, Typography } from "@material-ui/core";
import { MagnifyMinus, MagnifyPlus } from "mdi-material-ui";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: 280,
      height: 40,
      position: "absolute",
      top: 20,
      right: 0,
      display: "grid",
      backgroundColor: "#fff",
      gridAutoFlow: "column",
      userSelect: "none",
    },
    button: {
      userSelect: "none",
      "& .MuiButton-label": {
        userSelect: "none",
      },
    },
    itemBox: {
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      flexDirection: "row",
      userSelect: "none",
    },
    icon: {
      fontSize: 22,
      color: "rgba(0, 0, 0, 0.54)",
    },
    text: {
      marginLeft: 6,
      fontSize: 12,
      color: "#666",
      fontWeight: 500,
      userSelect: "none",
    },
  }),
);

interface OperationPanelProps {
  zoomOut?: () => void;
  zoomIn?: () => void;
}

const OperationPanel: React.FunctionComponent<OperationPanelProps> = (props) => {
  const classes = useStyles();
  const { zoomOut, zoomIn } = props;

  return (
    <Box className={classes.root}>
      <Button onClick={() => zoomOut && zoomOut()} className={classes.button}>
        <Box className={classes.itemBox}>
          <MagnifyPlus className={classes.icon} />
          <Typography className={classes.text}>放大</Typography>
        </Box>
      </Button>
      <Button onClick={() => zoomIn && zoomIn()} className={classes.button}>
        <Box className={classes.itemBox}>
          <MagnifyMinus className={classes.icon} />
          <Typography className={classes.text}>缩小</Typography>
        </Box>
      </Button>
    </Box>
  );
};

export default OperationPanel;
