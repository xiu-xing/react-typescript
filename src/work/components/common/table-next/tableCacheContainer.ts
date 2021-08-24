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
  function updateRowsWithCache(newRows: any[], totalCount = 0): void {
    if (!isRimeActive && !initialState.useCache) {
      tableContainer.updateRows(newRows);
      return;
    }
    const queryPage = pageInfoContainer.queryPage === 0 ? 1 : pageInfoContainer.queryPage;
    let newArray: any[] = [];

    if (tableContainer.rows.length === 0) {
      newArray = _.range(0, totalCount).map(() => {
        return {};
      });
    } else {
      newArray = Array.from(tableContainer.rows);
    }

    tableContainer.setRowsCache((oldValue) => {
      const newValue = _.clone(oldValue);
      newValue.set(`${queryPage}`, true);
      return newValue;
    });

    newArray.splice((queryPage - 1) * pageInfoContainer.queryPageSize, pageInfoContainer.queryPageSize, ...newRows);

    tableContainer.updateRows(newArray);
  }

  useEffect(() => {
    tableContainer.setRowsCache((oldValue) => {
      const newValue = _.clone(oldValue);
      newValue.clear();
      return newValue;
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tableContainer.columns, tableContainer.sortingColumns]);

  return {
    updateRowsWithCache,
  };
}

const TableCacheContainer = createContainer(useTableCache);
export default TableCacheContainer;
