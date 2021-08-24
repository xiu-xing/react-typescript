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
  Grid as DxGrid,
  Table as DxTable,
  TableColumnResizing,
  TableFixedColumns as DxTableFixedColumns,
  TableHeaderRow as DxTableHeaderRow,
  TableHeaderRow,
  TableRowDetail as DxTableRowDetail,
  TableSelection as DxTableSelection,
} from "@devexpress/dx-react-grid-material-ui";
import { Box, CircularProgress, IconButton } from "@material-ui/core";
import { createStyles, makeStyles, withStyles } from "@material-ui/core/styles";
import { CreateCSSProperties, ThemeProvider } from "@material-ui/styles";
import clsx from "clsx";
import React, { HTMLProps, useCallback, useMemo } from "react";
import theme from "../../../theme";
import { SVGClose, SVGOpen } from "./assets";
import TableSelectOperationCell from "./table-select-operation-cell";
import TableContainer from "./tableContainer";
import UpgradeOverlay from "./upgrade-overlay";

type TableResizingMode = "widget" | "nextColumn";

/**
 * Props for Table
 *
 * @interface TableProps
 */
export interface TableNextProps extends HTMLProps<HTMLDivElement> {
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
   * 	Additional column properties that the plugin can handle.
   * @memberof TableProps
   */
  columnExtensions?: DxTable.ColumnExtension[];

  /**
   * a component that renders a header cell`s content
   *
   * @memberof TableProps
   */
  headerRowContentComponent?:
    | React.ComponentClass<DxTableHeaderRow.ContentProps, any>
    | React.FunctionComponent<DxTableHeaderRow.ContentProps>;

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

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: "max-content",
      position: "relative",
    },
    loadingRoot: {
      height: 66,
    },
    table: {},
    cell: {
      padding: "0px !important",
      height: 30,
      border: "none",
    },
    tableContainer: {},
    stubHeaderCell: {
      backgroundColor: "rgba(84,110,122,0.05)",
      borderBottomColor: "#EEE",
    },
    stubCell: {
      // backgroundColor: "#FFF",
      // borderBottomColor: "#EEE",
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
      borderBottom: "1px solid rgba(224,224,224,1)",
      textAlign: "center",
      textOverflow: "initial",
      padding: 0,
      margin: "6px",
    },
    tableSelectionCell: {
      // borderBottom: "1px solid rgba(224, 224, 224, 1)",
    },
  }),
);

const useTableStyles = makeStyles(() =>
  createStyles({
    root: (columnWidths?: DxTableColumnWidthInfo[]) => {
      const styles: CreateCSSProperties<DxTableColumnWidthInfo[]> = {
        "& tbody tr:nth-of-type(odd) td": {
          backgroundColor: "#F5F6F9",
        },
      };
      if (!columnWidths) {
        return styles;
      }
      columnWidths.forEach((column, index) => {
        switch (typeof column.width) {
          case "number":
            {
              styles[`& colgroup col:nth-child(${index + 1})`] = {
                width: `${column.width}px !important`,
                color: "white !important",
              };
            }
            break;
          case "string":
            {
              styles[`& colgroup col:nth-child(${index + 1})`] = {
                width: `${column.width} !important`,
                color: "white !important",
              };
            }
            break;
          default:
            break;
        }
      });
      styles["backgroundColor"] = "white";
      return styles;
    },
  }),
);

const useTableContainerStyles = makeStyles(() =>
  createStyles({
    root: {
      overflow: "auto",
      "&::-webkit-scrollbar": {
        width: "6px",
        height: "6px",
      },
      "&::-webkit-scrollbar-thumb": {
        backgroundColor: "rgba(0, 0, 0, 0.4)",
        borderRadius: "3px",
      },
    },
  }),
);

const gridHeaderRowCellStyle = createStyles({
  cell: {
    background: "#fff",
    height: 36,
    padding: "0px 16px !important",
    color: "#333333",
    fontWeight: 500,
    borderBottom: "1px solid #EEE",
  },
});

const dxHeaderRowTitleStyle = createStyles({
  title: {
    color: "#333333",
    fontSize: 12,
    fontWeight: 500,
    fontFamily: "Noto Sans SC",
  },
});

const dxTableSelectionCellStyle = createStyles({
  cell: {
    paddingRight: "8px",
    border: "none",
    // borderBottomColor: "#EEE",
  },
});

