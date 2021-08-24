import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import { Tab, useTrealmTrackerTabsQuery } from "../../generated/graphql";
import { APPBAR_HEIGHT } from "../app/skeleton/components/appbar-next";
import TreeChartData from "../common/trealm-tree-chart/tree-chart-data";
import InstitutionTrackContainer from "./container";
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

const InstitutionTracking: React.FC = () => {
  const classes = useStyles();
  const [tabs, setTabs] = useState<Tab[]>();
  const { showTreeChart, setGraphVariables, graphVariables, setShowTreeChart } =
    InstitutionTrackContainer.useContainer();
  const [trealmTrackerTabsResult] = useTrealmTrackerTabsQuery();

  useEffect(() => {
    const data = trealmTrackerTabsResult.data?.trealmTrackerTabs;

    if (data) setTabs(data as Tab[]);
  }, [trealmTrackerTabsResult]);

  return (
    <div className={classes.root}>
      <Box>
        <Typography noWrap className={classes.title}>
          投后追踪
        </Typography>
      </Box>
      {tabs && tabs.length > 0 && <TabsContent tabs={tabs} />}
      {showTreeChart && graphVariables && (
        <TreeChartData graphVariables={graphVariables} setGraphVariables={setGraphVariables} />
      )}
    </div>
  );
};

export default InstitutionTracking;
