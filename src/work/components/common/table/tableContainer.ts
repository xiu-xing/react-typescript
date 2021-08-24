import { Sorting } from "@devexpress/dx-react-grid";
import { default as lodash, default as _ } from "lodash";
import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { createContainer } from "unstated-next";
import ConfigContainer from "../../../containers/configContainer";
import UserContainer from "../../../containers/userContainer";
import { TableModel } from "../../../models/table/table";
import { FixedPositionType, TableColumnAlign, TableColumnModel } from "../../../models/table/tableColumn";
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
  columns?: Array<TableColumnModel>;
  columnOrder?: string[];

  page?: number;
  pageSize?: number;
  rowCount?: number;

  serial?: TableSerial;
  serialWidth?: number;

  // Default 1000
  selectMaxRowNum?: number;
  accessCheck?: boolean;
  selectionOperationText?: TableSelectionOperationCellText;
}

type TableSerial = "asc" | "desc";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
export function useTable(initialState: TableInitialState = {}) {
  const { isRimeActive } = UserContainer.useContainer();
  const tableRef = useRef(null);
  const [id, setId] = useState(initialState.id);
  const [rows, setRows] = useState(initialState.rows || []);
  const [rowsCache, setRowsCache] = useState<Map<string, boolean>>(new Map([]));
  const { user } = UserContainer.useContainer();
  const { tableConfigs, accessControlConfigs } = ConfigContainer.useContainer();

  const tableConfig = useMemo(() => {
    if (id && tableConfigs) {
      const newTableConfig: TableModel = TableModel.fromJSON(tableConfigs[id]);
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
              blurRoles: {},
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

  const [columns, setColumns] = useState<Array<TableColumnModel>>(initialState.columns || defaultColumns || []);
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

  // const [tableConfig, setTableConfig] = useState<TableModel>();

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
  function updateRows(newRows: any[], newTotalRowCount = 0, maxBlurRowCount = pageSize): void {
    const resultRows = Array.from(newRows);

    if (initialState.accessCheck) {
      let enableShowRow = pageSize;
      if (user && user.role && accessControlConfigs) {
        const tableRowLimit = accessControlConfigs[id + ".row_limit"];
        if (!tableRowLimit || !tableRowLimit[user.role]) {
          setShowProMask(false);
          setRows(resultRows);
          return;
        }
        enableShowRow = tableRowLimit[user.role];
      }

      if (newTotalRowCount <= enableShowRow) {
        setShowProMask(false);
      } else {
        setShowProMask(true);
      }
      if (resultRows.length >= enableShowRow) {
        const newResultRows = resultRows.slice(0, enableShowRow);
        const sampleRow = _.cloneDeep(resultRows[0]);
        sampleRow["isBlur"] = true;
        let sampleRowCount = 0;
        sampleRowCount =
          newTotalRowCount >= pageSize ? maxBlurRowCount - enableShowRow : newTotalRowCount - enableShowRow;
        for (let index = 0; index < sampleRowCount; index++) {
          newResultRows.push(_.cloneDeep(sampleRow));
        }
        setRows(newResultRows);
        return;
      }
    }
    setShowProMask(false);
    setRows(resultRows);
  }

  function updateColumns(newColumns: TableColumnModel[]): void {
    if (serial) {
      setColumns([
        {
          align: TableColumnAlign.Right,
          isLocked: true,
          minWidth: 68,
          name: "serial",
          title: "#",
          sortable: false,
          blurRoles: {},
          fixedPosition: FixedPositionType.None,
          lineClamp: 0,
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

  useEffect(() => {
    if (isRimeActive) {
      setShowProMask(false);
      return;
    }
    setShowProMask(true);
  }, [isRimeActive]);

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
