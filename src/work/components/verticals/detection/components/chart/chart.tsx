import React from "react";
import ChartDisplay, { ChartDisplayProps } from "./chart-display";
import ChartContainer, { ChartInitialState } from "./chartContainer";

interface ChartProps extends ChartInitialState, ChartDisplayProps {}

const Chart: React.FunctionComponent<ChartProps> = (props) => {
  const { verticalID, metricsID, year, quarter, dataHandle, ...restProps } = props;

  return (
    <ChartContainer.Provider
      initialState={{
        verticalID,
        metricsID,
        year,
        quarter,
        dataHandle,
      }}
    >
      <ChartDisplay {...restProps} />
    </ChartContainer.Provider>
  );
};

export default Chart;
