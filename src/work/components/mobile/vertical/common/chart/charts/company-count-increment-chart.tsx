import { EChartsOption } from "echarts-for-react";
import React from "react";
import { ChartProps } from "..";
import { commonBarSeries, commonLineSeries } from "../../../../../common/chart/basic-chart/options/common";
import Chart from "../../../../../verticals/detection/components/chart/chart";
import { getLineOption } from "../../../../../verticals/detection/components/chart/options";
import { MetricsIDs } from "../../../../../verticals/detection/detectionContainer";

const CompanyCountIncrementChart: React.FC<ChartProps> = (props) => {
  const { year, quarter, verticalId, mini } = props;

  function chartDataHandler(data: Array<Array<string | number>>): EChartsOption {
    if (!data) {
      return {};
    }
    const option = getLineOption();

    if (data.length) {
      try {
        option.dataset = {
          source: data,
        };
        option.legend.data[0].name = "新增企业数量同比增长率";
        option.legend.data[1].name = "新增企业数量";
        option.tooltip.formatter = (chartParam: EChartsOption): string => {
          try {
            if (Array.isArray(chartParam)) {
              const activeItem = chartParam[0];

              return `${activeItem.data[0]}<br/>同比增长率：${((activeItem.data[1] || 0) * 100).toFixed(
                2,
              )}%<br/>新增企业数量：${activeItem.data[2] || 0}`;
            }
            return `${chartParam.data[0]}<br/>同比增长率：${((chartParam.data[1] || 0) * 100).toFixed(
              2,
            )}%<br/>新增企业数量：${chartParam.data[2] || 0}`;
          } catch (e) {
            return "";
          }
        };
        const serie1Values: number[] = [],
          serie2Values: number[] = [];
        data.forEach((element) => {
          if (Array.isArray(element)) {
            if (typeof element[1] === "number") {
              serie1Values.push(element[1]);
            }
            if (typeof element[2] === "number") {
              serie2Values.push(element[2]);
            }
          }
        });

        const maxSerie1Value = Number((Math.ceil(Math.max(...serie1Values) / 0.05) * 0.05).toFixed(4));
        const minSerie1Value = Number((Math.ceil(Math.min(...serie1Values) / 0.05) * 0.05).toFixed(4));
        const minValue1 = minSerie1Value < 0 ? minSerie1Value : 0;
        const amplitude1 = maxSerie1Value - minValue1;
        const maxValue = Math.ceil(Math.max(...serie2Values) / 5) * 5;
        const maxSerie2Value = maxValue < 5 ? 5 : maxValue;
        option.yAxis[0].max = maxSerie1Value;
        option.yAxis[0].min = minValue1;
        option.yAxis[0].interval = Number((amplitude1 / 5).toFixed(4));
        option.yAxis[1].max = maxSerie2Value;
        option.yAxis[1].interval = maxSerie2Value / 5;

        option.series = [
          {
            ...commonLineSeries,
            name: "新增企业数量同比增长率",
            color: "#7192ba",
          },
          {
            ...commonBarSeries,
            name: "新增企业数量",
            yAxisIndex: 1,
            color: "#4f709b",
          },
        ];

        if (mini) {
          option.grid = {
            top: "4%",
            right: "2%",
            bottom: "16%",
            left: 40,
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
      metricsID={MetricsIDs.CompanyCountIncrement}
      dataHandle={chartDataHandler}
      quarter={quarter}
      year={year}
      verticalID={verticalId}
      height="100%"
      showSkeleton={false}
    />
  );
};

export default CompanyCountIncrementChart;
