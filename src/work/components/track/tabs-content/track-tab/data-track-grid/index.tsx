import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import _ from "lodash";
import React, { useCallback, useEffect, useRef, useState } from "react";
import { GridRow } from "rime-ui/dist/grid/core/types";
import { useClient } from "urql";
import {
  EntityInput,
  Permission,
  TimelineRowNode,
  TrackerTimelineDocument,
  TrackerTimelineQuery,
  TrackerTimelineQueryVariables,
  useTrackerSheetQuery,
} from "../../../../../generated/graphql";
import { checkPermissions } from "../../../../../utils/permission";
import CommonGrid from "../../../../common/common-grid-components/grid";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import { CommonGridConfig } from "../../../../common/common-grid-components/grid/types";
import GridCellRenderingPlugin from "../../../../common/grid/plugins/cell-rendering/rich-text";
import PercentageWidthColumnResizingPlugin from "../../../../common/grid/plugins/column-resizing/percentage-width";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import { TimelineData } from "../../../../institution-tracking/tabs-content/track-tab/track-timeline";
import TrackContainer from "../../../container";
import TrackGridTabContainer from "../container";
import RowSelectionMenu from "./row-selection-menu";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
  }),
);

interface DataTrackGridProps {
  id: string;
  gridConfig: CommonGridConfig;
  timelineID?: string;
}
type LoadingType = "loading" | "nodata" | "data";

const DataTrackGrid: React.FunctionComponent<DataTrackGridProps> = (props) => {
  const classes = useStyles();
  const client = useClient();
  const muse = useMuseClient();

  const { id, timelineID, gridConfig } = props;
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [permissions, setPermissions] = useState<Permission[]>();

  const [gridRows, setGridRows] = useState<GridRow[]>([]);
  const [loadingType, setLoadingType] = useState<LoadingType>();

  const rowsRef = useRef<GridRow[]>([]);

  const { trackTheme } = TrackContainer.useContainer();

  const { timelineEntity, setTimelineEntity, setTimelineData, setTimelineFilters, gridFilters } =
    TrackGridTabContainer.useContainer();

  const {
    updateGridRow,
    useQueryEndCursor,
    pageSize,
    sortColumns,
    setTotalCount,
    setHasNextPage,
    setFetching,
    setHighlightRow,
    setRowSelections,
  } = CommonGridContainer.useContainer();

  const columnResizingPlugin = new PercentageWidthColumnResizingPlugin();
  const [columnResizingPluginState] = useState(columnResizingPlugin);
  const gridCellRenderingPlugin = new GridCellRenderingPlugin();
  gridCellRenderingPlugin.rowSelectionMenu = (
    <RowSelectionMenu
      id={id}
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

  const [trackerSheetResult, trackerSheetQuery] = useTrackerSheetQuery({
    variables: {
      sheetID: id,
      filters: gridFilters,
      trackerTheme: trackTheme,
      orderColumns: sortColumns,
      first: pageSize,
      after: useQueryEndCursor ? useQueryEndCursor : null,
    },
    requestPolicy: "network-only",
    pause: true,
  });

  function getTimelineData(row: GridRow) {
    if (!timelineID) return;
    const entityJSON: string = _.get(row, "entity") ?? "";
    const entity = JSON.parse(entityJSON) as EntityInput;

    if (_.isEqual(timelineEntity, entity)) return;

    client
      .query<TrackerTimelineQuery, TrackerTimelineQueryVariables>(TrackerTimelineDocument, {
        timelineID: timelineID ?? "",
        entityRequests: [entity],
        trackerTheme: trackTheme,
        first: 15,
      })
      .toPromise()
      .then((res) => {
        const data = res.data?.trackerTimeline;

        if (!data) return;

        const permissions = data.permissions;
        if (permissions && checkPermissions(permissions)) {
          setHighlightRow(undefined);
          return openSnackbar("访问失败，超过每日访问追踪详情上限，请明天再试。", "error");
        }

        const nodes = data.nodes;
        const hasNextPage = data.pageInfo.hasNextPage ?? false;

        const timelineData: TimelineData = {
          title: data.entity?.entityName ?? "",
          logo: data.entity?.portraitURL ?? "",
          hasNextPage: hasNextPage,
          timelineList: (nodes ?? []) as TimelineRowNode[],
        };

        setTimelineFilters(undefined);
        setHighlightRow((prev) => {
          if (row.id === prev) return prev;
          return row.id;
        });

        if (nodes === null) {
          timelineData.showNodata = true;
          setTimelineData(timelineData);
          setTimelineEntity(entity);

          return;
        }

        timelineData.showNodata = false;
        setTimelineData(timelineData);
        setTimelineEntity(entity);
      })
      .finally(() => {
        muse.sendTrackingEvent("tracker.timeline", {
          "timeline_id": timelineID ?? "",
          "entities": [
            {
              id: entity.entityId,
              type: entity.entityType,
            },
          ],
          "tracker_theme": trackTheme,
          "filters": "",
        });
      });
  }

  useEffect(() => {
    rowsRef.current = [];
    setGridRows([]);
    muse.sendTrackingEvent("tracker.sheet", {
      "sheet_id": id,
      "tracker_theme": trackTheme,
      "date_range_filter": JSON.stringify(gridFilters?.dateRangeSelectorFilterInput),
      "tag_filter": JSON.stringify(gridFilters?.selectorFilterInputs),
      "order_columns": sortColumns.map((item) => item.columnId),
    });
    trackerSheetQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id, gridFilters, useQueryEndCursor, sortColumns]);

  useEffect(() => {
    if (updateGridRow != undefined) {
      rowsRef.current = [];
      setGridRows([]);
      trackerSheetQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [updateGridRow]);

  useEffect(() => {
    setHighlightRow(undefined);
    setTimelineEntity(undefined);
    setFetching(trackerSheetResult.fetching);

    if (trackerSheetResult.error) {
      setLoadingType("nodata");
      return;
    }

    if (trackerSheetResult.fetching) {
      setLoadingType("loading");
      return;
    }

    const count = trackerSheetResult.data?.trackerSheet?.totalCount;
    if (count != undefined) {
      if (count === 0) {
        setLoadingType("nodata");
        return;
      }
      setLoadingType("data");
      setTotalCount(count);
      setHasNextPage(trackerSheetResult.data?.trackerSheet?.pageInfo.hasNextPage);
    }

    const data = trackerSheetResult.data?.trackerSheet?.nodes;

    if (data) {
      const rowList = data.map((item) => {
        const entity = {
          entityId: item?.entityID,
          entityType: item?.entityType,
        };
        if (item?.data) return { ...JSON.parse(item.data), entity: JSON.stringify(entity), "id": item?.id };
      });
      rowsRef.current = rowList;
      setGridRows(rowList);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [trackerSheetResult]);

  const onHighlight = useCallback((row) => {
    getTimelineData(row);
  }, []);

  return (
    <CommonGrid
      gridConfig={gridConfig}
      cellRenderingPlugin={gridCellRenderingPluginState}
      columnResizingPlugin={columnResizingPluginState}
      gridRows={gridRows}
      disableFix
      highlightable
      loadingType={loadingType}
      onHighlightChange={onHighlight}
      permissions={permissions}
    />
  );
};

export default DataTrackGrid;
