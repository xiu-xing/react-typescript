import { useMediaQuery } from "@material-ui/core";
import { createStyles, makeStyles, useTheme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { useEffect, useState } from "react";
import ConfigContainer from "../../../../containers/configContainer";
import { TrackerTab } from "../../../../generated/graphql";
import CommonGridContainer from "../../../common/common-grid-components/grid/container";
import { CommonGridConfig } from "../../../common/common-grid-components/grid/types";
import InstitutionTrackGridTabContainer from "./container";
import InstitutionDataTrackGrid from "./data-track-grid";
import GridFilter from "./grid-filter";
import InstitutionTrackGridPaginationBar from "./pagination-bar";
import Prefix from "./pagination-bar/prefix";
import TrackSearchInput from "./pagination-bar/track-search-input";
import InstitutionTrackTimeline from "./track-timeline";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      margin: "0 16px",
    },
    sheetChart: {
      display: "flex",
      height: "100%",
    },
    SMScreenStyle: {
      height: "100%",
      "& .TabContent": {
        display: "none !important",
      },
    },
    contentBox: {
      width: "100%",
      height: "100%",
      overflowY: "hidden",
    },
    sheetDefault: {
      height: "100%",
      display: "flex",
    },
    TabContent: {
      flex: 1.5,
      overflowX: "auto",
      height: "100%",
      display: "grid",
      borderRight: "1px solid rgb(224, 224, 224)",
      gridTemplateRows: "auto auto 1fr",
    },
    dialogTitle: {
      paddingBottom: 0,
      "& .MuiTypography-root": {
        display: "flex",
        justifyContent: "flex-end",
      },
    },
    closeButton: {
      borderRadius: "50%",
      position: "absolute",
      top: 24,
      right: 24,
    },
    closeIcon: {
      color: "#666",
    },
    img: {
      width: 480,
      height: 320,
    },
    guidanceText: {
      fontSize: 18,
      fontWeight: 500,
      color: "#666",
      textAlign: "center",
      paddingBottom: 24,
    },
  }),
);

interface InstitutionTrackerTabProps {
  tab: TrackerTab;
}

const InstitutionTrackTab: React.FunctionComponent<InstitutionTrackerTabProps> = ({ tab }) => {
  const classes = useStyles();
  const theme = useTheme();
  const { trealmTrackerSheetConfigs } = ConfigContainer.useContainer();
  const { timelineEntity, setTrackTheme } = InstitutionTrackGridTabContainer.useContainer();

  const { setPage, setUseQueryEndCursor } = CommonGridContainer.useContainer();
  const downSM = useMediaQuery(theme.breakpoints.down("sm"));
  const [gridConfig, setGridConfig] = useState<CommonGridConfig>();
  const [timelineID, setTimelineID] = useState<string>();
  const [useSMStyle, setUseSMStyle] = useState(false);

  useEffect(() => {
    setPage(1);
    setUseQueryEndCursor(null);
    setTrackTheme(tab.trackerTheme);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tab]);

  useEffect(() => {
    if (!trealmTrackerSheetConfigs) return;
    const config = CommonGridConfig.fromJSON(trealmTrackerSheetConfigs[tab.id]);

    setTimelineID(config.timelineId);
    setGridConfig(config);
  }, [trealmTrackerSheetConfigs]);

  useEffect(() => {
    setUseSMStyle(!!timelineEntity && downSM);
  }, [timelineEntity, downSM]);

  return (
    <>
      <div className={clsx(classes.sheetDefault, useSMStyle && classes.SMScreenStyle)}>
        {gridConfig && (
          <div className={clsx(classes.TabContent, "TabContent")}>
            {tab.filters && <GridFilter filters={tab.filters} />}
            <InstitutionTrackGridPaginationBar
              prefix={<Prefix gridConfig={gridConfig} />}
              suffix={<TrackSearchInput />}
            />
            <InstitutionDataTrackGrid id={tab.sheetID} gridConfig={gridConfig} timelineID={timelineID} />
          </div>
        )}
        {timelineEntity && timelineID && <InstitutionTrackTimeline timelineID={timelineID!} />}
      </div>
    </>
  );
};

export default InstitutionTrackTab;
