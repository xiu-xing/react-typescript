import { Button } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { TableColumnPlusAfter } from "mdi-material-ui";
import TableContainer from "../../tableContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      whiteSpace: "nowrap",
    },
    icon: {
      marginRight: 8,
      color: "rgba(0, 0, 0, 0.6)",
    },
  }),
);

const EditColumnsButton: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const tableContainer = TableContainer.useContainer();
  return (
    <Button
      className={classes.root}
      onClick={(): void => {
        tableContainer.setColumnConfigurationDialogOpen(true);
      }}
    >
      <TableColumnPlusAfter className={classes.icon} />
      编辑列
    </Button>
  );
};

export default EditColumnsButton;
