import { Sorting } from "@devexpress/dx-react-grid";
import { default as lodash } from "lodash";
import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { createContainer } from "unstated-next";
import ConfigContainer from "../../../containers/configContainer";
import { FixedPositionType, TableColumnAlign, TableColumnNextModel } from "../../../models/table/tableColumnNext";
import { TableNextModel } from "../../../models/table/tableNext";

export interface TableSelectionOperationCellText {
  selectPageText?: string;
  selectAllText?: string;
  deselectPageText?: string;
  deselectAllText?: string;
}

interface TableInitialState {
  id?: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  rows?: any[];
  columns?: Array<TableColumnNextModel>;
  columnOrder?: string[];

  page?: number;
  pageSize?: number;
  rowCount?: number;

  serial?: TableSerial;
  serialWidth?: number;

  // Default 1000
  selectMaxRowNum?: number;
  selectionOperationText?: TableSelectionOperationCellText;
}

type TableSerial = "asc" | "desc";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export function useTable(initialState: TableInitialState = {}) {
  const tableRef = useRef(null);
  const [id, setId] = useState(initialState.id);
  const [rows, setRows] = useState(initialState.rows || []);
  const [rowsCache, setRowsCache] = useState<Map<string, boolean>>(new Map([]));
  const { tableConfigs } = ConfigContainer.useContainer();

  const tableConfig = useMemo(() => {
    if (id && tableConfigs) {
      const newTableConfig: TableNextModel = TableNextModel.fromJSON(tableConfigs[id]);
      return newTableConfig;
    }
    return null;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tableConfigs, id]);

  const defaultColumns = useMemo(() => {
    if (tableConfig) {
      return initialState.serial
        ? [
            {
              align: TableColumnAlign.Right,
              isLocked: true,
              minWidth: initialState.serialWidth || 68,
              name: "serial",
              title: "#",
              sortable: false,
              fixedPosition: FixedPositionType.None,
              lineClamp: 0,
            },
            ...tableConfig.defaultColumns,
          ]
        : [...tableConfig.defaultColumns];
    }
    return [];
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tableConfig]);

  const defaultLeftFixedColumns = useMemo(() => {
    if (tableConfig?.leftFixedColumns.length) {
      return [...tableConfig.leftFixedColumns, "serial"];
    }
    return ["serial"];
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tableConfig]);

  const defaultRightFixedColumns = useMemo(() => {
    if (tableConfig?.rightFixedColumns.length) {
      return [...tableConfig.rightFixedColumns];
    }
    return [];
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tableConfig]);

  const [columns, setColumns] = useState<Array<TableColumnNextModel>>(initialState.columns || defaultColumns || []);
  const [columnOrder, setColumnOrder] = useState<string[]>(initialState.columnOrder || []);
  const [serial] = useState(initialState.serial);

  const [selectedRows, setSelectedRows] = useState<number[]>([]);
  const [isSelectedAll, setIsSelectedAll] = useState<boolean>(false);
  const [leftFixedColumns, setLeftFixedColumns] = useState<string[]>(defaultLeftFixedColumns);
  const [rightFixedColumns, setRightFixedColumns] = useState<string[]>(defaultRightFixedColumns);

  const [
    tableSelectionOperationCellText,
    setTableSelectionOperationCellText,
  ] = useState<TableSelectionOperationCellText>(initialState.selectionOperationText || {});

  const [showProMask, setShowProMask] = useState<boolean>(false);

  // 排序
  const [sortingColumns, setSortingColumns] = useState<Sorting[]>([]);

  // Specified loading indicator showing
  const [loading, setLoading] = useState(true);

  // 页码
  const [page, setPage] = useState(initialState.page || 0);
  // 页大小
  const [pageSize, setPageSize] = useState(initialState.pageSize || 50);
  // 总数
  const [rowCount, setRowCount] = useState(initialState.rowCount || 0);
  // 当前页显示的数目
  const [pageCount, setPageCount] = useState(0);

  const [columnConfigurationDialogOpen, setColumnConfigurationDialogOpen] = useState(false);

  const [rowLimit, setRowLimit] = useState(0);
  const [showUpgradeOverlay, setShowUpgradeOverlay] = useState(false);
  const [emptyRowCount, setEmptyRowCount] = useState(0);
  const [showNoDataPlaceholder, setShowNoDataPlaceholder] = useState(false);

  const pageRows = useMemo(() => {
    if (rowCount === 0) {
      return [];
    }
    const currentRowsSize = page * pageSize;
    const leftRowsSize = rowCount - currentRowsSize;
    if (leftRowsSize < pageSize && leftRowsSize > 0) {
      return Array.from(Array(leftRowsSize).keys()).map((value) => value + currentRowsSize);
    }
    return Array.from(Array(pageSize).keys()).map((value) => value + currentRowsSize);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page, rows]);

  useEffect(() => {
    setPageCount(Math.ceil(rowCount / pageSize));
  }, [rowCount, pageSize]);

  // No Data placeholder
  useEffect(() => {
    setShowNoDataPlaceholder(rowCount === 0);
  }, [rowCount]);

  // Access control
  useEffect(() => {
    /*
     * The access control overlay showing depends on two conditions:
     * 1. rowLimit unequal to 0 (In other words, no access control).
     * 2. Result rows count larger than row limit.
     */
    if (rowLimit != 0 && rowCount > rowLimit) {
      const limitedRows = rows.slice(0, rowLimit);
      let emptyRowsCount = 0;
      if (limitedRows.length >= pageSize) {
        emptyRowsCount = pageSize - (limitedRows.length % pageSize);
      } else {
        emptyRowsCount = pageSize - limitedRows.length;
      }

      const emptyRows = [];
      for (let index = 0; index < emptyRowsCount; index++) {
        emptyRows.push({
          "isEmpty": true,
        });
      }

      setRows(limitedRows.concat(emptyRows));
      setShowUpgradeOverlay(true);
      setEmptyRowCount(emptyRowsCount);
    }
  }, [rowLimit]);

  function scrollToTop(): void {
    const tableElement = document.getElementById("VirtualTable");
    if (tableElement) {
      tableElement.scrollTop = 0;
    }
  }

  // Operations
  function selectPage(): void {
    setSelectedRows((oldSelectedRows) => lodash.union(oldSelectedRows, pageRows));
  }

  function selectAll(): void {
    setIsSelectedAll(true);
    const maxCount = Math.min(rowCount, initialState.selectMaxRowNum ?? 1000);
    setSelectedRows(lodash.range(0, maxCount));
  }

  function deselectPage(): void {
    setSelectedRows((oldSelectedRows) => lodash.difference(oldSelectedRows, pageRows));
  }

  function deselectAll(): void {
    setIsSelectedAll(false);
    setSelectedRows([]);
  }

  function isFirstPage(): boolean {
    return page === 0;
  }

  function isLastPage(): boolean {
    return page + 1 === pageCount;
  }

  function reset(initialRows?: unknown[]): void {
    setPage(0);
    setRows(initialRows ?? []);
    setRowsCache(new Map());
    setIsSelectedAll(false);
    setSelectedRows([]);
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  function updateRows(newRows: any[]): void {
    const resultRows = Array.from(newRows);

    setRows(resultRows);
  }

  function updateColumns(newColumns: TableColumnNextModel[]): void {
    if (serial) {
      setColumns([
        {
          align: TableColumnAlign.Right,
          isLocked: true,
          minWidth: 68,
          name: "serial",
          title: "#",
          sortable: false,
          fixedPosition: FixedPositionType.None,
        },
        ...newColumns,
      ]);
      return;
    }

    setColumns(newColumns);
  }

  const onSortingChange = useCallback((sorting: Array<Sorting>): void => {
    setSortingColumns(sorting);
  }, []);
  // function onSortingChange(sorting: Array<Sorting>): void {
  //   setSortingColumns(sorting);
  // }

  return {
    tableRef,

    reset,

    id,
    setId,
    rows,
    updateRows,
    leftFixedColumns,
    setLeftFixedColumns,
    rightFixedColumns,
    setRightFixedColumns,
    columns,
    updateColumns,
    columnOrder,
    setColumnOrder,
    selectedRows,
    setSelectedRows,

    // Access Control
    rowLimit,
    setRowLimit,
    showUpgradeOverlay,
    setShowUpgradeOverlay,
    emptyRowCount,
    setEmptyRowCount,

    // Misc
    showNoDataPlaceholder,
    setShowNoDataPlaceholder,

    loading,
    setLoading,
    page,
    setPage,
    pageSize,
    setPageSize,
    rowCount,
    setRowCount,
    pageCount,
    setPageCount,

    sortingColumns,
    setSortingColumns,
    onSortingChange,

    selectPage,
    selectAll,
    deselectPage,
    deselectAll,
    isSelectedAll,
    setIsSelectedAll,

    pageRows,

    columnConfigurationDialogOpen,
    setColumnConfigurationDialogOpen,
    tableConfig,

    isFirstPage,
    isLastPage,

    tableSelectionOperationCellText,
    setTableSelectionOperationCellText,

    showProMask,
    setShowProMask,

    rowsCache,
    setRowsCache,

    scrollToTop,
  };
}

const TableContainer = createContainer(useTable);
export default TableContainer;
