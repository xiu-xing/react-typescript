import React, { HTMLProps } from "react";
import {
  SVGRecentEstablishCompany,
  SVGRecentFinanceEvents,
  SVGRecentExitEvents,
  SVGRecentBrowsing,
  SVGSearchTemplate,
  SVGRecentlyEstablishedFund,
  SVGTrending,
  SVGDatabaseStatistics,
  SVGInstitutions,
} from "./assets/svg"


export enum ModuleType {
  DATABASE_STATISTICS = "DatabaseStatistics",
  RECENT_ESTABLISH_COMPANY = "RecentEstablishCompany",
  RECENTLY_ESTABLISHED_FUND = "RecentlyEstablishedFund",
  RECENT_BROWSING = "RecentBrowsing",
  RECENT_FINANCE_EVENTS = "RecentFinanceEvents",
  TRENDING = "Trending",
  RECENT_EXIT_EVENTS = "RecentExitEvents",
  SEARCH_TEMPLATE = "SearchTemplate",
  INSTITUTIONS_LATEST_EXIT = "InstitutionsLatestExit",
  INSTITUTIONS_LATEST_INVESTMENT = "InstitutionsLatestInvestment",
  INSTITUTIONS_LATEST_INVESTMENT_TENDENCY = "InstitutionsLatestInvestmentTendency",
}

interface ModuleTypeAvatarProps extends HTMLProps<HTMLElement> {
  moduleType?: ModuleType;
}

const ModuleTypeAvatar: React.FunctionComponent<ModuleTypeAvatarProps> = ({ moduleType, className }) => {


  function defaultAvatar(): JSX.Element {
    switch (moduleType) {
      case ModuleType.DATABASE_STATISTICS:
        return <SVGDatabaseStatistics className={className}/>;
      case ModuleType.RECENT_ESTABLISH_COMPANY:
        return <SVGRecentEstablishCompany className={className}/>;
      case ModuleType.RECENTLY_ESTABLISHED_FUND:
        return <SVGRecentlyEstablishedFund  className={className}/>;
      case ModuleType.RECENT_EXIT_EVENTS:
        return <SVGRecentExitEvents className={className}/>;
      case ModuleType.RECENT_BROWSING:
        return <SVGRecentBrowsing className={className}/>;
      case ModuleType.RECENT_FINANCE_EVENTS:
        return <SVGRecentFinanceEvents className={className}/>;
      case ModuleType.SEARCH_TEMPLATE:
        return <SVGSearchTemplate className={className}/>;
      case ModuleType.TRENDING:
        return <SVGTrending className={className} />;
      case ModuleType.INSTITUTIONS_LATEST_EXIT:
      case ModuleType.INSTITUTIONS_LATEST_INVESTMENT:
      case ModuleType.INSTITUTIONS_LATEST_INVESTMENT_TENDENCY:
        return <SVGInstitutions className={className} />
      default:
        return <></>;
    }
  }

  return defaultAvatar();
};

export default ModuleTypeAvatar;