const dxTableSortLabelStyle = createStyles({
  root: {
    fontSize: 12,
    fontWeight: 500,
    fontFamily: "Noto Sans SC",
  },
});

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

const GridHeaderRowContentComponent: React.ComponentType<TableHeaderRow.ContentProps> | undefined = (props) => {
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
  return (
    <DxTableFixedColumns.Cell
      {...props}
      style={
        {
          // backgroundColor: "transparent",
        }
      }
    />
  );
};

const DxTableSortLabelComponent = withStyles(dxTableSortLabelStyle)((props: DxTableHeaderRow.SortLabelProps) => {
  if (props.disabled) {
    return <DxTableHeaderRow.SortLabel {...props}>{props.column.title}</DxTableHeaderRow.SortLabel>;
  }
  return (
    <DxTableHeaderRow.SortLabel {...props} title="按住 Shift 键可排序多列, 按住 Ctrl 键可取消排序列（macOS 为 ⌘ 键）" />
  );
});

const TableNext: React.FunctionComponent<TableNextProps> = (props) => {
  const {
    className,
    rowExpanded,
    cellComponent,
    noDataCellMessage,
    columnWidths,
    columnSortable,
    detailRowToggleCell,
    detailContentComponent,
    headerRowContentComponent,
    rowSelectable,
    columnsSortableExtension,
    showFixedColumn,
    noData,
    style,
    ...leftProps
  } = props;
  const {
    id,
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
    showUpgradeOverlay,
    loading,
    showNoDataPlaceholder,
  } = TableContainer.useContainer();
  const columnWidthsMemo: DxTableColumnWidthInfo[] = useMemo(() => {
    if (columnWidths) {
      return columnWidths;
    }
    return columnWidthsMemo;
  }, [columnWidths]);
  const classes = useStyles();
  const tableClasses = useTableStyles(columnWidthsMemo);
  const containerClasses = useTableContainerStyles();

  const GridRootComponent = useCallback(
    (props) => {
      return <DxGrid.Root {...props} className={clsx(classes.root, loading && classes.loadingRoot)} />;
    },
    [loading],
  );

  const GridNoDataCellComponent = useCallback(
    (props) => {
      if (!showNoDataPlaceholder) {
        return null;
      }
      return (
        <DxTable.NoDataCell
          {...props}
          style={{ backgroundColor: "white", color: "#737373", borderBottom: "none" }}
          getMessage={(): string => "暂无数据"}
        />
      );
    },
    [showNoDataPlaceholder],
  );

  const DxTableRowComponent = useCallback((props) => {
    return <DxTable.Row {...props} />;
  }, []);

  const GridContainerComponent = useCallback((props) => {
    return <DxTable.Container {...props} className={containerClasses.root} />;
  }, []);

  const TableComponent = useCallback((props) => {
    return <DxTable.Table {...props} className={tableClasses.root} />;
  }, []);

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
          <DxPagingState defaultCurrentPage={page} currentPage={page} defaultPageSize={pageSize} pageSize={pageSize} />
          <DxIntegratedPaging />
          <DxTable
            tableComponent={TableComponent}
            containerComponent={GridContainerComponent}
            rowComponent={DxTableRowComponent}
            cellComponent={cellComponent ? cellComponent : GridCellComponent}
            stubHeaderCellComponent={GridStubHeaderCellComponent}
            stubCellComponent={GridStubCellComponent}
            noDataCellComponent={GridNoDataCellComponent}
            // columnExtensions={columnExtensions}
          />
          <DxTableHeaderRow
            contentComponent={headerRowContentComponent ? headerRowContentComponent : GridHeaderRowContentComponent}
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
    cellComponent,
    noDataCellMessage,
    GridNoDataCellComponent,
    detailRowToggleCell,
    detailContentComponent,
    rowSelectable,
    columnsSortableExtension,
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

  function upgradeOverlay() {
    return <UpgradeOverlay />;
  }

  function loadingComponent() {
    return (
      <Box
        style={{
          display: "flex",
          flexDirection: "row",
          justifyContent: "center",
          alignItems: "center",
          paddingTop: "10px",
          width: "100%",
          position: "absolute",
          top: 36,
        }}
      >
        <CircularProgress size={30} />
      </Box>
    );
  }

  return (
    <div className={className} style={{ ...style, position: "relative" }} {...leftProps}>
      {tableNodes}
      {showUpgradeOverlay && upgradeOverlay()}
      {loading && loadingComponent()}
    </div>
  );
};

export default TableNext;
