import { EChartsOption } from "echarts-for-react";
import React from "react";
import DetectionContainer, { MetricsIDs } from "../../../detectionContainer";
import Chart from "../../chart/chart";
import { getRadarOption } from "../../chart/options";
import SectionContainer from "../sectionContainer";

const RankingScoreChart: React.FunctionComponent<{}> = () => {
  const { year, quarter } = DetectionContainer.useContainer();
  const { selectedVertical } = SectionContainer.useContainer();
  function chartDataHandler(data: Array<Array<string | number>>): EChartsOption {
    if (!data) {
      return {};
    }
    const option = getRadarOption();

    if (data.length) {
      try {
        option.series[0].data[0] = {
          value: data.map((v) => {
            if (v) {
              return v[1] || 0;
            }
            return 0;
          }),
          name: "综合排名",
        };
        option.tooltip.formatter = (chartParams: EChartsOption): string => {
          try {
            return `最受投资机构青睐：${(chartParams.value[0] || 0).toFixed(2)}<br/>交易事件连续增长：${(
              chartParams.value[1] || 0
            ).toFixed(2)}<br/>平均融资间隔最短：${(chartParams.value[2] || 0).toFixed(2)}<br/>企业数量连续增长：${(
              chartParams.value[3] || 0
            ).toFixed(2)}<br/>交易事件远超预期：${(chartParams.value[4] || 0).toFixed(2)}<br/>`;
          } catch (error) {
            return "";
          }
        };
      } catch (error) {
        //
      }
    }

    return option;
  }

  return (
    <Chart
      metricsID={MetricsIDs.RankingScore}
      dataHandle={chartDataHandler}
      quarter={quarter}
      year={year}
      verticalID={selectedVertical?.verticalID || undefined}
      type="radar"
    />
  );
};

export default RankingScoreChart;
