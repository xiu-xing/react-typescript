import { Box, CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import { FilterInputs, useGraphQuery } from "../../../../../generated/graphql";
import { useProfileEntity } from "../../../../profile/atoms";
import DynamicG6TreeNodeChart from "../../../chart-next/graph-chart/tree-node-chart/dynamic";

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

interface DataGraphProps {
  graphId: string;
  filters: FilterInputs;
}

const DataGraph: React.FunctionComponent<DataGraphProps> = (props) => {
  const classes = useStyles();
  const { graphId, filters } = props;

  const [profileEntity] = useProfileEntity();
  const [chartData, setChartData] = useState<string>();

  const [graphQueryResult] = useGraphQuery({
    variables: {
      entityID: profileEntity.id,
      entityType: profileEntity.type,
      graphID: graphId ?? "",
      filters: filters,
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
    return <DynamicG6TreeNodeChart chartData={chartData} />;
  };

  return <>{component()}</>;
};

export default DataGraph;
