import { EChartsOption } from "echarts-for-react";
import { useEffect, useState } from "react";
import { createContainer } from "unstated-next";
import { QuarterSequence, useVerticalMetricsChartQuery } from "../../../../../generated/graphql";

export interface ChartInitialState {
  verticalID?: string;
  metricsID: string;
  year: number;
  quarter?: QuarterSequence;
  dataHandle: (data: Array<Array<string | number>>) => EChartsOption;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useChart(initialState?: ChartInitialState) {
  const { verticalID, metricsID, year, quarter, dataHandle } = initialState || {};
  const [chartOption, setChartOption] = useState<EChartsOption>({});
  const [VerticalMetricsChartQueryResult] = useVerticalMetricsChartQuery({
    variables: {
      verticalID,
      metricsID: metricsID || "",
      year: year as number,
      quarter: quarter || QuarterSequence.Annual,
    },
  });

  useEffect(() => {
    if (VerticalMetricsChartQueryResult.fetching) {
      return;
    }
    if (VerticalMetricsChartQueryResult.data) {
      const data = VerticalMetricsChartQueryResult.data.verticalMetricsChart;
      try {
        const chartData = data ? JSON.parse(data) : [];
        const option = dataHandle?.(chartData);
        option && setChartOption(option);
      } catch (error) {
        const option = dataHandle?.([]);
        option && setChartOption(option);
      }
      return;
    }
    if (VerticalMetricsChartQueryResult.error) {
      const option = dataHandle?.([]);
      option && setChartOption(option);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [VerticalMetricsChartQueryResult]);

  return { chartOption };
}

const ChartContainer = createContainer(useChart);
export default ChartContainer;
