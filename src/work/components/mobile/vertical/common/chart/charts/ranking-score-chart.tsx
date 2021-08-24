import { EChartsOption } from "echarts-for-react";
import React from "react";
import { ChartProps } from "..";
import Chart from "../../../../../verticals/detection/components/chart/chart";
import { getRadarOption } from "../../../../../verticals/detection/components/chart/options";
import { MetricsIDs } from "../../../../../verticals/detection/detectionContainer";

const RankingScoreChart: React.FC<ChartProps> = (props) => {
  const { year, quarter, verticalId, mini } = props;
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

        if (mini) {
          option.radar.radius = "65%";

          option.radar.nameGap = 4;

          option.tooltip = {
            show: false,
          };
        }

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
      verticalID={verticalId}
      type="radar"
      height="100%"
      showSkeleton={false}
    />
  );
};

export default RankingScoreChart;
