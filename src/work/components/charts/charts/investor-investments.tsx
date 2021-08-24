import { EChartsOption } from "echarts-for-react";
import React from "react";
import { ChartDataModel } from "../../common/chart/common-chart/models/chartData";
import Chart from "../components/chart/chart";

const InvestorInvestmentsChart: React.FunctionComponent = () => {
  const showAxisLabelCount = 5;

  function barOptions(title: string, seriesDimensions: Array<string>): EChartsOption {
    return {
      grid: {
        left: 50,
        right: 50,
      },
      title: {
        text: `{title|${title}}`,
        textStyle: {
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
      },
      legend: { show: false },
      xAxis: {
        type: "category",
        show: true,
        axisLine: { show: true },
        axisTick: { show: true, alignWithLabel: true },
        axisLabel: {
          // interval: 0,
        },
      },
      yAxis: { type: "value", minInterval: 1, axisLine: { show: false }, axisTick: { show: false }, axisLabel: {} },
      series: [{ type: "bar", barMaxWidth: 32, dimensions: seriesDimensions }],
    };
  }

  function chartDataCallback(data: ChartDataModel): EChartsOption | undefined {
    if (data) {
      const newOptions: EChartsOption = barOptions("投资交易总数", ["year", "投资交易总数"]);
      if (data.dataset) {
        newOptions.dataset = { source: data.dataset };
        if (data.dataset.length > showAxisLabelCount) {
          newOptions.dataZoom = [
            {
              type: "slider",
              show: true,
              handleSize: "100%",
              xAxisIndex: [0],
              height: "20px",
              // 取消刷选
              brushSelect: false,
              moveHandleSize: 0,
            },
          ];
        }
        newOptions.tooltip.formatter = (chartParams: { data: Array<string | number>; seriesName: string }): string => {
          return `${chartParams.data[0]}<br/>共 ${chartParams.data[1]} 笔投资`;
        };
      }
      newOptions.yAxis.axisLabel.formatter = (() => (value: number): string => {
        return `${value}`;
      })();

      if (data.subtitle) {
        newOptions["title"].text = `{title|投资交易总数} {subtitle| ${data.subtitle}}`;
      }
      return newOptions;
    }
    return undefined;
  }

  return <Chart chartId="investor.investments" dataHandler={chartDataCallback} />;
};

export default InvestorInvestmentsChart;
