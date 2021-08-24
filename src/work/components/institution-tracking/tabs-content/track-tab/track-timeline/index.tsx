import { ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import CloseIcon from "@material-ui/icons/Close";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import _ from "lodash";
import React, { useEffect, useMemo, useRef, useState } from "react";
import { useClient } from "urql";
import ConfigContainer from "../../../../../containers/configContainer";
import {
  EntityType,
  Permission,
  TimelineRowNode,
  TrackerTimelineDocument,
  TrackerTimelineQuery,
  TrackerTimelineQueryVariables,
} from "../../../../../generated/graphql";
import { checkPermissions } from "../../../../../utils/permission";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import CommonTimeline from "../../../../common/common-grid-components/timeline";
import { TrackerTimelineConfig } from "../../../../common/common-grid-components/timeline/types";
import FilterInputSelect from "../../../../common/config-select-filter-area/filter-input-select";
import PermissionComponent from "../../../../common/permission-component";
import InstitutionTrackGridTabContainer from "../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      flex: 1,
      display: "flex",
      flexDirection: "column",
    },
    titleBox: {
      display: "flex",
      alignItems: "center",
      justifyContent: "space-between",
      padding: "24px 24px 8px 24px",
    },
    titleImg: {
      marginRight: 6,
      width: 24,
      height: 24,
      objectFit: "contain",
    },
    titleText: {
      color: "#333",
      fontSize: 16,
      fontWeight: 500,
      display: "flex",
      alignItems: "center",
    },
    timeline: {
      alignItems: "flex-start",
      margin: 0,
      "& .MuiTimelineItem-missingOppositeContent:before": {
        flex: "unset",
        padding: "24px 0",
      },
      "& .MuiTimeline-root": {
        padding: "6px 24px",
      },
      "& .MuiTimelineItem-root": {
        width: "100%",
        minHeight: 50,
      },
    },
    timelineItemContent: {
      display: "grid",
      padding: "0 0 10px 12px",
      gridRowGap: 4,
    },
    dot: {
      padding: 3,
      margin: "5px 0",
    },
    timeText: {
      fontSize: 14,
      color: "#666",
    },
    tagBox: {
      display: "flex",
      columnGap: "4px",
      paddingTop: 4,
    },
    tag: {
      whiteSpace: "nowrap",
      borderRadius: 2,
      padding: "2px 4px",
      margin: "2px 2px 0px 2px",
      backgroundColor: "rgba(79, 112, 155, 0.12)",
    },
    tagLabel: {
      fontSize: 10,
      color: theme.palette.primary.main,
      fontWeight: 500,
    },
    simpleBar: {
      height: "100%",
      overflow: "auto",
    },
    load: {
      justifyContent: "center",
    },
    line: {
      width: "2px",
    },
    blueBorder: {
      borderColor: theme.palette.primary.main,
    },
    blueBackground: {
      backgroundColor: theme.palette.primary.main,
    },
    closeIcon: {
      color: "#666",
      fontSize: "24px",
    },
    closeButton: {
      position: "absolute",
      top: 24,
      right: 24,
      borderRadius: "50%",
    },
    permission: {
      display: "flex",
      position: "relative",
      justifyContent: "center",
      paddingTop: "calc( 50% - 62px)",
      padding: "0 24px",
    },
    filterInputs: {
      display: "flex",
      padding: "8px 24px",
      columnGap: 16,
    },
  }),
);

export interface TimelineData {
  title: string;
  logo?: string;
  hasNextPage: boolean;
  timelineList: TimelineRowNode[];
  showNodata?: boolean;
}

interface InstitutionGridTimelineProps {
  timelineID: string;
}

