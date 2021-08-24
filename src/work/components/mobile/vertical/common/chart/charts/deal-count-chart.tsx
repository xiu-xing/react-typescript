import { EChartsOption } from "echarts-for-react";
import React from "react";
import { ChartProps } from "..";
import Chart from "../../../../../verticals/detection/components/chart/chart";
import { getTwoLineOption } from "../../../../../verticals/detection/components/chart/options";
import { MetricsIDs } from "../../../../../verticals/detection/detectionContainer";

const DealCountChart: React.FC<ChartProps> = (props) => {
  const { year, quarter, verticalId, mini } = props;
  function chartDataHandler(data: Array<Array<string | number>>): EChartsOption {
    if (!data) {
      return {};
    }
    const option = getTwoLineOption();

    if (data.length) {
      try {
        option.dataset = {
          source: data,
        };

        if (mini) {
          option.grid = {
            top: "4%",
            right: "1%",
            bottom: "16%",
            left: 30,
          };

          option.tooltip = {
            show: false,
          };

          option.legend = {
            show: false,
          };
        }
      } catch (error) {
        //
      }
    }

    return option;
  }

  return (
    <Chart
      metricsID={MetricsIDs.DealCount}
      dataHandle={chartDataHandler}
      quarter={quarter}
      year={year}
      verticalID={verticalId}
      height="100%"
      showSkeleton={false}
    />
  );
};

export default DealCountChart;
