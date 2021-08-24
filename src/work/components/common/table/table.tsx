import {
  IntegratedPaging as DxIntegratedPaging,
  IntegratedSelection as DxIntegratedSelection,
  PagingState as DxPagingState,
  RowDetailState as DxRowDetailState,
  SelectionState as DxSelectionState,
  SortingState as DxSortingState,
  TableColumnWidthInfo as DxTableColumnWidthInfo,
} from "@devexpress/dx-react-grid";
import {
  DragDropProvider as DxDragDropProvider,
  Grid as DxGrid,
  Table as DxTable,
  TableColumnResizing as DxTableColumnResizing,
  TableColumnResizing,
  TableFixedColumns as DxTableFixedColumns,
  TableHeaderRow as DxTableHeaderRow,
  TableHeaderRow,
  TableRowDetail as DxTableRowDetail,
  TableSelection as DxTableSelection,
  VirtualTable,
} from "@devexpress/dx-react-grid-material-ui";
import { createTheme, IconButton } from "@material-ui/core";
import { createStyles, makeStyles, withStyles } from "@material-ui/core/styles";
import { ThemeProvider } from "@material-ui/styles";
import React, { HTMLProps, useMemo } from "react";
import { SVGClose, SVGOpen } from "./assets";
import TableSelectOperationCell from "./table-select-operation-cell";
import TableContainer from "./tableContainer";

type TableResizingMode = "widget" | "nextColumn";

/**
 * Props for Table
 *
 * @interface TableProps
 */
export interface TableProps extends HTMLProps<HTMLDivElement> {
  /**
   * Cell Component for custom configuration
   *
   * @memberof TableProps
   */
  cellComponent?: // eslint-disable-next-line @typescript-eslint/no-explicit-any
  React.ComponentClass<DxTable.DataCellProps, any> | React.FunctionComponent<DxTable.DataCellProps> | undefined;

  /**
   * Row Detail Content
   * @memberof TableProps
   */
  detailContentComponent?: (props: DxTableRowDetail.ContentProps) => React.ReactNode;

  /**
   * Row Detail Toggle Cell
   * @memberof TableProps
   */
  detailRowToggleCell?: (props: DxTableRowDetail.ToggleCellProps) => React.ReactNode;

  /**
   * Returns the text displayed in a cell when a table is empty
   *
   * @memberof TableProps
   */
  noDataCellMessage?: (message: string) => string;

  /**
   * Column component for custom configuration
   *
   * @memberof TableProps
   */
  columnComponent?: (props: DxTableHeaderRow.CellProps) => React.ReactNode;

  /**
   * a component that renders a header cell`s content
   *
   * @memberof TableProps
   */
  headerRowCellContent?: (props: DxTableHeaderRow.ContentProps) => React.ReactNode;

  /**
   * 	Additional column properties that the plugin can handle.
   * @memberof TableProps
   */
  columnExtensions?: DxTable.ColumnExtension[];

  /**
   * Specifies column widths.
   *
   * @type {DxTableColumnWidthInfo[]}
   * @memberof TableProps
   */
  columnWidths?: DxTableColumnWidthInfo[];

  /**
   * Handles column width changes.
   *
   * @memberof TableProps
   */

  onColumnWidthsChange?: (nextColumnWidths: DxTableColumnWidthInfo[]) => void;

  /**
   * Specifies the resizing mode: `widget` or `nextColumn`. In `widget` mode, `auto` and `percentage` values cannot be used to specify column widths.
   *
   * @type {TableResizingMode}
   * @memberof TableProps
   */
  resizeMode?: TableResizingMode;

  /**
   * Specifies a column's minimum width
   *
   * @type {number}
   * @memberof TableProps
   */
  minColumnWidth?: number;
  rowSelectable?: boolean;
  columnDraggable?: boolean;
  columnResizable?: boolean;
  columnSortable?: boolean;
  rowExpanded?: boolean;

  selectionCellSelectAllText?: string;
  selectionCellSelectPageText?: string;
  selectionCelldeselectAllText?: string;
  selectionCelldeselectPageText?: string;
  columnsSortableExtension?: DxSortingState.ColumnExtension[];
  columnResizeExtension?: TableColumnResizing.ColumnExtension[];
  virtualTable?: boolean;
  showFixedColumn?: boolean;
  noData?: boolean;
}

