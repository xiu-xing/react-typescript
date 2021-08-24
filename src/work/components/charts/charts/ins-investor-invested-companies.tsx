import { EChartsOption } from "echarts-for-react";
import React from "react";
import { ChartDataModel } from "../../common/chart/common-chart/models/chartData";
import Chart from "../components/chart/chart";

const InsInvestorInvestedCompaniesChart: React.FunctionComponent = () => {
  const chartKeys = ["后续融资企业", "无后续融资企业"];

  const dataCallback = (data: ChartDataModel): EChartsOption | undefined => {
    if (!data) {
      return undefined;
    }

    const option: EChartsOption = {
      title: {
        text: "投资战绩",
      },
      legend: {
        type: "scroll",
        icon: "circle",
        orient: "vertical",
        left: "left",
        top: "middle",
        itemWidth: 10,
        itemHeight: 10,
        itemGap: 30,
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
            formatter(params: { data: Array<string>; percent: number }): string {
              return `{text|${params.data[1]} 家， 占比 ${params.percent}%}`;
            },
            rich: {
              text: {
                color: "rgba(0, 0, 0, .65)",
                fontSize: 12,
                lineHeight: 22,
              },
            },
          },
          center: ["60%", "45%"],
        },
      ],
      dataset: {
        source: data.dataset,
      },
    };

    return option;
  };

  return <Chart chartId="ins_investor.invested_companies" dataHandler={dataCallback} />;
};

export default InsInvestorInvestedCompaniesChart;