const InstitutionTrackTimeline: React.FunctionComponent<InstitutionGridTimelineProps> = ({ timelineID }) => {
  const classes = useStyles();
  const client = useClient();
  const muse = useMuseClient();
  const { trealmTrackerTimelineConfigs } = ConfigContainer.useContainer();
  const {
    timelineEntity,
    timelineFilters,
    timelineData,
    trackTheme,
    updateTimelineSelectorFilters,
    updateTimelineMultiSelectorFilters,
    setTimelineEntity,
  } = InstitutionTrackGridTabContainer.useContainer();

  const { setHighlightRow } = CommonGridContainer.useContainer();

  const [fetching, setFetching] = useState(false);
  const [dataList, setDataList] = useState<TimelineRowNode[]>([]);
  const [showNodata, setShowNodata] = useState<boolean>(false);
  const [trackerTimelineConfig, setTrackerTimelineConfig] = useState<TrackerTimelineConfig>();
  const [permissions, setPermissions] = useState<Permission[]>();
  const [backTop, setBackTop] = useState(0);

  const dataListRef = useRef<TimelineRowNode[]>([]);
  const hasNextPageRef = useRef(true);
  const fetchingRef = useRef(false);

  const id = timelineEntity?.entityId ?? "";
  const type = timelineEntity?.entityType ?? EntityType.Organization;

  async function executeTrackerTimelineQuery(after?: string) {
    setShowNodata(false);

    client
      .query<TrackerTimelineQuery, TrackerTimelineQueryVariables>(TrackerTimelineDocument, {
        timelineID: timelineID ?? "",
        entityRequests: [
          {
            entityId: id,
            entityType: type,
          },
        ],
        trackerTheme: trackTheme,
        first: 15,
        after: after,
        filters: timelineFilters,
      })
      .toPromise()
      .then((res) => {
        const data = res.data?.trackerTimeline;

        if (!data) return;

        const permissions = data.permissions;
        setPermissions(permissions as Permission[]);

        if (data.totalCount === 0 && !after) {
          setShowNodata(true);
          return;
        }
        setShowNodata(false);

        const nodes = data.nodes;
        const hasNextPage = data.pageInfo.hasNextPage ?? false;
        hasNextPageRef.current = hasNextPage;

        if (!after) {
          return setDataList((dataListRef.current = (nodes ?? []) as TimelineRowNode[]));
        }

        setDataList((prev) => {
          const newList = _.clone(prev);
          newList.push(...(nodes as TimelineRowNode[]));
          return (dataListRef.current = newList);
        });
      })
      .finally(() => {
        setFetching((fetchingRef.current = false));
        muse.sendTrackingEvent("trealm_tracker.timeline", {
          "timeline_id": timelineID ?? "",
          "entities": [
            {
              id: id,
              type: type,
            },
          ],
          "tracker_theme": trackTheme,
          "filters": JSON.stringify(timelineFilters),
        });
      });
  }

  useEffect(() => {
    if (trealmTrackerTimelineConfigs) {
      const data = TrackerTimelineConfig.fromJSON(trealmTrackerTimelineConfigs[timelineID]);
      setTrackerTimelineConfig(data);
    }
  }, [timelineID, trealmTrackerTimelineConfigs]);

  useEffect(() => {
    setBackTop((prev) => prev + 1);
    hasNextPageRef.current = timelineData.hasNextPage;
    dataListRef.current = timelineData.timelineList;
    setDataList(timelineData.timelineList);
    setShowNodata(timelineData?.showNodata ?? false);
  }, [timelineData]);

  useEffect(() => {
    if (!timelineFilters) return;
    setFetching((fetchingRef.current = true));
    setDataList([]);
    executeTrackerTimelineQuery();
  }, [timelineFilters]);

  const onScrollArrivedBottomHandler = useMemo(() => {
    if (!hasNextPageRef.current) return undefined;

    return () => {
      if (fetchingRef.current) return;
      setFetching((fetchingRef.current = true));
      setShowNodata(false);
      const after = btoa((dataListRef.current.length - 1).toString());
      executeTrackerTimelineQuery(after);
    };
  }, [hasNextPageRef.current]);

  function closeHandler() {
    setHighlightRow(undefined);
    setTimelineEntity(undefined);
  }

  function content() {
    if (permissions && checkPermissions(permissions))
      return (
        <div className={classes.permission}>
          <ButtonBase className={classes.closeButton}>
            <CloseIcon className={classes.closeIcon} onClick={closeHandler} />
          </ButtonBase>
          <PermissionComponent permissions={permissions} />
        </div>
      );

    return (
      <>
        <div className={classes.titleBox}>
          <Typography className={classes.titleText}>{timelineData.title}</Typography>
          <ButtonBase style={{ borderRadius: "50%" }}>
            <CloseIcon className={classes.closeIcon} onClick={closeHandler} />
          </ButtonBase>
        </div>
        {trackerTimelineConfig && (
          <div style={{ padding: "8px 24px" }}>
            <FilterInputSelect
              filterConfigs={trackerTimelineConfig.filterProtos}
              filterInputs={timelineFilters}
              onSelectFilterChange={updateTimelineSelectorFilters}
              onMultiSelectFilterChange={updateTimelineMultiSelectorFilters}
            />
          </div>
        )}
        <CommonTimeline
          timelineList={dataList}
          trackerTimelineConfig={trackerTimelineConfig}
          fetching={fetching}
          showNodata={showNodata}
          onScrollArrivedBottomHandler={onScrollArrivedBottomHandler}
          backTop={backTop}
        />
      </>
    );
  }

  return <div className={classes.root}>{content()}</div>;
};

export default InstitutionTrackTimeline;
