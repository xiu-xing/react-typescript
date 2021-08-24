import { EChartsOption } from "echarts";

export enum TableOptionType {
  barThumbnail = "BAR_THUMBNAIL",
  lineThumbnail = "LINE_THUMBNAIL",
  stackBarThumbnail = "STACK_BAR_THUMBNAIL",
}

export function getChartOption(type: unknown): EChartsOption {
  switch (type) {
    case TableOptionType.stackBarThumbnail:
      return {
        xAxis: {
          type: "value",
          show: false,
        },
        yAxis: {
          type: "category",
          show: false,
        },
        series: [
          {
            type: "bar",
            stack: "s",
          },
          {
            type: "bar",
            stack: "s",
          },
        ],
        // dataset: {
        //   source: [
        //     ["data", 150],
        //     ["data1", 100],
        //   ],
        // },
      };
    case TableOptionType.lineThumbnail:
      return {
        grid: {
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
        },
        xAxis: {
          type: "category",
          show: false,
        },
        yAxis: {
          type: "value",
          show: false,
        },
        series: {
          type: "line",
          smooth: true,
          symbol: "none",
          // TODO:
          // color: "red",
        },
      };
    case TableOptionType.barThumbnail:
      return {
        xAxis: {
          type: "category",
          show: false,
        },
        yAxis: {
          type: "value",
          show: false,
        },
        series: {
          type: "bar",
        },
      };
  }

  return {};
}
