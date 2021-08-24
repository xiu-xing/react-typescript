import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import _ from "lodash";
import React, { useEffect, useRef, useState } from "react";
import { GridRow } from "rime-ui/dist/grid/core/types";
import { Permission, useTrealmRealmSheetQuery } from "../../../../../generated/graphql";
import { checkPermissions } from "../../../../../utils/permission";
import CommonGrid from "../../../../common/common-grid-components/grid";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import { CommonGridConfig } from "../../../../common/common-grid-components/grid/types";
import GridCellRenderingPlugin from "../../../../common/grid/plugins/cell-rendering/rich-text";
import PercentageWidthColumnResizingPlugin from "../../../../common/grid/plugins/column-resizing/percentage-width";
import InstitutionGridTabContainer from "../container";
import RowSelectionMenu from "./row-selection-menu";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
  }),
);
type LoadingType = "loading" | "nodata" | "data";

interface InstitutionDataGridProps {
  sheetId: string;
  gridConfig: CommonGridConfig;
}

const InstitutionDataGrid: React.FunctionComponent<InstitutionDataGridProps> = (props) => {
  const classes = useStyles();
  const muse = useClient();
  const { sheetId, gridConfig } = props;
  const [gridRows, setGridRows] = useState<GridRow[]>([]);
  const [loadingType, setLoadingType] = useState<LoadingType>();
  const [permissions, setPermissions] = useState<Permission[]>();

  const rowsRef = useRef<GridRow[]>(gridRows);

  const { conditions, relatedColumnIDs } = InstitutionGridTabContainer.useContainer();

  const {
    useQueryEndCursor,
    pageSize,
    sortColumns,
    columnIDs,
    setTotalCount,
    setRowSelections,
    setHasNextPage,
    setFetching,
    updateGridRow,
  } = CommonGridContainer.useContainer();

  const [trealmRealmSheetResult, executeTrealmRealmSheetQuery] = useTrealmRealmSheetQuery({
    variables: {
      sheetID: sheetId,
      columnIDs: columnIDs.length === 0 ? gridConfig.defaultColumns : columnIDs,
      conditions: conditions,
      orderColumns: sortColumns,
      first: pageSize,
      after: useQueryEndCursor ? useQueryEndCursor : null,
    },
    pause: true,
  });

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

  useEffect(() => {
    if (columnIDs.length === 0) return;

    rowsRef.current = [];

    muse.sendTrackingEvent("trealm.sheet", {
      "sheet_id": sheetId,
      "conditions": JSON.stringify(conditions),
      "column_ids": columnIDs,
      "orderColumns": sortColumns.map((column) => column.columnId),
    });
    setGridRows([]);
    executeTrealmRealmSheetQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sheetId, columnIDs, conditions, sortColumns, useQueryEndCursor]);

  useEffect(() => {
    rowsRef.current = [];

    setGridRows([]);
    executeTrealmRealmSheetQuery();
  }, [updateGridRow]);

  useEffect(() => {
    setFetching(trealmRealmSheetResult.fetching);

    if (trealmRealmSheetResult.error) {
      setLoadingType("nodata");
      return;
    }

    const permissions = trealmRealmSheetResult.data?.trealmRealmSheet?.permissions;
    setPermissions(permissions as Permission[]);

    if (trealmRealmSheetResult.fetching) {
      setLoadingType("loading");
      return;
    }

    if (checkPermissions(permissions)) {
      setTotalCount(0);
      setLoadingType("data");
      return;
    }

    const count = trealmRealmSheetResult.data?.trealmRealmSheet?.totalCount;
    if (count != undefined) {
      if (count === 0) {
        setLoadingType("nodata");
        return;
      }
      setLoadingType("data");
      setTotalCount(count);
      setHasNextPage(trealmRealmSheetResult.data?.trealmRealmSheet?.pageInfo.hasNextPage);
    }

    const data = trealmRealmSheetResult.data?.trealmRealmSheet?.nodes;

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
  }, [trealmRealmSheetResult, setTotalCount]);

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

export default InstitutionDataGrid;
