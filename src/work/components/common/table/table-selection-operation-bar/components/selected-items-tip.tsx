import { Box, Typography } from "@material-ui/core";
import React from "react";
import { useStyles } from "../table-selection-operation-bar";
import TableContainer from "../../tableContainer";

const SelectedItemTip: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const tableContainer = TableContainer.useContainer();
  return (
    <Box className={classes.action}>
      <Typography className={classes.actionText}>{`已选中 ${tableContainer.selectedRows.length} 项`}</Typography>
    </Box>
  );
};

export default SelectedItemTip;
