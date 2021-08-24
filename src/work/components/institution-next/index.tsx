import { Box, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import { Tab, useTrealmRealmTabsQuery } from "../../generated/graphql";
import { APPBAR_HEIGHT } from "../app/skeleton/components/appbar-next";
import TreeChartData from "../common/trealm-tree-chart/tree-chart-data";
import InstitutionContainer from "./container";
import FileOperations from "./file-operations";
import TabsContent from "./tabs-content";
const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: `calc(100vh - ${APPBAR_HEIGHT}px)`,
      display: "flex",
      flexDirection: "column",
      overflow: "hidden",
    },
    titleBox: {
      display: "flex",
      padding: "20px 24px 6px",
      justifyContent: "space-between",
      alignItems: "center",
    },
    title: {
      fontSize: 20,
    },
    buttonIcon: {
      color: theme.palette.primary.main,
      fontSize: 24,
    },
  }),
);

const Institution: React.FunctionComponent<{}> = () => {
  const [tabs, setTabs] = useState<Tab[]>();
  const classes = useStyles();

  const { setGraphVariables, graphVariables } = InstitutionContainer.useContainer();
  const [trealmRealmTabsResult] = useTrealmRealmTabsQuery();

  useEffect(() => {
    const data = trealmRealmTabsResult.data?.trealmRealmTabs;

    if (data) setTabs(data as Tab[]);
  }, [trealmRealmTabsResult]);

  return (
    <div className={classes.root}>
      <Box className={classes.titleBox}>
        <Typography noWrap className={classes.title}>
          机构全貌
        </Typography>
        <FileOperations />
      </Box>
      {tabs && tabs.length > 0 && <TabsContent tabs={tabs} />}
      {graphVariables && <TreeChartData graphVariables={graphVariables} setGraphVariables={setGraphVariables} />}
    </div>
  );
};

export default Institution;
