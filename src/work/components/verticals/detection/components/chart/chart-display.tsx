import React from "react";
import BasicChart, { BasicChartProps } from "../../../../common/chart/basic-chart/basic-chart";
import ChartContainer from "./chartContainer";

export type ChartDisplayProps = Omit<BasicChartProps, "option">;

const ChartDisplay: React.FunctionComponent<ChartDisplayProps> = (props) => {
  const { chartOption } = ChartContainer.useContainer();

  return <BasicChart {...props} option={chartOption} theme="vertical" />;
};

export default ChartDisplay;
