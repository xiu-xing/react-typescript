import { EChartsOption } from "echarts-for-react";
import React from "react";
import DetectionContainer, { MetricsIDs } from "../../../detectionContainer";
import Chart from "../../chart/chart";
import { getTwoLineOption } from "../../chart/options";
import SectionContainer from "../sectionContainer";

const DealCountChart: React.FunctionComponent<{}> = () => {
  const { year, quarter } = DetectionContainer.useContainer();
  const { selectedVertical } = SectionContainer.useContainer();
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
      verticalID={selectedVertical?.verticalID || undefined}
    />
  );
};

export default DealCountChart;
