import _ from "lodash";
import { useEffect, useRef, useState } from "react";
import { createContainer } from "unstated-next";
import { OperationResult, useClient } from "urql";
import UserContainer from "../../../containers/userContainer";
import {
  EntityType,
  FilterInputs,
  Role,
  TableDocument,
  TableQuery,
  TableQueryVariables,
} from "../../../generated/graphql";
import { parseError } from "../../../utils/error";
import { isAccessError } from "../../../utils/errorHandler";
import SnackbarContainer from "../snackbar/snackbarContainer";
import PageInfoContainer from "../table-next/pageInfoContainer";
import TableCacheContainer from "../table-next/tableCacheContainer";
import CommonTableContainer from "../table-next/tableContainer";

interface DataTableInitialState {
  id: string;
  entityId: string;
  entityName: string;
  entityType?: EntityType;
  filter?: FilterInputs;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useTable(initialState: DataTableInitialState = { id: "", entityId: "", entityName: "" }) {
  const { openSnackbar } = SnackbarContainer.useContainer();
  const { user, setInstitutionAuthenticationDialog, setTrailServiceDialogOpen, setActiveServiceDialogOpen } =
    UserContainer.useContainer();
  const tableContainer = CommonTableContainer.useContainer();
  const pageInfoContainer = PageInfoContainer.useContainer();
  const tableCacheContainer = TableCacheContainer.useContainer();
  const [id] = useState<string>(initialState.id);
  const [entityId, setEntityId] = useState<string>(initialState.entityId);
  const [entityType, setEntityType] = useState(initialState.entityType);
  const [entityName, setEntityName] = useState(initialState.entityName);
  const [filter, setFilter] = useState<FilterInputs | undefined>(initialState.filter);
  const [result, setResult] = useState<OperationResult<TableQuery>>();

  useEffect(() => {
    setEntityType(() => (initialState.entityType ? initialState.entityType : undefined));
  }, [initialState.entityType]);

  useEffect(() => {
    setEntityId(() => initialState.entityId);
  }, [initialState.entityId]);

  useEffect(() => {
    setEntityName(() => initialState.entityName);
  }, [initialState.entityName]);

  useEffect(() => {
    setFilter(() => initialState.filter);
  }, [initialState.filter]);

  // 页码改变
  function onPageChange(page: number): void {
    if (page === tableContainer.page) {
      return;
    }
    pageInfoContainer.setPage(page);
  }

  const client = useClient();
  function executeQuery() {
    if (!tableContainer.loading) {
      tableContainer.setLoading(true);
    }
    client
      .query<TableQuery, TableQueryVariables>(TableDocument, {
        id,
        entityID: entityId,
        entityType: entityType,
        ...pageInfoContainer.pageInfo,
        filters: filter,
      })
      .toPromise()
      .then((res) => {
        setResult(() => res);
      });
  }

  useEffect(() => {
    if (result) {
      tableContainer.setLoading(false);
      if (result.error) {
        // 权限控制错误
        const err = parseError(result.error);
        if (isAccessError(err.code)) {
          openSnackbar(err.message, "error");
          if (user && (user.role == Role.IndividualFree || user.role == Role.IndividualPremium)) {
            setInstitutionAuthenticationDialog(true);
          }
          if (user?.role == Role.Basic) {
            setTrailServiceDialogOpen(true);
          }
          if (user?.role == Role.Expired) {
            setActiveServiceDialogOpen(true);
          }
          pageInfoContainer.setPage(0);
          return;
        }
        tableContainer.setRowCount(0);
        tableCacheContainer.updateRowsWithCache([], 0);
        return;
      }

      if (result.data && result.data.table) {
        // 总数
        const totalCount: number = _.get(result.data.table, "totalCount", 0) ?? 0;
        tableContainer.setRowCount(totalCount);

        const permissions = result.data.table.permissions ?? [];
        permissions.forEach((element) => {
          switch (element.__typename) {
            case "PaginationPermission":
              tableContainer.setRowLimit(element.rowLimit);
              break;
            default:
              break;
          }
        });

        // 行数据
        const rowsData = _.get(result.data.table, "nodes") ?? [];
        const newRowsData = rowsData.map((row) => {
          if (row) {
            return JSON.parse(row.JSONValue || "");
          }
          return {};
        });

        tableCacheContainer.updateRowsWithCache(newRowsData, totalCount);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [result]);

  useEffect(() => {
    executeQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pageInfoContainer.pageInfo]);

  function reload() {
    tableContainer.rowsCache.clear();
    pageInfoContainer.setPage(0);
    executeQuery();
  }

  const preFilterRef = useRef<FilterInputs | undefined>();

  useEffect(() => {
    if (!_.isEqual(preFilterRef.current, filter)) {
      pageInfoContainer.reset();
      tableContainer.reset();
      preFilterRef.current = filter;
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id, entityId, filter]);

  useEffect(() => {
    tableContainer.setPage(pageInfoContainer.page);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pageInfoContainer.page]);

  return {
    // executeDataTableQuery,
    onPageChange,
    // fetching: dataTableQueryResult.fetching,
    ...pageInfoContainer,
    id,
    entityId,
    entityType,
    entityName,
    result,
    filter,
    reload,
  };
}

const DataTableContainer = createContainer(useTable);
export default DataTableContainer;
