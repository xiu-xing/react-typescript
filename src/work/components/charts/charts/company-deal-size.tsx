import { EChartsOption } from "echarts-for-react";
import React from "react";
import theme from "../../../theme";
import { CurrencyCode, CurrencyString } from "../../../utils/currency";
import { HumanReadableString, Unit } from "../../../utils/unit";
import { ChartDataModel } from "../../common/chart/common-chart/models/chartData";
import Chart from "../components/chart/chart";

const CompanyDealSizeChart: React.FunctionComponent = () => {
  const showAxisLabelCount = 5;

  function lineOption(title: string, serieDimensions: Array<string>): EChartsOption {
    return {
      title: {
        text: `{title|${title}}`,
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
      legend: { show: false },
      xAxis: {
        type: "category",
        show: true,
        axisLine: { show: false },
        axisTick: {
          show: true,
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
          color: theme.palette.primary.main,
          dimensions: serieDimensions,
          areaStyle: { color: theme.palette.primary.main },
        },
      ],
    };
  }

  function lineChartDataCallback(data: ChartDataModel): EChartsOption | undefined {
    if (data) {
      const newOption: EChartsOption = lineOption("累计融资额", ["year", "累计总投资金额"]);
      const dataset = data.dataset;
      if (dataset) {
        newOption.dataset = {
          source: dataset,
        };
        if (dataset.length > showAxisLabelCount) {
          newOption.dataZoom = [
            {
              type: "slider",
              show: true,
              handleSize: "100%",
              xAxisIndex: [0],
              left: "9%",
              height: "20px",
              // 取消刷选
              brushSelect: false,
              moveHandleSize: 0,
            },
          ];
        }
        newOption.yAxis.axisLabel.formatter = ((unit) => (value: number): string => {
          if (unit === "万") {
            return HumanReadableString(value, Unit.TenThousand);
          }
          return `${value} ${unit}`;
        })(data.unit);

        newOption.tooltip.formatter = ((unit, currencyCode) => (
          chartParams: Array<{
            data: Array<string | number>;
            seriesName: string;
          }>,
        ): string => {
          const activeItem = chartParams[0];
          return `${activeItem.data[0]}<br/>${activeItem.seriesName}: ${
            typeof activeItem.data[1] === "number" && unit === "万"
              ? HumanReadableString(activeItem.data[1], Unit.TenThousand)
              : activeItem.data[1] + unit
          }${CurrencyString(currencyCode)}`;
        })(data.unit, data.currencyCode as CurrencyCode);
      }
      if (data.subtitle) {
        newOption["title"].text = `{title|累计融资额} {subtitle| ${data.subtitle}}`;
      }
      return newOption;
    }
    return undefined;
  }

  return <Chart chartId="company.deal_size" dataHandler={lineChartDataCallback} />;
};

export default CompanyDealSizeChart;
