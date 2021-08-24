import {
  CustomTreeData as DxCustomTreeData,
  SelectionState as DxSelectionState,
  TreeDataState as DxTreeDataState,
} from "@devexpress/dx-react-grid";
import {
  DragDropProvider as DxDragDropProvider,
  Grid as DxGrid,
  Table as DxTable,
  TableColumnReordering as DxTableColumnReordering,
  TableHeaderRow as DxTableHeaderRow,
  TableSelection as DxTableSelection,
  TableTreeColumn as DxTableTreeColumn,
} from "@devexpress/dx-react-grid-material-ui";
import { CircularProgress, Typography } from "@material-ui/core";
import { ThemeProvider } from "@material-ui/styles";
import clsx from "clsx";
import _ from "lodash";
import React, { HTMLProps, ReactNode, useCallback, useEffect, useMemo, useRef, useState } from "react";
import SimpleBar from "simplebar-react";
import { GridCellRenderingPlugin, GridColumnResizingPlugin, GridTreeDataPlugin } from "./plugin";
import {
  gridTheme,
  useGridStyles,
  useMiscStyles,
  useStyles,
  useTableColumnWidthResizingStyles,
  useTableHeaderRowStyles,
  useTableSelectionStyles,
  useTableStyles,
} from "./styles";
import { GridColumn, GridColumnWidth, GridRow } from "./types";

export interface HighlightAreaPosition {
  left: number;
  top: number;
  width: number;
  height: number;
}

export interface GridProps extends Omit<HTMLProps<HTMLDivElement>, "rows"> {
  // Core
  rows: GridRow[];
  columns: GridColumn[];

  // Column Fixing
  fixedColumns?: string[];

  // Row Selection
  selectable?: boolean;
  selections?: string[];
  showSelectionColumn?: boolean;
  isSelectRowByClick?: boolean;
  onSelectionsChanged?: (selections: string[]) => void;

  // Row Highlight
  highlightable?: boolean;
  highlightRow?: string;
  onHighlight?: (row: GridRow) => void;

  // Column Ordering
  reorderable?: boolean;
  columnOrders?: string[];
  onColumnOrdersChanged?: (columns: string[]) => void;

  // expanded row state
  expandedRowIds?: string[];

  // Plugins
  columnResizingPlugin?: GridColumnResizingPlugin;
  cellRenderingPlugin?: GridCellRenderingPlugin;
  treeDataPlugin?: GridTreeDataPlugin;

  // Misc
  headerFixable?: boolean;
  showLoading?: boolean;
  showPlaceholder?: boolean;
  placeholder?: string;
  disableAnimation?: boolean;
  maskComponent?: ReactNode;
}

