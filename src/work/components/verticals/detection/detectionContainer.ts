import { useEffect, useState } from "react";
import { createContainer } from "unstated-next";
import { QuarterSequence } from "../../../generated/graphql";

export enum MetricsIDs {
  RankingScore = "ranking_score",
  InvestorCount = "investor_count",
  DealCount = "deal_count",
  DealCountIncrement = "deal_count_increment",
  CompanyCountIncrement = "company_count_increment",
  DealInterval = "deal_interval",
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useDetection() {
  const [year, setYear] = useState<number>(2021);
  const [quarter, setQuarter] = useState<QuarterSequence>(QuarterSequence.Annual);
  const [quarterName, setQuarterName] = useState<string>("");

  useEffect(() => {
    switch (quarter) {
      case QuarterSequence.One:
        setQuarterName("第 1 季度");
        break;
      case QuarterSequence.Two:
        setQuarterName("第 2 季度");
        break;
      case QuarterSequence.Three:
        setQuarterName("第 3 季度");
        break;
      case QuarterSequence.Four:
        setQuarterName("第 4 季度");
        break;
      default:
        setQuarterName("");
    }
  }, [quarter]);

  return {
    year,
    setYear,
    quarter,
    setQuarter,
    quarterName,
    setQuarterName,
  };
}

const DetectionContainer = createContainer(useDetection);
export default DetectionContainer;
