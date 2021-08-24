import _ from "lodash";
import { GridColumnResizingPlugin } from "../../core/plugin";
import { GridColumn, GridColumnWidth } from "../../core/types";

export default class PercentageWidthColumnResizingPlugin implements GridColumnResizingPlugin {
  calculateColumnWidths(
    tableWidth: number,
    columns: GridColumn[],
    columnOrders?: string[],
    showSelectionColumn?: boolean,
  ): GridColumnWidth[] {
    const totalColumnMinWidth = _.sum(columns.map((column) => column.minWidth));
    const columnWidths: GridColumnWidth[] = [];
    let leftSpace = 0;

    if (showSelectionColumn) {
      columnWidths.push({
        id: "selection",
        width: 64,
        fixed: true,
        leftSpace: 0,
      });
      leftSpace += 64;
    }

    let avaliableTableWidth = tableWidth - 2; // -2px just for the extra border
    showSelectionColumn && (avaliableTableWidth -= 64);

    if (totalColumnMinWidth < tableWidth) {
      if (columnOrders) {
        columnOrders.forEach((columnOrder) => {
          const column = columns.find((column) => column.name === columnOrder);
          if (!column) {
            return;
          }
          const columnWidth = Math.round((column.minWidth / totalColumnMinWidth) * avaliableTableWidth);
          columnWidths.push({
            id: column.name,
            width: columnWidth,
            fixed: column.isFixed,
            leftSpace: leftSpace,
          });
          if (column.isFixed) {
            leftSpace += columnWidth;
          }
        });
      } else {
        columns.forEach((column) => {
          const columnWidth = Math.round((column.minWidth / totalColumnMinWidth) * avaliableTableWidth);
          columnWidths.push({
            id: column.name,
            width: columnWidth,
            fixed: column.isFixed,
            leftSpace: leftSpace,
          });
        });
      }
    } else {
      if (columnOrders) {
        columnOrders.forEach((columnOrder) => {
          const column = columns.find((column) => column.name === columnOrder);
          if (!column) {
            return;
          }
          const columnWidth = column.minWidth;
          columnWidths.push({
            id: column.name,
            width: columnWidth,
            fixed: column.isFixed,
            leftSpace: leftSpace,
          });
          if (column.isFixed) {
            leftSpace += columnWidth;
          }
        });
      } else {
        columns.forEach((column) => {
          columnWidths.push({
            id: column.name,
            width: column.minWidth,
            fixed: column.isFixed,
            leftSpace: leftSpace,
          });
        });
      }
    }

    return columnWidths;
  }
}
