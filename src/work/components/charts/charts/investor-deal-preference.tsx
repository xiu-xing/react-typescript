import { EChartsOption } from "echarts-for-react";
import React from "react";
import { ChartDataModel } from "../../common/chart/common-chart/models/chartData";
import { ChartActiveItem } from "../../common/entity-chart/entity-chart";
import Chart from "../components/chart/chart";

const getOptions = (title: string): EChartsOption => {
  return {
    title: {
      text: title,
    },
    legend: {
      type: "scroll",
      icon: "circle",
      orient: "vertical",
      left: "left",
      top: "middle",
      itemWidth: 10,
      itemHeight: 10,
      itemGap: 16,
    },
    tooltip: {
      backgroundColor: "#ffffff",
      textStyle: {
        color: "#666666",
        fontFamily: "Noto Sans SC",
        fontSize: 12,
      },
      position: "top",
      axisPointer: {
        type: "none",
      },
    },
    series: [
      {
        type: "pie",
        label: {
          formatter: "{d}%",
        },
      },
    ],
  };
};

const InvestorDealPreference: React.FunctionComponent = () => {
  // const { filterInputs } = FilterContainer.useContainer();

  function dealFavorChartDataCallback(data: ChartDataModel): EChartsOption | undefined {
    if (data) {
      const newOption: EChartsOption = getOptions("交易类型偏好");
      newOption.dataset = {
        source: data.dataset,
      };

      if (data.dataset && data.dataset.length) {
        newOption.tooltip.formatter = ((unit) => (chartParams: ChartActiveItem): string => {
          const activeItem = chartParams?.data;
          if (activeItem && activeItem.length >= 2) {
            return `${activeItem[0]}：${activeItem[1]} ${unit}`;
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
      chartId="investor.deal_type_preference"
      dataHandler={dealFavorChartDataCallback}
      filters={["year", "region"]}
    />
  );
};

export default InvestorDealPreference;
