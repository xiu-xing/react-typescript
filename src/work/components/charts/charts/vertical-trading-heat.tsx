import { EChartsOption } from "echarts-for-react";
import React from "react";
import { ChartDataModel } from "../../common/chart/common-chart/models/chartData";
import Chart from "../components/chart/chart";

interface ChartActiveItem {
  data: Array<string | number>;
}

const VerticalTradingHeat: React.FunctionComponent = () => {
  function chartDataCallBack(data: ChartDataModel): EChartsOption | undefined {
    if (data) {
      const newOption: EChartsOption = {
        grid: {
          left: 50,
          right: 50,
        },
        title: {
          text: `{title|交易热度}`,
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
          trigger: "axis",
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
        series: [{ type: "bar", barMaxWidth: 32, dimensions: ["交易热度"] }],
      };

      newOption.dataset = {
        source: data.dataset,
      };
      if (data.dataset) {

        if (data.dataset.length) {
          newOption.dataZoom = [
            {
              type: "slider",
              show: true,
              handleSize: "100%",
              xAxisIndex: [0],
              // left: "9%",
              height: "20px",
              // 取消刷选
              brushSelect: false,
              moveHandleSize: 0,
            },
          ];

          newOption.tooltip.formatter = ((unit) => (chartParams: Array<ChartActiveItem>): string => {
            const activeItem = chartParams[0]?.data;
            if (activeItem && activeItem.length >= 2) {
              return `${activeItem[0]}年：${activeItem[1]}${unit}`;
            }
            return "";
          })(data.unit);
        }
      }
      return newOption;
    }
    return undefined;
  }

  return <Chart chartId="vertical.deal_count_trend" dataHandler={chartDataCallBack} filters={["dealType", "region"]} />;
};

export default VerticalTradingHeat;
