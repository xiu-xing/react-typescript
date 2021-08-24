import { XAXisComponentOption as XAXisOption, YAXisComponentOption as YAXisOption } from "echarts";
import { AxisesModel } from "../../../../../models/chart/chart";
import { ChartDataModel } from "../../../../../models/chart/chartData";
import { HumanReadableString, HumanReadableUnitToUnit } from "../../../../../utils/unit";
import { OptionType } from "./optionType";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function axisFormatter(type: string, unit: string): any {
  if (type == "currency") {
    return (value: number): string => {
      if (unit === "万") {
        return HumanReadableString(value, HumanReadableUnitToUnit(unit));
      }
      return `${value} ${unit}`;
    };
  }
  if (type == "percentage") {
    return (value: number): string => {
      return `${value} %`;
    };
  }
  // 只有在 Axis type 为 time 时才会生效
  if (type === "year") {
    return { year: "{yyyy}", month: "     {MMM}", day: "{d}日" };
  }

  return (value: number): string => value.toString();
}

function getXAxis(type: OptionType, axis: AxisesModel, unit: string, withoutData: boolean, mini: boolean): XAXisOption {
  switch (type) {
    case OptionType.line:
    case OptionType.bar: {
      if (withoutData) {
        return {
          type: "category",
          show: false,
          axisLabel: {
            show: false,
            interval: mini ? "auto" : "auto",
          },
          axisTick: {
            show: false,
          },
        };
      }
      return {
        type: axis.type ?? "category",
        //坐标轴轴线
        axisLine: {
          show: false,
        },
        // 刻度
        axisTick: {
          show: false,
          // 度线和标签对齐
          alignWithLabel: true,
        },
        // 刻度值，包含刻度的名称设置
        splitNumber: 6,
        axisLabel: {
          interval: mini ? "auto" : "auto",
          formatter: axisFormatter(axis.formatter, unit),
        },
        name: axis.name,
        nameLocation: "middle",
        nameTextStyle: {
          fontSize: 12,
          padding: [12, 0, 0, 0],
        },
        // boundaryGap: ["20%", "20%"],
      };
    }
    case OptionType.parallelBar: {
      if (withoutData) {
        return {
          type: "value",
          show: false,
        };
      }
      return {
        type: "value",
        show: false,
        // 自动计算的坐标轴最小间隔大小
        minInterval: 1,
        axisLine: { show: false },
        axisTick: { show: false },
        axisLabel: {},
      };
    }
    case OptionType.scatter: {
      if (withoutData) {
        return {
          axisLabel: {
            show: false,
          },
          axisTick: {
            show: false,
          },
        };
      }
    }
  }

  return {};
}

function getYAxis(
  type: OptionType,
  axis: AxisesModel,
  unit: string,
  withoutData: boolean,
  chartData: ChartDataModel,
  mini: boolean,
): YAXisOption {
  switch (type) {
    case OptionType.line:
    case OptionType.bar: {
      if (withoutData) {
        return {
          type: "value",
          splitNumber: 4,
          axisLabel: {
            show: false,
          },
        };
      }
      if (chartData.min && chartData.max) {
        return {
          splitNumber: 4,
          type: "value",
          // 轴线
          axisLine: {
            show: false,
          },
          splitLine: {
            show: !mini,
          },
          min: Math.ceil(chartData.min) - 10,
          max: Math.ceil(chartData.max) + 10,
          minInterval: 1,
          // 刻度
          axisTick: {
            show: false,
            alignWithLabel: true,
          },
          axisLabel: {
            interval: 0,
            formatter: axisFormatter(axis.formatter, unit),
            color: mini ? "transparent" : "#333",
          },
          name: axis.name.split("").join("\n"),
          nameLocation: "middle",
          nameRotate: 0,
        };
      }
      return {
        splitNumber: 4,
        type: "value",
        // 轴线
        axisLine: {
          show: false,
        },
        splitLine: {
          show: !mini,
        },
        minInterval: 1,
        // 刻度
        axisTick: {
          show: false,
          alignWithLabel: true,
        },
        name: axis.name.split("").join("\n"),
        nameLocation: "middle",
        nameRotate: 0,
        nameGap: 60,
        axisLabel: {
          interval: 0,
          formatter: axisFormatter(axis.formatter, unit),
          color: mini ? "transparent" : "#333",
        },
      };
    }
    case OptionType.parallelBar: {
      if (withoutData) {
        return {
          type: "category",
          show: false,
        };
      }
      return {
        type: "category",
        show: true,
        axisLine: { show: false },
        axisTick: { show: false, alignWithLabel: true },
        axisLabel: {},
      };
    }
    case OptionType.scatter: {
      if (withoutData) {
        return {
          splitNumber: 4,
          axisLabel: {
            show: false,
          },
          axisTick: {
            show: false,
          },
        };
      }
    }
  }
  return {};
}
export { getXAxis, getYAxis };
