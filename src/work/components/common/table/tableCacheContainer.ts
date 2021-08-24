import _ from "lodash";
import { useEffect } from "react";
import { createContainer } from "unstated-next";
import UserContainer from "../../../containers/userContainer";
import PageInfoContainer from "./pageInfoContainer";
import TableContainer from "./tableContainer";

interface TableCacheInitialState {
  useCache?: boolean;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useTableCache(initialState: TableCacheInitialState = {}) {
  const { isRimeActive } = UserContainer.useContainer();
  const tableContainer = TableContainer.useContainer();
  const pageInfoContainer = PageInfoContainer.useContainer();

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  function updateRowsWithCache(newRows: any[], totalCount = 0, maxBlurRowCount?: number): void {
    if (!isRimeActive && !initialState.useCache) {
      tableContainer.updateRows(newRows, totalCount, maxBlurRowCount);
      return;
    }
    const queryLength = pageInfoContainer.queryPage * pageInfoContainer.queryPageSize;
    const rowsLength = tableContainer.rows.length;
    let newArray;

    // 取消使用原始数据
    if (totalCount < rowsLength) {
      newArray = _.range(0, Math.min(totalCount, queryLength)).map(() => {
        return {};
      });
      newArray.splice((pageInfoContainer.queryPage - 1) * pageInfoContainer.queryPageSize, newRows.length, ...newRows);
      tableContainer.rowsCache.set(`${pageInfoContainer.queryPage}`, true);
      tableContainer.updateRows(newArray, totalCount, maxBlurRowCount);
      return;
    }
    if (rowsLength > queryLength) {
      newArray = Array.from(tableContainer.rows);
      newArray.splice((pageInfoContainer.queryPage - 1) * pageInfoContainer.queryPageSize, newRows.length, ...newRows);
      tableContainer.rowsCache.set(`${pageInfoContainer.queryPage}`, true);
      tableContainer.updateRows(newArray, totalCount, maxBlurRowCount);
      return;
    }

    newArray = _.range(0, Math.min(totalCount, queryLength)).map(() => {
      return {};
    });
    newArray.splice(0, rowsLength, ...tableContainer.rows);
    newArray.splice((pageInfoContainer.queryPage - 1) * pageInfoContainer.queryPageSize, newRows.length, ...newRows);
    tableContainer.rowsCache.set(`${pageInfoContainer.queryPage}`, true);
    tableContainer.updateRows(newArray, totalCount, maxBlurRowCount);
  }

  useEffect(() => {
    tableContainer.rowsCache.clear();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tableContainer.columns, tableContainer.sortingColumns]);

  return {
    updateRowsWithCache,
  };
}

const TableCacheContainer = createContainer(useTableCache);
export default TableCacheContainer;
