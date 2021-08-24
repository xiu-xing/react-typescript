import { EChartsOption } from "echarts-for-react";
import React from "react";
import theme from "../../../theme";
import { ChartDataModel } from "../../common/chart/common-chart/models/chartData";
import Chart from "../components/chart/chart";

interface ChartActiveItem {
  data: Array<string | number>;
}

const VerticalCompanyFoundedDate: React.FunctionComponent = () => {
  function chartDataCallBack(data: ChartDataModel): EChartsOption | undefined {
    if (data) {
      const newOption: EChartsOption = {
        color: [theme.palette.primary.main],
        title: {
          text: `{title|成立时间分布}`,
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
        tooltip: {
          backgroundColor: "#ffffff",
          textStyle: {
            color: "#666666",
            fontFamily: "Noto Sans SC",
            fontSize: 12,
          },
          trigger: "axis",
          position: "top",
          axisPointer: {
            type: "none",
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

      newOption.dataset = {
        source: data.dataset,
      };

      if (data.dataset) {
        newOption.tooltip.formatter = (chartParams: Array<ChartActiveItem>): string => {
          const activeItem = chartParams[0]?.data;
          if (activeItem && activeItem.length >= 2) {
            return `${activeItem[0]}<br/>成立 ${activeItem[1]} 家企业`;
          }
          return "";
        };
      }

      return newOption;
    }
    return undefined;
  }

  return <Chart chartId="vertical.num_of_company_by_founded_on" dataHandler={chartDataCallBack} filters={["region"]} />;
};

export default VerticalCompanyFoundedDate;