const theme = createTheme({
  palette: {
    primary: {
      main: "#4F709B",
    },
    secondary: {
      main: "#4F709B",
    },
  },
});

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: "100%",
      position: "relative",
    },
    cell: {
      padding: "0px !important",
      height: 30,
      borderTop: "1px solid transparent",
    },
    tableContainer: {},
    stubHeaderCell: {
      backgroundColor: "rgba(84,110,122,0.05)",
      borderBottomColor: "#EEE",
    },
    stubCell: {
      backgroundColor: "#FFF",
      borderBottomColor: "#EEE",
    },
    noDataCellTd: {
      textAlign: "center",
      padding: 32,
      border: "none",
    },
    noDataCell: {
      border: "none",
      color: "#666",
      fontFamily: "Noto Sans SC",
    },
    detailCell: {
      padding: 0,
      backgroundColor: "#fff",
    },
    selectionCell: {
      paddingRight: "8px",
      borderBottomColor: "#eee",
    },
    tableDetailRowToggleCell: {
      display: "table-cell",
      borderBottom: "1px solid #EEE",
      textAlign: "center",
      textOverflow: "initial",
      padding: 0,
      margin: "6px",
    },
    tableSelectionCell: {
      borderBottom: "1px solid #EEE",
    },
  }),
);

const gridNoDataCellStyle = createStyles({
  cell: {
    textAlign: "center",
    padding: 32,
    border: "none",
    color: "#666",
    fontFamily: "Noto Sans SC",
    position: "absolute !important" as "absolute",
    right: 0,
    left: 0,
  },
});

const gridHeaderRowCellStyle = createStyles({
  cell: {
    background: "#f6f8f8",
    height: 30,
    borderTop: "1px solid transparent",
    padding: "0px 16px !important",
    color: "#4F709B",
    borderBottomColor: "#EEE",
    fontWeight: 500,
  },
});

const dxHeaderRowTitleStyle = createStyles({
  title: {
    color: "#4F709B",
    fontSize: 12,
    fontWeight: 500,
    fontFamily: "Noto Sans SC",
  },
});

const dxTableSelectionCellStyle = createStyles({
  cell: {
    paddingRight: "8px",
    borderBottomColor: "#EEE",
  },
});

const dxTableSortLabelStyle = createStyles({
  root: {
    fontSize: 12,
    fontWeight: 500,
    fontFamily: "Noto Sans SC",
  },
});

const GridRootComponent:
  | React.ComponentClass<DxGrid.RootProps, never>
  | React.FunctionComponent<DxGrid.RootProps>
  | undefined = (props) => {
  const classes = useStyles();
  return <DxGrid.Root {...props} className={classes.root} />;
};

const VirtualTableContainerComponent:
  | React.ComponentClass<object, never>
  | React.FunctionComponent<object>
  | undefined = (props) => {
  return <VirtualTable.Container id="VirtualTable" {...props} />;
};

const GridCellComponent:
  | React.ComponentClass<DxTable.DataCellProps, never>
  | React.FunctionComponent<DxTable.DataCellProps>
  | undefined = (props: DxTable.DataCellProps) => {
  const classes = useStyles();
  return <DxTable.Cell {...props} className={classes.cell} />;
};

const GridStubHeaderCellComponent:
  | React.ComponentClass<DxTable.CellProps, never>
  | React.FunctionComponent<DxTable.CellProps>
  | undefined = (props) => {
  const classes = useStyles();
  return <DxTable.StubHeaderCell {...props} className={classes.stubHeaderCell} />;
};

const GridStubCellComponent:
  | React.ComponentClass<DxTable.CellProps, never>
  | React.FunctionComponent<DxTable.CellProps>
  | undefined = (props) => {
  const classes = useStyles();
  return <DxTable.StubCell {...props} className={classes.stubCell} />;
};

const GridHeaderRowContentComponent:
  | React.ComponentClass<DxTableHeaderRow.ContentProps, unknown>
  | React.FunctionComponent<DxTableHeaderRow.ContentProps>
  | undefined = (props) => {
  return <DxTableHeaderRow.Content {...props} />;
};

