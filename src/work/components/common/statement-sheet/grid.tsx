import { createStyles, makeStyles } from "@material-ui/core";
import React from "react";
import { StatementSheetDataConfig, StatementSheetHeaderConfig } from "../../../generated/graphql";
import Grid from "../grid/core/grid";
import { GridColumn, GridRow } from "../grid/core/types";
import PercentageWidthColumnResizingPlugin from "../grid/plugins/column-resizing/percentage-width";
import StatementSheetCellRenderingPlugin from "./plugin/statement-sheet-cell-rendering";
import StatementSheetTreeGridPlugin from "./plugin/statement-sheet-tree-grid";

const useStyles = makeStyles(() =>
  createStyles({
    grid: {
      height: "100%",
      border: "1px solid rgba(0, 0, 0, 0.12)",
      "& th:not(:last-child)": {
        borderRight: "1px solid rgba(0, 0, 0, 0.12) !important",
      },
      "& td:not(:last-child)": {
        borderRight: "1px solid rgba(0, 0, 0, 0.12) !important",
        borderBottom: "none",
      },
    },
  }),
);

interface TreeDataGridProps {
  headerConfig: Map<string, StatementSheetHeaderConfig>;
  dataConfig: Map<string, StatementSheetDataConfig>;
  defaultExpandedRows?: string[];
  data: GridRow[];
  columns: GridColumn[];
}

const TreeDataGrid: React.FunctionComponent<TreeDataGridProps> = ({
  headerConfig,
  dataConfig,
  defaultExpandedRows,
  data,
  columns,
}) => {
  const classes = useStyles();
  const columnResizingPlugin = new PercentageWidthColumnResizingPlugin();
  const cellRenderingPlugin = new StatementSheetCellRenderingPlugin(dataConfig);
  const treeDataPlugin = new StatementSheetTreeGridPlugin(columns[0].name, defaultExpandedRows ?? [], headerConfig);

  return (
    <Grid
      rows={data}
      columns={columns}
      columnResizingPlugin={columnResizingPlugin}
      cellRenderingPlugin={cellRenderingPlugin}
      treeDataPlugin={treeDataPlugin}
      className={classes.grid}
      disableAnimation
    />
  );
};

export default TreeDataGrid;
