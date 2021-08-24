import { Box } from "@material-ui/core";
import React, { useMemo } from "react";
import { QuarterSequence } from "../../../../../generated/graphql";
import { MetricsIDs } from "../../../../verticals/detection/detectionContainer";
import CompanyCountIncrementChart from "./charts/company-count-increment-chart";
import DealCountChart from "./charts/deal-count-chart";
import DealCountIncrementChart from "./charts/deal-count-increment-chart";
import DealIntervalChart from "./charts/deal-interval-chart";
import InvestorCountChart from "./charts/investor-count-chart";
import RankingScoreChart from "./charts/ranking-score-chart";

export interface ChartProps {
  verticalId: string;
  year: number;
  quarter?: QuarterSequence;
  mini?: boolean;
}

interface CustomChartProps extends ChartProps {
  metricsId: string;
  height?: number | string;
}

const Chart: React.FC<CustomChartProps> = (props) => {
  const { height = "100%", metricsId, ...restProps } = props;

  const chart = useMemo(() => {
    switch (metricsId) {
      case MetricsIDs.CompanyCountIncrement:
        return <CompanyCountIncrementChart {...restProps} />;
      case MetricsIDs.DealCount:
        return <DealCountChart {...restProps} />;
      case MetricsIDs.DealCountIncrement:
        return <DealCountIncrementChart {...restProps} />;
      case MetricsIDs.DealInterval:
        return <DealIntervalChart {...restProps} />;
      case MetricsIDs.InvestorCount:
        return <InvestorCountChart {...restProps} />;
      case MetricsIDs.RankingScore:
        return <RankingScoreChart {...restProps} />;
      default:
        return null;
    }
  }, [metricsId, restProps]);

  return <Box height={height}>{chart}</Box>;
};

export default Chart;
