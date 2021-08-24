import { CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import ConfigContainer from "../../../../../../containers/configContainer";
import { EntityType, FilterInputs, useChartQuery } from "../../../../../../generated/graphql";
import { ChartDataModel } from "../../../../../../models/chart/chartData";
import Chart from "../../../core/chart";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "relative",
    },
    fetching: {
      minHeight: 400,
      display: "grid",
      placeItems: "center",
    },
  }),
);

interface ChartProps {
  entityID: string;
  entityType: EntityType;
  chartID: string;
  filterInputs?: FilterInputs;
}

const DataChart: React.FunctionComponent<ChartProps> = (props) => {
  const classes = useStyles();
  const { chartID, filterInputs, entityID, entityType } = props;
  const [chartData, setChartData] = useState<ChartDataModel>();
  const [fetching, setFetching] = useState(false);
  const { chartConfigs } = ConfigContainer.useContainer();
  const [chartQueryData, executeChartQuery] = useChartQuery({
    variables: {
      chartID: chartID,
      entityID: entityID,
      entityType: entityType,
      filters: filterInputs,
    },
    pause: false,
    requestPolicy: "network-only",
  });

  useEffect(() => {
    if (!fetching) {
      executeChartQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [chartID, entityID, entityType, filterInputs]);

  useEffect(() => {
    setFetching(chartQueryData.fetching);

    if (!chartQueryData.fetching) {
      try {
        setChartData(ChartDataModel.fromJSON(JSON.parse(chartQueryData.data?.chart?.data as string)));
        // eslint-disable-next-line no-empty
      } catch {}
    }
  }, [chartQueryData]);

  return (
    <div className={classes.root}>
      {fetching ? (
        <div className={classes.fetching}>
          <CircularProgress size={30} />
        </div>
      ) : (
        <Chart chartID={chartID} chartData={chartData} chartConfigs={chartConfigs} />
      )}
    </div>
  );
};

export default DataChart;
