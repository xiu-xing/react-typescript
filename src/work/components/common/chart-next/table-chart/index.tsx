import { createStyles, makeStyles } from "@material-ui/core/styles";
import { BarSeriesOption } from "echarts";
import React from "react";
import { ChartDataModel } from "../../../../models/chart/chartData";
import Chart from "../chart";
import { getChartOption, TableOptionType } from "./options";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: "50px",
      width: "50px",
    },
  }),
);

// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface TableChartProps {
  type: TableOptionType;
  chartData: ChartDataModel;
}

const TableChart: React.FunctionComponent<TableChartProps> = (props) => {
  const classes = useStyles();
  const { type, chartData } = props;
  const options = getChartOption(type);

  if (chartData && chartData.dataset.length > 0) {
    options.dataset = {
      source: chartData.dataset,
    };
    if (type == TableOptionType.stackBarThumbnail) {
      const series: BarSeriesOption[] = [];
      for (let i = 1; i < chartData.dataset[0].length; i++) series.push({ type: "bar", stack: "stack" });
      options.series = series;
    }
  }

  return (
    <div className={classes.root}>
      <Chart option={options} theme="rime" />
    </div>
  );
};

export default TableChart;
