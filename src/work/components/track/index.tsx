import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactElement, useEffect, useMemo, useState } from "react";
import { Tab, TrackerTheme, useTrackerTabsQuery } from "../../generated/graphql";
import { APPBAR_HEIGHT } from "../app/skeleton/components/appbar-next";
import TrackContainer from "./container";
import TabsContent from "./tabs-content";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: `calc(100vh - ${APPBAR_HEIGHT}px)`,
      display: "flex",
      flexDirection: "column",
    },
    displayContent: {
      height: "100%",
      overflowY: "hidden",
    },
    title: {
      padding: "20px 24px 6px",
      fontSize: 20,
    },
    topBox: {
      backgroundColor: "#FFF",
    },
    filterBox: {
      display: "flex",
    },
    inputLabel: {
      display: "flex",
      alignItems: "center",
      color: theme.palette.primary.main,
    },
    selectStyle: {
      minWidth: "100px",
    },
  }),
);

const TrackDisplay: React.FC = () => {
  const classes = useStyles();
  const [tabs, setTabs] = useState<Tab[]>();
  const { trackTheme } = TrackContainer.useContainer();

  const [trackerTabsResult] = useTrackerTabsQuery({
    variables: {
      trackerTheme: trackTheme,
    },
  });

  useEffect(() => {
    const data = trackerTabsResult.data?.trackerTabs;

    if (data) setTabs(data as Tab[]);
  }, [trackerTabsResult]);

  function displayContent(): ReactElement {
    return <>{tabs && tabs.length > 0 && <TabsContent tabs={tabs} />}</>;
  }

  const getTitle = useMemo(() => {
    let title = "";
    switch (trackTheme) {
      case TrackerTheme.TrackerThemeEnterprise:
        title = "项目追踪";
        break;
      case TrackerTheme.TrackerThemeInstitution:
        title = "机构追踪";
        break;
      case TrackerTheme.TrackerThemeVertical:
        title = "行业追踪";
        break;
    }

    return (
      <Typography noWrap className={classes.title}>
        {title}
      </Typography>
    );
  }, [trackTheme]);

  return (
    <>
      <div className={classes.root}>
        <Box>{getTitle}</Box>
        {displayContent()}
      </div>
    </>
  );
};

export default TrackDisplay;
