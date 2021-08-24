import { useEffect, useState } from "react";
import { createContainer } from "unstated-next";
import TableContainer from "./tableContainer";

interface PageInfoModel {
  first: number;
  after?: string;
}

interface PageInfoInitialState {
  queryPageSize?: number;
  pageSize?: number;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function usePageInfo(initialState: PageInfoInitialState = {}) {
  const { rowsCache, pageSize } = TableContainer.useContainer();
  const [queryPageSize, setQueryPageSize] = useState(initialState.queryPageSize || 1000);
  const [queryPage, setQueryPage] = useState(0);
  // 页面显示的页码，初始为 0，后端页码起始页为 1
  const [page, setPage] = useState(0);
  const [pageInfo, setPageInfo] = useState<PageInfoModel>({
    first: queryPageSize,
  });

  useEffect(() => {
    const actualPage = page + 1;
    const newQueryPage = Math.ceil((pageSize * actualPage) / queryPageSize) || 1;
    if (rowsCache.get(`${newQueryPage}`)) {
      return;
    }
    // 初始化时不应该更新 pageInfo
    if (page === 0 && !pageInfo.after) {
      return;
    }
    setQueryPage(newQueryPage);
    setPageInfo({
      first: queryPageSize,
      after: newQueryPage === 1 ? undefined : btoa(`${(newQueryPage - 1) * queryPageSize - 1}`),
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page]);

  function reset(): void {
    setPage(0);
    if (queryPage != 0) {
      setQueryPage(0);
      setPageInfo({
        first: queryPageSize,
      });
    }
  }

  return {
    pageInfo,
    page,
    pageSize,
    setPage,
    queryPage,
    queryPageSize,
    setQueryPageSize,
    reset,
  };
}

const PageInfoContainer = createContainer(usePageInfo);
export default PageInfoContainer;
