import { ButtonBase, Dialog, useMediaQuery } from "@material-ui/core";
import { createStyles, makeStyles, useTheme } from "@material-ui/core/styles";
import clsx from "clsx";
import { Close } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import ConfigContainer from "../../../../containers/configContainer";
import UserContainer from "../../../../containers/userContainer";
import { SheetTab } from "../../../../generated/graphql";
import CommonGridContainer from "../../../common/common-grid-components/grid/container";
import { CommonGridConfig } from "../../../common/common-grid-components/grid/types";
import { Help } from "../../assets";
import TrackGridTabContainer from "./container";
import DataTrackGrid from "./data-track-grid";
import GridFilter from "./grid-filter";
import GridPaginationBar from "./pagination-bar";
import TrackerPrefix from "./pagination-bar/prefix";
import TrackerSuffix from "./pagination-bar/suffix";
import RowOperationsBar from "./row-operations-bar";
import TrackTimeline from "./track-timeline";

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
      gridTemplateRows: "auto auto auto 1fr",
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

interface TrackerTabProps {
  tab: SheetTab;
}

const TrackTab: React.FunctionComponent<TrackerTabProps> = ({ tab }) => {
  const classes = useStyles();
  const theme = useTheme();
  const { user } = UserContainer.useContainer();
  const { trackSheetConfigs } = ConfigContainer.useContainer();
  const { timelineEntity } = TrackGridTabContainer.useContainer();
  const { setPage, setUseQueryEndCursor } = CommonGridContainer.useContainer();
  const downSM = useMediaQuery(theme.breakpoints.down("sm"));
  const [gridConfig, setGridConfig] = useState<CommonGridConfig>();
  const [timelineID, setTimelineID] = useState<string>();
  const [useSMStyle, setUseSMStyle] = useState(false);
  const [showGuidanceDialog, setShowGuidanceDialog] = useState(false);

  useEffect(() => {
    if (trackSheetConfigs) {
      const id = tab.sheetID;
      const config = trackSheetConfigs[id];
      const data = CommonGridConfig.fromJSON(config);

      if (data) {
        setGridConfig(data);
        setTimelineID(data.timelineId);
      }
    }
  }, [tab.sheetID, trackSheetConfigs]);

  useEffect(() => {
    setPage(1);
    setUseQueryEndCursor(null);

    if (user?.userID && localStorage.getItem(user?.userID) !== "false") {
      setShowGuidanceDialog(true);
    }

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    setUseSMStyle(!!timelineEntity && downSM);
  }, [timelineEntity, downSM]);

  return (
    <>
      <div className={clsx(classes.sheetDefault, useSMStyle && classes.SMScreenStyle)}>
        {gridConfig && (
          <div className={clsx(classes.TabContent, "TabContent")}>
            <GridFilter />
            <GridPaginationBar suffix={<TrackerSuffix />} prefix={<TrackerPrefix gridConfig={gridConfig} />} />
            <RowOperationsBar />
            <DataTrackGrid id={tab.sheetID} gridConfig={gridConfig} timelineID={timelineID} />
          </div>
        )}
        {timelineEntity && <TrackTimeline timelineID={timelineID!} />}
        <Dialog open={showGuidanceDialog}>
          <ButtonBase
            className={classes.closeButton}
            onClick={() => {
              localStorage.setItem(user?.userID!, "false");
              setShowGuidanceDialog(false);
            }}
          >
            <Close className={classes.closeIcon} />
          </ButtonBase>
          <Help className={classes.img} />
        </Dialog>
      </div>
    </>
  );
};

export default TrackTab;
