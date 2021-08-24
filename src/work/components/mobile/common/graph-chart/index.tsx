import { Box, CircularProgress, createStyles, makeStyles } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import { EntityType, NextPlatform, useGraphQuery } from "../../../../generated/graphql";
import DynamicTreeNodeChart from "./tree-node-chart/dynamic";

const useStyles = makeStyles(() =>
  createStyles({
    loading: {
      width: "100%",
      padding: 24,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
    onData: {
      width: "100%",
      minHeight: 100,
      fontSize: 16,
      color: "#666",
      display: "grid",
      placeItems: "center",
    },
  }),
);

interface MobileGraphProps {
  graphId?: string;
  entityId: string;
  entityType: EntityType;
}

const MobileGraph: React.FunctionComponent<MobileGraphProps> = (props) => {
  const classes = useStyles();
  const [chartData, setChartData] = useState<string>();

  const [graphQueryResult] = useGraphQuery({
    variables: {
      entityID: props.entityId,
      entityType: props.entityType,
      graphID: props.graphId ?? "",
      platform: NextPlatform.PlatformMobile,
    },
    requestPolicy: "network-only",
  });

  useEffect(() => {
    if (!graphQueryResult || graphQueryResult.fetching) return;
    setChartData(graphQueryResult?.data?.graph?.data ?? undefined);
  }, [graphQueryResult]);

  const component = () => {
    if (!graphQueryResult.fetching && graphQueryResult.error) {
      return <div className={classes.onData}>暂无数据</div>;
    }
    if (graphQueryResult.fetching || chartData == undefined) {
      return (
        <Box className={classes.loading}>
          <CircularProgress size={32} />
        </Box>
      );
    }
    return <DynamicTreeNodeChart chartData={chartData} />;
  };

  return <>{component()}</>;
};

export default MobileGraph;
