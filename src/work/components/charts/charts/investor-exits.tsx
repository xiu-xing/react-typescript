import { EChartsOption } from "echarts-for-react";
import React from "react";
import { ChartDataModel } from "../../common/chart/common-chart/models/chartData";
import Chart from "../components/chart/chart";

const InvestorExitsChart: React.FunctionComponent = () => {
  const showAxisLabelCount = 10;

  function barOptions(title: string, seriesDimensions: Array<string>): EChartsOption {
    return {
      grid: {
        left: 50,
        right: 50,
      },
      title: {
        text: `{title|${title}}`,
        textStyle: {
          color: "#737373",
          fontWight: 400,
          fontSize: 16,
          rich: {
            title: { color: "#737373", fontWight: 400, fontSize: 16, fontFamily: "Noto Sans SC" },
            subtitle: { color: "#333", fontSize: 16, fontWight: 500, fontFamily: "Noto Sans SC" },
          },
        },
      },
      toolbox: {
        show: true,
        right: 40,
        feature: {
          saveAsImage: {
            show: true,
          },
        },
      },
      tooltip: {
        backgroundColor: "#ffffff",
        textStyle: {
          color: "#666666",
          fontFamily: "Noto Sans SC",
          fontSize: 12,
        },
        trigger: "axis",
        axisPointer: {
          type: "none",
        },
      },
      legend: { show: false },
      xAxis: {
        type: "category",
        show: true,
        axisLine: { show: false },
        axisTick: { show: true, alignWithLabel: true },
      },
      yAxis: { type: "value", minInterval: 1, axisLine: { show: false }, axisTick: { show: false }, axisLabel: {} },
      series: [{ type: "bar", barMaxWidth: 32, dimensions: seriesDimensions }],
    };
  }

  function chartDataCallback(data: ChartDataModel): EChartsOption | undefined {
    if (data) {
      const newChartOption: EChartsOption = barOptions("总退出事件", ["year", "总退出事件"]);
      newChartOption.dataset = {
        source: data.dataset,
      };
      if (data.dataset) {
        newChartOption.dataset = { source: data.dataset };
        if (data.dataset.length > showAxisLabelCount) {
          newChartOption.dataZoom = [
            {
              type: "slider",
              show: true,
              handleSize: "100%",
              xAxisIndex: [0],
              left: 40,
              height: "20px",
              // 取消刷选
              brushSelect: false,
              moveHandleSize: 0,
            },
          ];
        }
        newChartOption.yAxis.axisLabel.formatter = (() => (value: number): string => {
          return `${value}`;
        })();

        newChartOption.tooltip.formatter = (
          chartParams: Array<{
            data: Array<string | number>;
            seriesName: string;
          }>,
        ): string => {
          const activeItem = chartParams[0];
          return `${activeItem.data[0]}<br/>共 ${activeItem.data[1]} 起事件`;
        };
      }
      if (data.subtitle) {
        newChartOption["title"].text = `{title|总退出事件} {subtitle| ${data.subtitle}}`;
      }
      return newChartOption;
    }
    return undefined;
  }

  return <Chart chartId="investor.exits" type="pie" dataHandler={chartDataCallback} />;
};

export default InvestorExitsChart;