const GridHeaderRowCellComponent = withStyles(gridHeaderRowCellStyle)((props: TableHeaderRow.CellProps) => {
  return <DxTableHeaderRow.Cell {...props} />;
});

const GridHeaderRowTitleComponent = withStyles(dxHeaderRowTitleStyle)((props) => {
  return <DxTableHeaderRow.Title {...props} />;
});

const DxTableSelectionCellComponent = withStyles(dxTableSelectionCellStyle)((props: DxTableSelection.CellProps) => {
  if (props.tableRow.row && props.tableRow.row.isBlur) {
    // const { tableRow, tableColumn, ...leftProps } = props;
    return <DxTableSelection.Cell {...props} style={{ filter: "blur(4px)", pointerEvents: "none" }} />;
  }
  return <DxTableSelection.Cell {...props} />;
});

const SelectOperationCell: React.FunctionComponent<DxTableSelection.HeaderCellProps> = (props) => {
  return <TableSelectOperationCell {...props} />;
};

const DxTableFixedCellComponent:
  | React.ComponentClass<DxTableFixedColumns.CellProps, never>
  | React.FunctionComponent<DxTableFixedColumns.CellProps>
  | undefined = (props: DxTableFixedColumns.CellProps) => {
  return <DxTableFixedColumns.Cell {...props} />;
};

const DxTableRowComponent: // eslint-disable-next-line @typescript-eslint/no-explicit-any
React.ComponentClass<DxTable.DataRowProps, any> | React.FunctionComponent<DxTable.DataRowProps> | undefined = (
  props: DxTable.DataRowProps,
) => {
  return <DxTable.Row {...props} />;
};

const DxTableSortLabelComponent = withStyles(dxTableSortLabelStyle)((props: DxTableHeaderRow.SortLabelProps) => {
  if (props.disabled) {
    return <DxTableHeaderRow.SortLabel {...props}>{props.column.title}</DxTableHeaderRow.SortLabel>;
  }
  return (
    <DxTableHeaderRow.SortLabel {...props} title="按住 Shift 键可排序多列, 按住 Ctrl 键可取消排序列（macOS 为 ⌘ 键）" />
  );
});

