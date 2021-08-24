import { useClient } from "urql";
import {
  TeamEntitiesQuery,
  TeamEntitiesQueryVariables,
  TeamEntitiesDocument,
  KeyValueMapDocument,
  KeyValueMapQuery,
  KeyValueMapQueryVariables,
  TeamEntity,
  OperationEntity,
  EntityType,
  DeleteFromTeamGroupMutation,
  DeleteFromTeamGroupMutationVariables,
  DeleteFromTeamGroupDocument,
} from "./../../../../generated/graphql";
import { useEffect, useState } from "react";
import { createContainer } from "unstated-next";
import PageInfoContainer from "../../../common/table/pageInfoContainer";
import TableContainer from "../../../common/table/tableContainer";
import InstitutionContainer from "../../institutionContainer";
import _ from "lodash";
import { usePageCache } from "../../../../utils/hooks";
import SnackbarContainer from "../../../common/snackbar/snackbarContainer";

interface InstitutionInitialState {
  code: string;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useInstitutionTable(initialState?: InstitutionInitialState) {
  const { openSnackbar } = SnackbarContainer.useContainer();
  const client = useClient();
  const { queryPageSize, page, setPage, pageSize, pageInfo } = PageInfoContainer.useContainer();
  const [deleteDataConfirmDialogOpen, setDeleteDataConfirmDialogOpen] = useState<boolean>(false);
  const {
    institutionChildrenType,
    funcId,
    executeTeamGroupOverviewQuery,
    refreshTable,
  } = InstitutionContainer.useContainer();
  const [totalPage, setTotalPage] = useState(0);
  const [codes] = useState<Array<string>>(
    initialState?.code == "institutional_subject"
      ? ["corporate_entity", "fund_manager"]
      : [initialState?.code as string],
  );
  const [selectedEntities, setSelectedEntities] = useState<OperationEntity[]>([]);
  const {
    selectedRows,
    rows,
    rowCount,
    updateRows,
    setRowCount,
    loading,
    setLoading,
    isSelectedAll,
    scrollToTop,
    pageCount,
    setSelectedRows,
    ...tableContainer
  } = TableContainer.useContainer();

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  function getEntityFromTableRows(index: number): OperationEntity | null {
    // 获取包含`column.name`的属性
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const rowJsonValue = JSON.parse(rows[index] as string);
    const rowNameObj = _.get(rowJsonValue, "name");
    // 从包含`column.name`属性下获取 entityID 和 entityType
    const entityID: string = _.get(rowNameObj[0], ["action", "args", "entity_id"]) ?? "";
    const entityType: EntityType = _.get(rowNameObj[0], ["action", "args", "entity_type"]) ?? EntityType.Organization;
    if (entityID && entityType) {
      return {
        entityID,
        entityType,
      };
    }
    return null;
  }

  const queryTeamEntities = async (pageInfo: { first: number; after?: string }): Promise<void> => {
    try {
      const queryResult = await client
        .query<TeamEntitiesQuery, TeamEntitiesQueryVariables>(
          TeamEntitiesDocument,
          {
            codes: codes,
            ...pageInfo,
          },
          {
            requestPolicy: "network-only",
          },
        )
        .toPromise();

      const nodes = queryResult.data?.teamEntities?.nodes ?? [];
      const totalCount = queryResult.data?.teamEntities?.totalCount ?? 0;
      setRowCount(() => totalCount);
      setTotalPage(() => Math.ceil(totalCount / pageSize));

      // 如果当前页面大于总页面把当前页面设置为最后一页
      const endPage = totalCount === 0 ? 0 : Math.floor((totalCount - 1) / pageSize);
      if (totalCount >= 0 && page > endPage) {
        setPage(() => endPage);
      }

      const fetchRows = nodes.map((row: TeamEntity) => {
        if (row) {
          try {
            const rowItem = JSON.parse(row["data"] || "{}");
            if (rowItem) {
              rowItem.entity_id = row["entityID"];
              rowItem.entity_type = row["entityType"];
            }
            return rowItem;
          } catch (error) {
            return {};
          }
        }
        return {};
      });
      const result = {
        first: pageInfo.first,
        after: pageInfo.after,
        entities: fetchRows,
      };

      const requestBody = JSON.stringify(result);
      const keyValueDataResult = await client
        .query<KeyValueMapQuery, KeyValueMapQueryVariables>(
          KeyValueMapDocument,
          {
            funcID: funcId(institutionChildrenType),
            requestBody: requestBody,
          },
          {
            requestPolicy: "network-only",
          },
        )
        .toPromise();
      const rowData = JSON.parse(keyValueDataResult.data?.keyValueMap?.data as string);

      if (rowData == null) {
        updateRows([], 0);
      }

      // 更新页面数据
      const endPosition = Math.ceil(((page + 1) * pageSize) / queryPageSize) * queryPageSize - 1;
      const startPosition = endPosition - (queryPageSize - 1);
      const startRows = rows.slice(0, startPosition);
      updateRows([...startRows, ...rowData], totalCount);
    } catch {
      updateRows([], 0);
      setTotalPage(0);
      setPage(() => 0);
      setRowCount(0);
    } finally {
      setLoading(() => false);
    }
  };

  const { staleAllCache, fetching } = usePageCache({
    page,
    setPage,
    pageRowSize: pageSize,
    fetchPageMultiple: queryPageSize / pageSize,
    rowTotalCount: rowCount,
    fetchRows: queryTeamEntities,
    delay: 100,
  });

  useEffect(() => {
    if (institutionChildrenType === initialState?.code) {
      staleAllCache(0);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [institutionChildrenType, refreshTable]);

  useEffect(() => {
    setLoading(() => fetching);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [fetching]);

  useEffect(() => {
    tableContainer.setPage(() => page);
    scrollToTop();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page]);

  const onPageChange = (page: number): void => {
    setPage(page);
  };

  const deleteEntity = async (): Promise<void> => {
    let entities: OperationEntity[] = new Array<OperationEntity>();
    if (isSelectedAll) {
      const queryResult = await client
        .query<TeamEntitiesQuery, TeamEntitiesQueryVariables>(
          TeamEntitiesDocument,
          {
            codes: codes,
            first: rowCount,
          },
          {
            requestPolicy: "network-only",
          },
        )
        .toPromise();
      const nodes = queryResult.data?.teamEntities?.nodes ?? [];
      nodes.map((row: TeamEntity) => {
        if (row.entityID && row.entityType)
          entities.push({
            entityID: row.entityID,
            entityType: row.entityType,
          });
      });
      // 拿到取消的数组
      const fullIndexArray: number[] = new Array<number>(rowCount);
      for (const index of _.range(0, rowCount)) {
        fullIndexArray[index] = index;
      }
      const deleteEntities: OperationEntity[] = new Array<OperationEntity>();
      const deleteIndexes = fullIndexArray.filter((value) => {
        return selectedRows.indexOf(value) == -1;
      });
      deleteIndexes.forEach((value: number) => {
        const entity = getEntityFromTableRows(value);
        if (entity) {
          deleteEntities.push(entity);
        }
      });
      entities = _.pullAllBy(entities, deleteEntities, "entityID");
    } else {
      selectedRows.forEach((index) => {
        const entity = getEntityFromTableRows(index);
        if (entity) {
          entities.push(entity);
        }
      });
    }

    client
      .query<DeleteFromTeamGroupMutation, DeleteFromTeamGroupMutationVariables>(
        DeleteFromTeamGroupDocument,
        {
          input: {
            entities: entities,
            groupCodes: codes,
          },
        },
        {
          requestPolicy: "network-only",
        },
      )
      .toPromise()
      .then((res) => {
        if (res.data?.deleteFromTeamGroup) {
          staleAllCache();
          executeTeamGroupOverviewQuery();
          setSelectedRows([]);
          openSnackbar("操作成功", "success");
          return;
        }
        openSnackbar("操作失败", "error");
      });
  };

  return {
    deleteEntity,
    queryPageSize,
    page,
    setPage,
    pageSize,
    pageInfo,
    fetching,
    loading,
    rowCount,
    totalPage,
    pageCount,
    onPageChange,
    selectedEntities,
    setSelectedEntities,
    queryTeamEntities,
    isSelectedAll,
    staleAllCache,
    codes,
    executeTeamGroupOverviewQuery,
    deleteDataConfirmDialogOpen,
    setDeleteDataConfirmDialogOpen,
  };
}

const InstitutionTableContainer = createContainer(useInstitutionTable);
export default InstitutionTableContainer;
