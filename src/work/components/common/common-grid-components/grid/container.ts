import { useState } from "react";
import { createContainer } from "unstated-next";
import { OrderColumn } from "../../../../generated/graphql";
import { GridColumn } from "../../grid/core/types";

export interface Insight {
  type: string;
  id: string;
  title: string;
}
function CommonGrid() {
  const [columns, setColumns] = useState<GridColumn[]>([]);
  const [columnIDs, setColumnIDs] = useState<string[]>([]);

  // 升降排序
  const [sortColumns, setSortColumns] = useState<OrderColumn[]>([]);
  const [totalCount, setTotalCount] = useState(0);
  const [pageSize, setPageSize] = useState(50);
  const [page, setPage] = useState(0);

  // GridChart
  const [insights, setInsights] = useState<Insight[]>([]);
  const [hasNextPage, setHasNextPage] = useState<boolean>();
  const [fetching, setFetching] = useState(false);
  const [updateGridRow, setUpdateGridRow] = useState<boolean>();

  // Query after
  const [useQueryEndCursor, setUseQueryEndCursor] = useState<string | null>(null);
  const [rowSelections, setRowSelections] = useState<string[]>([]);
  const [highlightRow, setHighlightRow] = useState<string>();

  return {
    columns,
    setColumns,
    columnIDs,
    setColumnIDs,
    totalCount,
    sortColumns,
    setSortColumns,
    setTotalCount,
    pageSize,
    setPageSize,
    page,
    setPage,
    insights,
    setInsights,
    hasNextPage,
    setHasNextPage,
    fetching,
    setFetching,
    updateGridRow,
    setUpdateGridRow,
    useQueryEndCursor,
    setUseQueryEndCursor,
    rowSelections,
    setRowSelections,
    highlightRow,
    setHighlightRow,
  };
}

const CommonGridContainer = createContainer(CommonGrid);
export default CommonGridContainer;
