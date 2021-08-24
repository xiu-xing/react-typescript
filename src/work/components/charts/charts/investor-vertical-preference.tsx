import { EChartsOption } from "echarts-for-react";
import React from "react";
import theme from "../../../theme";
import { ChartDataModel } from "../../common/chart/common-chart/models/chartData";
import { ChartActiveItem } from "../../common/entity-chart/entity-chart";
import Chart from "../components/chart/chart";

const getBarOptions = (title: string): EChartsOption => {
  return {
    color: [theme.palette.primary.main],
    title: {
      text: title,
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
    toolbox: {
      show: true,
      right: 40,
      feature: {
        saveAsImage: {
          show: true,
        },
      },
    },
    grid: {
      left: "3%",
      right: "4%",
      bottom: 40,
      containLabel: true,
    },
    xAxis: [
      {
        show: true,
        type: "category",
        axisLine: { show: true },
        axisTick: { show: true, alignWithLabel: true },
      },
    ],
    yAxis: [
      {
        type: "value",
      },
    ],
    series: [
      {
        name: "投资次数",
        type: "bar",
        barMaxWidth: 32,
      },
    ],
    dataZoom: [
      {
        type: "slider",
        xAxisIndex: 0,
        filterMode: "empty",
        height: "20px",
        // 取消刷选
        brushSelect: false,
        moveHandleSize: 0,
      },
    ],
  };
};

const InvestorVerticalPreference: React.FunctionComponent = () => {
  // const { filterInputs } = FilterContainer.useContainer();

  function verticalFavorChartDataCallback(data: ChartDataModel): EChartsOption | undefined {
    if (data) {
      const newOption: EChartsOption = getBarOptions("行业偏好");
      newOption.dataset = {
        source: data.dataset,
      };

      if (data.dataset && data.dataset.length) {
        newOption.tooltip.formatter = ((unit) => (chartParams: Array<ChartActiveItem>): string => {
          const activeItem = chartParams[0]?.data;
          if (activeItem && activeItem.length >= 2) {
            return `${activeItem[0]}<br/>投资次数：${activeItem[1]} ${unit}`;
          }
          return "";
        })(data.unit);
      }

      return newOption;
    }
    return undefined;
  }

  return (
    <Chart
      filters={["year", "region"]}
      chartId="investor.vertical_preference"
      dataHandler={verticalFavorChartDataCallback}
    />
  );
};

export default InvestorVerticalPreference;
