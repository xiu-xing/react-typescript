import { EChartsOption } from "echarts-for-react";
import React from "react";
import { HumanReadableString, Unit } from "../../../utils/unit";
import { ChartDataModel } from "../../common/chart/common-chart/models/chartData";
import Chart from "../components/chart/chart";

interface ChartActiveItem {
  data: Array<string | number>;
}

const VerticalDealValuationTrend: React.FunctionComponent = () => {
  function chartDataCallBack(data: ChartDataModel): EChartsOption | undefined {
    if (data) {
      const newOption: EChartsOption = {
        title: {
          text: `{title|交易估值趋势}`,
          textStyle: {
            rich: {
              title: {
                color: "#737373",
                fontWight: 400,
                fontSize: 16,
                fontFamily: "Noto Sans SC",
              },
              subtitle: {
                color: "#333",
                fontSize: 16,
                fontWight: 500,
                fontFamily: "Noto Sans SC",
              },
            },
          },
        },
        toolbox: {
          show: true,
          right: "8%",
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
        legend: { show: true },
        xAxis: {
          type: "category",
          show: true,
          axisLine: { show: false },
          axisTick: {
            show: true,
            alignWithLabel: true,
            lineStyle: { color: "rgba(65, 97, 128, 0.15)" },
          },
          axisLabel: {},
        },
        yAxis: {
          type: "value",
          minInterval: 1,
          axisLine: { show: false },
          axisTick: { show: false },
          axisLabel: {},
        },
        series: [
          {
            type: "line",
            symbolSize: 2,
            smooth: false,
            connectNulls: true,
            name: "最低",
          },
          {
            type: "line",
            symbolSize: 2,
            smooth: false,
            connectNulls: true,
            name: "最高",
            color: "#d87c7c",
          },
          {
            type: "line",
            symbolSize: 2,
            smooth: false,
            connectNulls: true,
            name: "中位",
          },
        ],
      };

      newOption.dataset = {
        source: data.dataset,
      };
      if (data.dataset) {

        //   处理 Y 轴单位
        newOption.yAxis.axisLabel.formatter = ((unit) => (value: number): string => {
          if (unit === "万") {
            return HumanReadableString(value, Unit.TenThousand);
          }
          return `${value} ${unit}`;
        })(data.unit);

        if (data.dataset.length) {
          newOption.dataZoom = [
            {
              type: "slider",
              show: true,
              handleSize: "100%",
              xAxisIndex: [0],
              bottom: 15,
              height: "20px",
              // 取消刷选
              brushSelect: false,
              moveHandleSize: 0,
            },
          ];

          newOption.tooltip = {
            ...newOption.tooltip,
            trigger: "axis",
            borderWidth: 1,
            padding: 10,
          };
        }

        newOption.tooltip.formatter = ((unit) => (chartParams: Array<ChartActiveItem>): string => {
          if (chartParams) {
            const activeData = chartParams[0]?.data;
            if (activeData && activeData.length >= 4) {
              const date = activeData[0],
                lowest = activeData[1],
                highest = activeData[2],
                middle = activeData[3];
              return `${date}<br />最低：${HumanReadableString(
                lowest as number,
                unit as Unit,
              )}<br/>最高：${HumanReadableString(highest as number, unit as Unit)}<br />中位：${HumanReadableString(
                middle as number,
                unit as Unit,
              )}`;
            }
          }
          return "";
        })(data.unit === "万" ? Unit.TenThousand : data.unit);
      }

      return newOption;
    }
    return undefined;
  }

  return (
    <Chart chartId="vertical.deal_valuation_trend" dataHandler={chartDataCallBack} filters={["dealType", "region"]} />
  );
};

export default VerticalDealValuationTrend;
