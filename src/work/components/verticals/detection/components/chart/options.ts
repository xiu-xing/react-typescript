import { EChartsOption } from "echarts-for-react";
import { xBarOption } from "../../../../common/chart/basic-chart/options/barOptions";
import {
  commonAxis,
  commonBarSeries,
  commonLegend,
  commonLineSeries,
  commonLineTooltip,
  commonTooltip,
} from "../../../../common/chart/basic-chart/options/common";
import { mutiAxisOption } from "../../../../common/chart/basic-chart/options/mutiAxisOptions";
import { radarOption } from "../../../../common/chart/basic-chart/options/radarOptions";

export function getRadarOption(): EChartsOption {
  const option = radarOption();
  option.radar.indicator = [
    { name: "最受投资机构青睐", max: 100 },
    { name: "交易事件连续增长", max: 100 },
    { name: "平均融资间隔最短", max: 100 },
    { name: "企业数量连续增长", max: 100 },
    { name: "交易事件远超预期", max: 100 },
  ];
  //TODO https://github.com/apache/echarts/issues/14449
  option.name = {
    width: 100,
    overflow: "break",
  };
  option.series = [
    {
      type: "radar",
      symbol: "none",
      data: [
        {
          value: [0, 0, 0, 0, 0],
        },
      ],
      dimension: ["最受投资机构青睐", "交易事件连续增长", "平均融资间隔最短", "企业数量连续增长", "交易事件远超预期"],
      color: "#4f709b",
      lineStyle: {
        width: 2,
      },
      areaStyle: {
        color: "#7192ba",
      },
    },
  ];
  return option;
}

export function getTwoBarOption(): EChartsOption {
  const option = xBarOption();
  option.grid = {
    left: 30,
    right: 10,
    top: 30,
    bottom: 60,
  };
  option.tooltip.formatter = (chartParam: EChartsOption): string => {
    try {
      if (Array.isArray(chartParam)) {
        const activeItem = chartParam[0];

        return `${activeItem.data[0]}<br/>预期值：${activeItem.data[1] || 0}<br/>实际值：${activeItem.data[2] || 0}`;
      }
      return `${chartParam.data[0]}<br/>预期值：${chartParam.data[1] || 0}<br/>实际值：${chartParam.data[2] || 0}`;
    } catch (e) {
      return "";
    }
  };
  option.series = [
    {
      ...commonBarSeries,
      name: "Top 投资机构投资数量预期值",
      color: "#7192ba",
    },
    {
      ...commonBarSeries,
      name: "Top 投资机构投资数量实际值",
      color: "#4f709b",
    },
  ];
  return option;
}

export function getTwoLineOption(): EChartsOption {
  return {
    grid: {
      left: 30,
      right: 10,
      top: 30,
      bottom: 60,
    },
    legend: {
      ...commonLegend,
      show: true,
      itemWidth: 12,
      itemHeight: 12,
      data: [
        {
          name: "交易数量预期值",
          icon: "path://M5,4 C7.14219539,4 8.89107888,5.68396847 8.99510469,7.80035966 L9,8 C9,9.1045695 9.8954305,10 11,10 C12.0543618,10 12.9181651,9.18412221 12.9945143,8.14926234 L13,8 L15,8 C15,10.209139 13.209139,12 11,12 C8.790861,12 7,10.209139 7,8 C7,6.8954305 6.1045695,6 5,6 C3.9456382,6 3.08183488,6.81587779 3.00548574,7.85073766 L3,8 L1,8 C1,5.790861 2.790861,4 5,4 Z",
        },
        {
          name: "交易数量实际值",
          icon: "path://M5,4 C7.14219539,4 8.89107888,5.68396847 8.99510469,7.80035966 L9,8 C9,9.1045695 9.8954305,10 11,10 C12.0543618,10 12.9181651,9.18412221 12.9945143,8.14926234 L13,8 L15,8 C15,10.209139 13.209139,12 11,12 C8.790861,12 7,10.209139 7,8 C7,6.8954305 6.1045695,6 5,6 C3.9456382,6 3.08183488,6.81587779 3.00548574,7.85073766 L3,8 L1,8 C1,5.790861 2.790861,4 5,4 Z",
        },
      ],
    },
    tooltip: {
      ...commonLineTooltip,
      trigger: "axis",
      formatter: (chartParam: EChartsOption): string => {
        try {
          if (Array.isArray(chartParam)) {
            const activeItem = chartParam[0];

            return `${activeItem.data[0]}<br/>预期值：${activeItem.data[1] || 0}<br/>实际值：${
              activeItem.data[2] || 0
            }`;
          }
          return `${chartParam.data[0]}<br/>预期值：${chartParam.data[1] || 0}<br/>实际值：${chartParam.data[2] || 0}`;
        } catch (e) {
          return "";
        }
      },
    },
    xAxis: {
      ...commonAxis,
      type: "category",
    },
    yAxis: {
      ...commonAxis,
      type: "value",
      minInterval: 0.1,
      splitLine: {
        show: true,
      },
    },
    series: [
      {
        ...commonLineSeries,
        name: "交易数量预期值",
        color: "#7192ba",
      },
      {
        ...commonLineSeries,
        name: "交易数量实际值",
        color: "#4f709b",
      },
    ],
  };
}

