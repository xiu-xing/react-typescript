import _ from "lodash";
import React, { useEffect, useRef, useState } from "react";
import { GridRow } from "rime-ui/dist/grid/core/types";
import { Permission, useRealmSheetQuery } from "../../../../../generated/graphql";
import { checkPermissions } from "../../../../../utils/permission";
import CommonGrid, { LoadingType } from "../../../../common/common-grid-components/grid";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import { CommonGridConfig } from "../../../../common/common-grid-components/grid/types";
import GridCellRenderingPlugin from "../../../../common/grid/plugins/cell-rendering/rich-text";
import PercentageWidthColumnResizingPlugin from "../../../../common/grid/plugins/column-resizing/percentage-width";
import AdvancedSearchContainer from "../../../container";
import RowSelectionMenu from "./row-selection-menu";

interface RealmDataGridProps {
  sheetId: string;
  gridConfig: CommonGridConfig;
}

const RealmDataGrid: React.FunctionComponent<RealmDataGridProps> = (props) => {
  const { sheetId, gridConfig } = props;
  const {
    useQueryEndCursor,
    columns,
    pageSize,
    sortColumns,
    columnIDs,
    setTotalCount,
    setRowSelections,
    setHasNextPage,
    setFetching,
  } = CommonGridContainer.useContainer();

  const { realm, conditions, templateId, columnsIds: relatedColumnIDs } = AdvancedSearchContainer.useContainer();
  const [gridRows, setGridRows] = useState<GridRow[]>([]);
  const [loadingType, setLoadingType] = useState<LoadingType>();
  const [permissions, setPermissions] = useState<Permission[]>();

  const rowsRef = useRef<GridRow[]>(gridRows);

  const columnResizingPlugin = new PercentageWidthColumnResizingPlugin();
  const [columnResizingPluginState] = useState(columnResizingPlugin);
  const gridCellRenderingPlugin = new GridCellRenderingPlugin();
  gridCellRenderingPlugin.rowSelectionMenu = (
    <RowSelectionMenu
      id={sheetId}
      onSelectedPageSections={() => {
        const IDs = rowsRef.current.map((row) => row.id);
        setRowSelections((prev) => {
          return prev.concat(_.difference(IDs, prev));
        });
      }}
      onDeselectedPageSections={() => {
        const IDs = rowsRef.current.map((row) => row.id);
        setRowSelections((prev) => {
          return _.difference(prev, IDs);
        });
      }}
    />
  );
  const [gridCellRenderingPluginState] = useState(gridCellRenderingPlugin);

  const [realmSheetResult, realmSheetQuery] = useRealmSheetQuery({
    variables: {
      realmID: realm,
      sheetID: sheetId,
      columnIDs: columnIDs.length === 0 ? gridConfig.defaultColumns : columnIDs,
      conditions: conditions,
      orderColumns: sortColumns,
      first: pageSize,
      after: useQueryEndCursor ? useQueryEndCursor : null,
      templateID: templateId,
    },
    pause: true,
  });

  useEffect(() => {
    if (columnIDs.length === 0) return;

    rowsRef.current = [];
    setGridRows([]);
    realmSheetQuery();
  }, [realm, sheetId, columnIDs, conditions, sortColumns, useQueryEndCursor, templateId]);

  useEffect(() => {
    setFetching(realmSheetResult.fetching);

    if (realmSheetResult.error) {
      setLoadingType("nodata");
      return;
    }

    const permissions = realmSheetResult.data?.realmSheet?.permissions;
    setPermissions(permissions as Permission[]);

    if (realmSheetResult.fetching) {
      setLoadingType("loading");
      return;
    }

    if (checkPermissions(permissions)) {
      setTotalCount(0);
      setLoadingType("data");
      return;
    }

    const count = realmSheetResult.data?.realmSheet?.totalCount;
    if (count != undefined) {
      if (count === 0) {
        setLoadingType("nodata");
        return;
      }
      setLoadingType("data");
      setTotalCount(count);
      setHasNextPage(realmSheetResult.data?.realmSheet?.pageInfo.hasNextPage);
    }

    const data = realmSheetResult.data?.realmSheet?.nodes;

    if (data) {
      const rowList = data.map((item) => {
        const id = {
          entityId: item?.entityID,
          entityType: item?.entityType,
        };

        if (item?.data) return { ...JSON.parse(item.data), "id": JSON.stringify(id) };
      });

      rowsRef.current = rowList;
      setGridRows(rowList);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [realmSheetResult, setTotalCount]);

  return (
    <CommonGrid
      selectable
      gridConfig={gridConfig}
      gridRows={gridRows}
      relatedColumnIDs={relatedColumnIDs}
      loadingType={loadingType}
      permissions={permissions}
      cellRenderingPlugin={gridCellRenderingPluginState}
      columnResizingPlugin={columnResizingPluginState}
    />
  );
};

export default RealmDataGrid;
