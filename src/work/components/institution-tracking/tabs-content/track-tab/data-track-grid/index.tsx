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
  useTrealmTrackerSheetQuery,
} from "../../../../../generated/graphql";
import { checkPermissions } from "../../../../../utils/permission";
import CommonGrid from "../../../../common/common-grid-components/grid";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import { CommonGridConfig } from "../../../../common/common-grid-components/grid/types";
import GridCellRenderingPlugin from "../../../../common/grid/plugins/cell-rendering/rich-text";
import PercentageWidthColumnResizingPlugin from "../../../../common/grid/plugins/column-resizing/percentage-width";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import InstitutionTrackGridTabContainer from "../container";
import { TimelineData } from "../track-timeline";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
  }),
);

interface InstitutionDataTrackGridProps {
  id: string;
  gridConfig: CommonGridConfig;
  timelineID?: string;
}
type LoadingType = "loading" | "nodata" | "data";

const InstitutionDataTrackGrid: React.FunctionComponent<InstitutionDataTrackGridProps> = (props) => {
  const classes = useStyles();
  const client = useClient();
  const muse = useMuseClient();

  const { id, timelineID, gridConfig } = props;
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [permissions, setPermissions] = useState<Permission[]>();

  const [gridRows, setGridRows] = useState<GridRow[]>([]);
  const [loadingType, setLoadingType] = useState<LoadingType>();

  const rowsRef = useRef<GridRow[]>([]);

  const { trackTheme, timelineEntity, setTimelineEntity, setTimelineData, setTimelineFilters, gridFilterInputs } =
    InstitutionTrackGridTabContainer.useContainer();

  const {
    updateGridRow,
    useQueryEndCursor,
    pageSize,
    sortColumns,
    setTotalCount,
    setHasNextPage,
    setFetching,
    setHighlightRow,
  } = CommonGridContainer.useContainer();

  const columnResizingPlugin = new PercentageWidthColumnResizingPlugin();
  const [columnResizingPluginState] = useState(columnResizingPlugin);
  const gridCellRenderingPlugin = new GridCellRenderingPlugin();
  const [gridCellRenderingPluginState] = useState(gridCellRenderingPlugin);

  const [trackerSheetResult, trackerSheetQuery] = useTrealmTrackerSheetQuery({
    variables: {
      sheetID: id,
      filters: gridFilterInputs ?? {},
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
        origin: "bapp_tracker",
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
        muse.sendTrackingEvent("trealm_tracker.timeline", {
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
    muse.sendTrackingEvent("trealm_tracker.sheet", {
      "sheet_id": id,
      "tracker_theme": trackTheme,
      "filters": JSON.stringify(gridFilterInputs),
      "order_columns": sortColumns.map((item) => item.columnId),
    });
    trackerSheetQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id, gridFilterInputs, useQueryEndCursor, sortColumns]);

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

    const count = trackerSheetResult.data?.trealmTrackerSheet?.totalCount;
    if (count != undefined) {
      if (count === 0) {
        setHighlightRow(undefined);
        setTimelineEntity(undefined);
        setLoadingType("nodata");
        return;
      }
      setLoadingType("data");
      setTotalCount(count);
      setHasNextPage(trackerSheetResult.data?.trealmTrackerSheet?.pageInfo.hasNextPage);
    }

    const data = trackerSheetResult.data?.trealmTrackerSheet?.nodes;

    if (data) {
      const rowList = data.map((item) => {
        const entity = {
          entityId: item?.entityID,
          entityType: item?.entityType,
        };
        if (item?.data) return { ...JSON.parse(item.data), entity: JSON.stringify(entity), "id": item?.entityID };
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
      selectable={false}
      gridConfig={gridConfig}
      cellRenderingPlugin={gridCellRenderingPluginState}
      columnResizingPlugin={columnResizingPluginState}
      gridRows={gridRows}
      loadingType={loadingType}
      highlightable
      onHighlightChange={onHighlight}
      permissions={permissions}
    />
  );
};

export default InstitutionDataTrackGrid;