export function getLineOption(): EChartsOption {
  const option = mutiAxisOption();
  option.grid = {
    top: 60,
    bottom: 60,
    left: 66,
    right: 66,
  };
  option.legend = {
    ...commonLegend,
    itemWidth: 12,
    itemHeight: 12,
    data: [
      {
        icon: "path://M5,4 C7.14219539,4 8.89107888,5.68396847 8.99510469,7.80035966 L9,8 C9,9.1045695 9.8954305,10 11,10 C12.0543618,10 12.9181651,9.18412221 12.9945143,8.14926234 L13,8 L15,8 C15,10.209139 13.209139,12 11,12 C8.790861,12 7,10.209139 7,8 C7,6.8954305 6.1045695,6 5,6 C3.9456382,6 3.08183488,6.81587779 3.00548574,7.85073766 L3,8 L1,8 C1,5.790861 2.790861,4 5,4 Z",
      },
      {
        icon: "path://M4,7.125 C4.27614237,7.125 4.5,7.34885763 4.5,7.625 L4.5,15 L1,15 L1,7.625 C1,7.34885763 1.22385763,7.125 1.5,7.125 L4,7.125 Z M9.25,1 C9.52614237,1 9.75,1.22385763 9.75,1.5 L9.75,15 L6.25,15 L6.25,1.5 C6.25,1.22385763 6.47385763,1 6.75,1 L9.25,1 Z M14.5,7.125 C14.7761424,7.125 15,7.34885763 15,7.625 L15,15 L11.5,15 L11.5,7.625 C11.5,7.34885763 11.7238576,7.125 12,7.125 L14.5,7.125 Z",
      },
    ],
  };
  option.yAxis[0].name = "增长率";
  option.yAxis[0].axisLabel = {
    formatter: (value: number): string => {
      return `${Math.ceil(value * 100)}%`;
    },
  };
  option.yAxis[0].nameTextStyle = {
    align: "center",
    fontWeight: 500,
    padding: [0, 50, 0, 0],
  };
  option.yAxis[1].name = "增长值";
  option.yAxis[1].minInterval = 1;
  option.yAxis[1].nameTextStyle = {
    align: "center",
    fontWeight: 500,
    padding: [0, 0, 0, 50],
  };
  return option;
}

export function getScatterOption(): EChartsOption {
  return {
    grid: {
      left: 70,
      right: 10,
      top: 30,
      bottom: 30,
    },
    tooltip: {
      ...commonTooltip,
      show: true,
      formatter: (chartParams: EChartsOption): string => {
        const data = chartParams.data;
        return `${data[3]}<br/>企业数：${data[1]}<br/>融资间隔：${data[0]}个月`;
      },
    },
    xAxis: {
      axisLabel: {
        formatter: "{value}月",
      },
      splitLine: {
        show: true,
      },
    },
    yAxis: {
      splitLine: {
        show: true,
      },
    },
    series: [
      {
        symbolSize: 8,
        type: "scatter",
        selectedMode: false,
        color: "rgba(115,141,175,0.4)",
        select: {
          itemStyle: {
            color: "#4f709b",
          },
        },
        emphasis: {
          scale: false,
          itemStyle: {
            color: "#4f709b",
          },
        },
      },
    ],
  };
}
