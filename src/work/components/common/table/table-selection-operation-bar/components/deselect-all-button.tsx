import { ButtonBase } from "@material-ui/core";
import React from "react";
import { useStyles } from "../table-selection-operation-bar";
import TableContainer from "../../tableContainer";
import clsx from "clsx";

interface DeselectAllButtonProps {
  title?: string;
}

const DeselectAllButton: React.FunctionComponent<DeselectAllButtonProps> = ({ title = "取消选择" }) => {
  const classes = useStyles();
  const tableContainer = TableContainer.useContainer();
  return (
    <ButtonBase color="inherit" onClick={tableContainer.deselectAll} className={clsx(classes.action, classes.actionText)}>
      {title}
    </ButtonBase>
  );
};

export default DeselectAllButton;