const Grid: React.FunctionComponent<GridProps> = ({
  // Core
  rows,
  columns,

  // Column Fixing
  fixedColumns,

  // Row Selection
  selectable,
  showSelectionColumn,
  isSelectRowByClick,
  selections,
  onSelectionsChanged,

  // Row Highlight
  highlightable,
  highlightRow,
  onHighlight,

  // Column Ordering
  reorderable,
  columnOrders,
  onColumnOrdersChanged,

  // expanded row state
  expandedRowIds,

  // Plugins
  columnResizingPlugin,
  cellRenderingPlugin,
  treeDataPlugin,

  // Misc
  className,
  headerFixable,
  showLoading,
  showPlaceholder,
  placeholder,
  disableAnimation,
  maskComponent,

  ...leftProps
}) => {
  // Styles
  const classes = useStyles();
  const miscClasses = useMiscStyles();
  const tableClasses = useTableStyles();
  const scrollbarRef = useRef<SimpleBar | null>(null);
  const tableHeaderRowClasses = useTableHeaderRowStyles();
  const tableSelectionClasses = useTableSelectionStyles();
  const gridClasses = useGridStyles();

  // Id Split RegExp
  const reg = new RegExp("=", "g");

  // Refs
  const rootRef = useRef<HTMLDivElement | null>(null);
  const columnsRef = useRef<GridColumn[]>(columns);
  const columnOrdersRef = useRef(columnOrders);

  // Cell Rendering Plugin
  const [cellRenderingPluginMemo, setCellRenderingPluginMemo] = useState(cellRenderingPlugin);
  useEffect(() => {
    if (!cellRenderingPlugin) {
      setCellRenderingPluginMemo(undefined);
      return;
    }
    if (!cellRenderingPluginMemo) {
      setCellRenderingPluginMemo(cellRenderingPlugin);
      return;
    }
    if (
      cellRenderingPlugin.renderingCell === cellRenderingPluginMemo.renderingCell &&
      cellRenderingPlugin.renderingHeaderCell === cellRenderingPluginMemo.renderingHeaderCell &&
      cellRenderingPlugin.renderingSelectionCell === cellRenderingPluginMemo.renderingSelectionCell &&
      cellRenderingPlugin.renderingStubHeaderCell === cellRenderingPluginMemo.renderingStubHeaderCell
    ) {
      return;
    }

    setCellRenderingPluginMemo(cellRenderingPlugin);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [cellRenderingPlugin]);

  // Table Width Calculation
  const columnWidthsRef = useRef<GridColumnWidth[]>();
  const [columnWidths, setColumnWidths] = useState<GridColumnWidth[]>();
  const columnWidthsMemo = useMemo(() => columnWidths, [columnWidths]);
  const tableColumnWidthResizingClasses = useTableColumnWidthResizingStyles(columnWidthsMemo ?? []);

  // Table Highlight
  const highlightRowRef = useRef<string>();
  const [highlightAreaPosition, setHighlightAreaPosition] = useState<HighlightAreaPosition>();

  function highlightAreaCalculation() {
    if (highlightRowRef.current && scrollbarRef.current && rootRef.current) {
      const id = ("#" + btoa(highlightRowRef.current)).replace(reg, "");

      const highlightRowElement: HTMLTableRowElement | null = rootRef.current.querySelector(id);

      const scrollbarScrollElement = scrollbarRef.current.getScrollElement();

      if (highlightRowElement && scrollbarScrollElement && rootRef.current) {
        const newHighlightAreaPosition: HighlightAreaPosition = {
          height: highlightRowElement.clientHeight,
          width: rootRef.current.clientWidth,
          top: highlightRowElement.offsetTop,
          left: scrollbarScrollElement.scrollLeft,
        };

        setHighlightAreaPosition((oldValue) => {
          if (oldValue) {
            const positionEqual =
              newHighlightAreaPosition.height === oldValue.height &&
              newHighlightAreaPosition.width === oldValue.width &&
              newHighlightAreaPosition.left === oldValue.left &&
              newHighlightAreaPosition.top === oldValue.top;
            if (positionEqual) {
              return oldValue;
            }
            return newHighlightAreaPosition;
          }
          return newHighlightAreaPosition;
        });
      }
      return;
    }
    setHighlightAreaPosition(undefined);
  }

  useEffect(() => {
    const t = setInterval(() => {
      highlightAreaCalculation();
    }, 20);
    return () => {
      clearInterval(t);
    };
  }, []);

  useEffect(() => {
    highlightRowRef.current = highlightRow;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [highlightRow]);

  // Window Event
  function resizeHandler() {
    if (rootRef.current && columnResizingPlugin) {
      const newColumnWidths = columnResizingPlugin.calculateColumnWidths(
        rootRef.current.clientWidth,
        columnsRef.current,
        columnOrdersRef.current,
        selectable && (showSelectionColumn === undefined ? true : showSelectionColumn),
      );

      if (!_.isEqual(newColumnWidths, columnWidthsRef.current)) {
        columnWidthsRef.current = newColumnWidths;
        setColumnWidths(newColumnWidths);
      }
    }
  }

  useEffect(() => {
    window.addEventListener("resize", resizeHandler);
    return (): void => {
      window.removeEventListener("resize", resizeHandler);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Update column widths when columns changed
  useEffect(() => {
    columnsRef.current = columns;
    resizeHandler();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [columns]);

  // Update column widths when columns changed
  useEffect(() => {
    columnOrdersRef.current = columnOrders;
    resizeHandler();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [columnOrders]);

  // Components
  const GridRootComponent = useCallback(
    (props) => {
      return <DxGrid.Root {...props} className={gridClasses.root} />;
    },
    [gridClasses.root],
  );

  const TableComponent = useCallback(
    (props) => {
      return (
        <DxTable.Table
          {...props}
          className={clsx(tableColumnWidthResizingClasses.root, headerFixable && tableClasses.headerFixed)}
        />
      );
    },
    [headerFixable, tableClasses.headerFixed, tableColumnWidthResizingClasses.root],
  );

  const TableRowComponent = useCallback(
    (props) => {
      const row = _.get(props, "row");
      const rowId = _.get(row, "id");

      return (
        <DxTable.Row
          {...props}
          id={btoa(rowId).replace(reg, "")}
          className={tableClasses.row}
          style={{
            cursor: highlightable ? "pointer" : "auto",
          }}
          onClick={(event: any) => {
            event.stopPropagation();
            if (highlightable) {
              onHighlight && onHighlight(row);
            }
          }}
        />
      );
    },
    [highlightable, onHighlight, tableClasses.row],
  );

  const TableContainerComponent = useCallback((props) => {
    return <DxTable.Container {...props} style={{ overflow: "unset" }} />;
  }, []);

  const TableNoDataCellComponent = useCallback(() => {
    return null;
  }, []);

  const TableCellComponent = useCallback(
    (props) => {
      const className = _.get(props, "className");
      if (cellRenderingPluginMemo) {
        return (
          <DxTable.Cell
            {...props}
            className={clsx(tableClasses.cell, className, disableAnimation && miscClasses.disableAnimation)}
          >
            {cellRenderingPluginMemo.renderingCell(props.row, props.column)}
          </DxTable.Cell>
        );
      }

      return (
        <DxTable.Cell
          {...props}
          className={clsx(tableClasses.cell, className, disableAnimation && miscClasses.disableAnimation)}
        />
      );
    },
    [cellRenderingPluginMemo, miscClasses.disableAnimation, disableAnimation, tableClasses.cell],
  );

  const TableStubHeaderCellComponent = useCallback(
    (props) => {
      if (cellRenderingPluginMemo && cellRenderingPluginMemo.renderingStubHeaderCell) {
        return (
          <DxTable.StubHeaderCell {...props} className={clsx(tableClasses.stubHeaderCell)}>
            {cellRenderingPluginMemo.renderingStubHeaderCell()}
          </DxTable.StubHeaderCell>
        );
      }
      return <DxTable.StubHeaderCell {...props} className={clsx(tableClasses.stubHeaderCell)} />;
    },
    [cellRenderingPluginMemo, tableClasses.stubHeaderCell],
  );

  const TableHeaderRowRowComponent = useCallback(
    (props) => {
      return <DxTableHeaderRow.Row {...props} className={tableHeaderRowClasses.row} />;
    },
    [tableHeaderRowClasses.row],
  );

  const TableHeaderRowCellComponent = useCallback(
    (props) => {
      const className = _.get(props, "className");
      const column: GridColumn = _.get(props, "column");
      if (cellRenderingPluginMemo && cellRenderingPluginMemo.renderingHeaderCell) {
        return (
          <DxTableHeaderRow.Cell
            {...props}
            className={clsx(tableHeaderRowClasses.cell, className, disableAnimation && miscClasses.disableAnimation)}
            draggingEnabled={reorderable ? column.draggable : false}
          >
            {cellRenderingPluginMemo.renderingHeaderCell(props.row, props.column)}
          </DxTableHeaderRow.Cell>
        );
      }
      return (
        <DxTableHeaderRow.Cell
          {...props}
          className={clsx(tableHeaderRowClasses.cell, className, disableAnimation && miscClasses.disableAnimation)}
          draggingEnabled={reorderable ? column.draggable : false}
        />
      );
    },
    [cellRenderingPluginMemo, miscClasses.disableAnimation, reorderable, disableAnimation, tableHeaderRowClasses.cell],
  );

  // Table Selection
  const TableSelectionCellComponent = useCallback(
    (props) => {
      const className = _.get(props, "className");
      if (cellRenderingPluginMemo && cellRenderingPluginMemo.renderingSelectionCell) {
        return (
          <DxTableSelection.Cell {...props} className={clsx(className, tableSelectionClasses.cell)}>
            {cellRenderingPluginMemo.renderingSelectionCell(props.row)}
          </DxTableSelection.Cell>
        );
      }
      return <DxTableSelection.Cell {...props} className={clsx(className, tableSelectionClasses.cell)} />;
    },
    [cellRenderingPluginMemo, tableSelectionClasses.cell],
  );

  const ExpandButtonComponent = useCallback(
    (props) => {
      return (
        <>
          {treeDataPlugin?.renderingExpandButton &&
            treeDataPlugin?.renderingExpandButton(props.visible, props.expanded, props.onToggle)}
        </>
      );
    },
    [treeDataPlugin],
  );

  const TreeCellComponent = useCallback(
    (props) => {
      if (treeDataPlugin?.renderingTreeCell) {
        return (
          <DxTableTreeColumn.Cell {...props}>
            {treeDataPlugin?.renderingTreeCell(props.row, props.column, props.children)}
          </DxTableTreeColumn.Cell>
        );
      }
      return <DxTableTreeColumn.Cell {...props} />;
    },
    [treeDataPlugin],
  );

  const selectionStateMemo = useMemo(() => {
    return (
      selectable && (
        <DxSelectionState
          selection={selections}
          onSelectionChange={(newSelections) => {
            onSelectionsChanged && onSelectionsChanged(newSelections as string[]);
          }}
        />
      )
    );
  }, [onSelectionsChanged, selectable, selections]);

  const selectionMemo = useMemo(() => {
    return (
      selectable && (
        <DxTableSelection
          cellComponent={TableSelectionCellComponent}
          highlightRow={isSelectRowByClick}
          selectByRowClick={isSelectRowByClick}
          showSelectionColumn={showSelectionColumn}
        />
      )
    );
  }, [TableSelectionCellComponent, isSelectRowByClick, selectable, showSelectionColumn]);

  const tableComponentMemo = useMemo(() => {
    return (
      <DxTable
        tableComponent={TableComponent}
        rowComponent={TableRowComponent}
        cellComponent={TableCellComponent}
        stubHeaderCellComponent={TableStubHeaderCellComponent}
        containerComponent={TableContainerComponent}
        noDataCellComponent={TableNoDataCellComponent}
      />
    );
  }, [
    TableCellComponent,
    TableComponent,
    TableContainerComponent,
    TableNoDataCellComponent,
    TableRowComponent,
    TableStubHeaderCellComponent,
  ]);

  const treeDataStateMemo = useMemo(() => {
    return (
      treeDataPlugin && (
        <DxTreeDataState
          defaultExpandedRowIds={treeDataPlugin?.defaultExpandedRows && treeDataPlugin.defaultExpandedRows()}
          expandedRowIds={expandedRowIds}
          onExpandedRowIdsChange={treeDataPlugin?.onExpandedRowIdsChange}
        />
      )
    );
  }, [treeDataPlugin, expandedRowIds]);

  const customTreeDataComponentMemo = useMemo(() => {
    return (
      treeDataPlugin && (
        <DxCustomTreeData
          getChildRows={(row, rootRows) => {
            const childRows = rootRows.filter((r) => r.parentId === (row ? row.id : null));
            return childRows.length ? childRows : null;
          }}
        />
      )
    );
  }, [treeDataPlugin]);

  const treeColumnComponentMemo = useMemo(() => {
    return (
      treeDataPlugin && (
        <DxTableTreeColumn
          for={treeDataPlugin.expandColumnId()}
          expandButtonComponent={ExpandButtonComponent}
          cellComponent={TreeCellComponent}
        />
      )
    );
  }, [treeDataPlugin, ExpandButtonComponent, TreeCellComponent]);

  const gridComponent = useMemo(() => {
    return (
      <ThemeProvider theme={gridTheme}>
        <DxGrid rootComponent={GridRootComponent} rows={rows} columns={columns} getRowId={(row: GridRow) => row.id}>
          {reorderable && <DxDragDropProvider />}
          {treeDataStateMemo}
          {customTreeDataComponentMemo}
          {selectionStateMemo}
          {tableComponentMemo}
          <DxTableColumnReordering
            order={columnOrders ? columnOrders : columns.map((column) => column.name)}
            onOrderChange={(newColumnOrder) => {
              onColumnOrdersChanged && onColumnOrdersChanged(newColumnOrder);
            }}
          />
          <DxTableHeaderRow rowComponent={TableHeaderRowRowComponent} cellComponent={TableHeaderRowCellComponent} />
          {selectionMemo}
          {treeColumnComponentMemo}
          {/* {fixedColumns && (
            <DxTableFixedColumns
              cellComponent={TableFixedColumnCellComponent}
              leftColumns={selectable ? [DxTableSelection.COLUMN_TYPE, ...fixedColumns] : fixedColumns}
            />
          )} */}
          {/* {fixedColumns && (
          <DisableFixedColumnReorder
            leftFixedColumns={fixedColumns ?? []}
            rightFixedColumns={[]}
            // onColumnOrdersChanged={(newColumnOrder) => {
            //   onColumnReordered && onColumnReordered(newColumnOrder);
            // }}
          />
        )} */}
        </DxGrid>
      </ThemeProvider>
    );
  }, [
    GridRootComponent,
    TableHeaderRowCellComponent,
    TableHeaderRowRowComponent,
    columnOrders,
    columns,
    onColumnOrdersChanged,
    reorderable,
    rows,
    selectionMemo,
    selectionStateMemo,
    tableComponentMemo,
    treeDataStateMemo,
    customTreeDataComponentMemo,
    treeColumnComponentMemo,
  ]);

  const highlightAreaMemo = useMemo(() => {
    return (
      highlightAreaPosition && (
        <div
          style={{
            position: "absolute",
            left: highlightAreaPosition.left,
            top: highlightAreaPosition.top,
            width: highlightAreaPosition.width,
            height: highlightAreaPosition.height,
            zIndex: 1,
            border: "2px solid #4F709B",
            // transition: "all 0.05s ease-out",
            borderRadius: "4px",
            pointerEvents: "none",
          }}
        />
      )
    );
  }, [highlightAreaPosition]);

  return (
    <div {...leftProps} ref={rootRef} className={clsx(classes.root, className)}>
      <SimpleBar className={miscClasses.scrollbar} ref={scrollbarRef}>
        {gridComponent}
        {highlightAreaMemo}
      </SimpleBar>
      {showLoading && (
        <div className={gridClasses.mask}>
          <CircularProgress />
        </div>
      )}
      {showPlaceholder && (
        <div className={gridClasses.mask}>
          <Typography>{placeholder ?? "暂无数据"}</Typography>
        </div>
      )}
      {maskComponent && <div className={gridClasses.mask}>{maskComponent}</div>}
    </div>
  );
};

export default Grid;
