import { Column as DxColumn } from "@devexpress/dx-react-grid";

export interface GridColumn extends DxColumn {
  minWidth: number;
  draggable?: boolean;
  isFixed?: boolean;
}

export interface GridRow {
  id: string;
  entity?: string;
}

export interface GridColumnWidth {
  id: string;
  width: number;
  fixed?: boolean;
  leftSpace?: number;
}