const Table: React.FunctionComponent<TableProps> = (props) => {
  const classes = useStyles();
  const {
    className,
    rowExpanded,
    columnDraggable,
    cellComponent,
    columnExtensions,
    noDataCellMessage,
    columnResizable,
    minColumnWidth,
    columnWidths,
    columnSortable,
    onColumnWidthsChange,
    detailRowToggleCell,
    detailContentComponent,
    rowSelectable,
    columnsSortableExtension,
    columnResizeExtension,
    virtualTable,
    showFixedColumn,
    noData,
    style,
    ...leftProps
  } = props;
  const {
    rows,
    columns,
    selectedRows,
    setSelectedRows,
    page,
    pageSize,
    sortingColumns,
    onSortingChange,
    leftFixedColumns,
    rightFixedColumns,
  } = TableContainer.useContainer();

  const GridNoDataCellComponent = withStyles(gridNoDataCellStyle)((props: DxTable.NoDataCellProps) => {
    if (!noData) {
      return null;
    }
    return (
      <DxTable.NoDataCell {...props} getMessage={noDataCellMessage ? noDataCellMessage : (): string => "暂无数据"} />
    );
  });

  const tableNodes = useMemo(() => {
    return (
      <ThemeProvider theme={theme}>
        <DxGrid rootComponent={GridRootComponent} rows={rows} columns={columns}>
          {rowExpanded ? <DxRowDetailState defaultExpandedRowIds={[]} /> : null}
          {rowSelectable ? (
            <DxSelectionState
              selection={selectedRows}
              onSelectionChange={(selection): void => {
                setSelectedRows(selection as number[]);
              }}
            />
          ) : null}
          {rowSelectable ? <DxIntegratedSelection /> : null}
          {columnDraggable ? <DxDragDropProvider /> : null}
          <DxPagingState defaultCurrentPage={page} currentPage={page} defaultPageSize={pageSize} pageSize={pageSize} />
          <DxIntegratedPaging />
          {columnSortable ? (
            <DxSortingState
              columnSortingEnabled={false}
              sorting={sortingColumns}
              onSortingChange={onSortingChange}
              columnExtensions={columnsSortableExtension}
            />
          ) : null}
          {virtualTable ? (
            <VirtualTable
              containerComponent={VirtualTableContainerComponent}
              height="auto"
              estimatedRowHeight={30}
              rowComponent={DxTableRowComponent}
              cellComponent={cellComponent ? cellComponent : GridCellComponent}
              stubHeaderCellComponent={GridStubHeaderCellComponent}
              stubCellComponent={GridStubCellComponent}
              columnExtensions={columnExtensions}
              noDataCellComponent={GridNoDataCellComponent}
            />
          ) : (
            <DxTable
              rowComponent={DxTableRowComponent}
              cellComponent={cellComponent ? cellComponent : GridCellComponent}
              stubHeaderCellComponent={GridStubHeaderCellComponent}
              stubCellComponent={GridStubCellComponent}
              columnExtensions={columnExtensions}
              noDataCellComponent={GridNoDataCellComponent}
            />
          )}
          {/* <DxTableColumnReordering order={columnOrder} onOrderChange={setColumnOrder} /> */}
          {columnResizable && (
            <DxTableColumnResizing
              columnExtensions={columnResizeExtension}
              minColumnWidth={minColumnWidth}
              columnWidths={columnWidths}
              onColumnWidthsChange={onColumnWidthsChange}
              resizingMode="nextColumn"
            />
          )}
          <DxTableHeaderRow
            contentComponent={GridHeaderRowContentComponent}
            cellComponent={GridHeaderRowCellComponent}
            titleComponent={GridHeaderRowTitleComponent}
            {...(columnSortable
              ? {
                  showSortingControls: true,
                  sortLabelComponent: DxTableSortLabelComponent,
                  messages: {
                    sortingHint: "",
                  },
                }
              : {})}
          />

          {rowExpanded ? (
            <DxTableRowDetail
              toggleCellComponent={(cellProps): JSX.Element => (
                <td className={classes.tableDetailRowToggleCell}>
                  {detailRowToggleCell ? (
                    detailRowToggleCell(cellProps)
                  ) : (
                    <IconButton style={{ padding: "4px" }} onClick={cellProps.onToggle}>
                      {cellProps.expanded ? <SVGClose /> : <SVGOpen />}
                    </IconButton>
                  )}
                </td>
              )}
              cellComponent={(rowProps): JSX.Element =>
                detailContentComponent ? (
                  <DxTableRowDetail.Cell {...rowProps} className={classes.detailCell}>
                    {detailContentComponent(rowProps)}
                  </DxTableRowDetail.Cell>
                ) : (
                  <DxTableRowDetail.Cell {...rowProps} className={classes.detailCell} />
                )
              }
            />
          ) : null}
          {rowSelectable ? (
            <DxTableSelection
              showSelectAll
              headerCellComponent={SelectOperationCell}
              cellComponent={DxTableSelectionCellComponent}
            />
          ) : null}

          {showFixedColumn ? (
            <DxTableFixedColumns
              leftColumns={[DxTableSelection.COLUMN_TYPE, ...leftFixedColumns]}
              rightColumns={rightFixedColumns}
              cellComponent={DxTableFixedCellComponent}
            />
          ) : null}
        </DxGrid>
      </ThemeProvider>
    );
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [
    rowExpanded,
    columnDraggable,
    cellComponent,
    columnExtensions,
    noDataCellMessage,
    columnResizable,
    minColumnWidth,
    columnWidths,
    columnSortable,
    onColumnWidthsChange,
    detailRowToggleCell,
    detailContentComponent,
    rowSelectable,
    columnsSortableExtension,
    columnResizeExtension,
    virtualTable,
    showFixedColumn,
    noData,

    rows,
    columns,
    selectedRows,
    setSelectedRows,
    page,
    pageSize,
    sortingColumns,
    onSortingChange,
    leftFixedColumns,
    rightFixedColumns,
  ]);

  return (
    <div className={className} style={{ ...style, position: "relative" }} {...leftProps}>
      {tableNodes}
    </div>
  );
};

export default Table;
