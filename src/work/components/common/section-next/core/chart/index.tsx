import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { useMemo } from "react";
import { ChartModel } from "../../../../../models/chart/chart";
import { ChartDataModel } from "../../../../../models/chart/chartData";
import CommonChart from "../../../chart-next/common-chart";
import ACPlaceholder from "../../components/ac-placeholder";

const useStyles = makeStyles(() =>
  createStyles({
    box: {
      height: 420,
      minWidth: 200,
    },
    blur: {
      filter: "blur(2px)",
      userSelect: "none",
      opacity: 0.5,
    },
    root: {
      position: "relative",
    },
  }),
);

interface ChartProps {
  chartID: string;
  lock?: boolean;
  chartData?: ChartDataModel;
  chartConfigs?: {
    [key: string]: ChartModel;
  };
}

const Chart: React.FunctionComponent<ChartProps> = (props) => {
  const classes = useStyles();
  const { chartID, chartData, lock = false, chartConfigs } = props;
  const chartDataMemo = useMemo(() => {
    return chartData ?? new ChartDataModel();
  }, [chartData]);

  const chartConfig = useMemo(() => {
    if (chartID && chartConfigs) {
      const newChartConfig: ChartModel = ChartModel.fromJSON(chartConfigs[chartID]);
      return newChartConfig;
    }
    return null;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [chartConfigs, chartID, chartData]);

  return (
    <div className={classes.root}>
      <Box className={clsx(classes.box, { [classes.blur]: lock })}>
        {chartConfig && (
          <CommonChart
            id={chartID}
            chartData={chartDataMemo}
            lock={lock}
            min={chartDataMemo.min}
            max={chartDataMemo.max}
            chartConfig={chartConfig}
          />
        )}
      </Box>
      {lock && <ACPlaceholder />}
    </div>
  );
};

export default Chart;
