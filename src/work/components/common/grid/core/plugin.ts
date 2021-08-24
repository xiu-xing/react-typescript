import { ReactNode } from "react";
import { GridColumn, GridColumnWidth, GridRow } from "./types";

export interface GridColumnResizingPlugin {
  calculateColumnWidths: (
    tableWidth: number,
    columns: GridColumn[],
    columnOrders?: string[],
    showSelectionColumn?: boolean,
  ) => GridColumnWidth[];
}

export interface GridCellRenderingPlugin {
  renderingHeaderCell: (row: GridRow, column: GridColumn) => ReactNode;
  renderingCell: (row: GridRow, column: GridColumn) => ReactNode;
  renderingSelectionCell?: (row: GridRow) => ReactNode;
  renderingStubHeaderCell?: () => ReactNode;
}

export interface GridTreeDataPlugin {
  expandColumnId: () => string;
  defaultExpandedRows?: () => Array<number | string>;
  onExpandedRowIdsChange?: (expandedRowIds: Array<number | string>) => void;
  renderingExpandButton?: (visible: boolean, expanded: boolean, onToggle: () => void) => ReactNode;
  renderingTreeCell?: (row: unknown, column: GridColumn, children: ReactNode) => ReactNode;
}
