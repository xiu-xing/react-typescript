import React, { ComponentType } from "react";
import CompanyDealSizeChart from "./charts/company-deal-size";
import InvestorDealPreference from "./charts/investor-deal-preference";
import InvestorLocationPreference from "./charts/investor-location-preference";
import InvestorVerticalPreference from "./charts/investor-vertical-preference";

import CompanyDealTrendChart from "./charts/company-deal-trend";
import InvestorExitsChart from "./charts/investor-exits";
import InvestorInvestmentsChart from "./charts/investor-investments";
import InsInvestorInvestedCompaniesChart from "./charts/ins-investor-invested-companies";
import VerticalCompanyFoundedDate from "./charts/vertical-company-founed-date";
import VerticalDealSizeTrend from "./charts/vertical-deal-size-trend";
import VerticalDealValuationTrend from "./charts/vertical-deal-valuation-trend";
import VerticalTradingHeat from "./charts/vertical-trading-heat";

const ChartMap: Map<string, ComponentType> = new Map([
  ["company.deal_size", CompanyDealSizeChart],
  ["company.deal_trend", CompanyDealTrendChart],
  ["investor.investments", InvestorInvestmentsChart],
  ["investor.exits", InvestorExitsChart],
  ["ins_investor.invested_companies", InsInvestorInvestedCompaniesChart],
  ["investor.vertical_preference", InvestorVerticalPreference],
  ["investor.deal_type_preference", InvestorDealPreference],
  ["investor.location_preference", InvestorLocationPreference],
  ["vertical.num_of_company_by_founded_on", VerticalCompanyFoundedDate],
  ["vertical.deal_count_trend", VerticalTradingHeat],
  ["vertical.deal_valuation_trend", VerticalDealValuationTrend],
  ["vertical.deal_size_trend", VerticalDealSizeTrend],
]);

interface ChartRouterProps {
  chartId: string;
}

const ChartRouter: React.FunctionComponent<ChartRouterProps> = ({ chartId }) => {
  const ChartComponent = ChartMap.get(chartId);

  if (ChartComponent) {
    return <ChartComponent />;
  }
  return <div />;
};

export default ChartRouter;
