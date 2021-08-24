import React, { useMemo } from "react";
import { Section as SectionModel } from "../../../../generated/graphql";
import TableSection from "../../../common/section-next/core/table";
import RealmDataBlockSection from "../../../common/section-next/fetching/block/realm-data-block";
import RealmChartSection from "../../../common/section-next/fetching/chart/realm-charts-section";

export interface SectionProps {
  sectionModel: SectionModel;
}

const Section: React.FunctionComponent<SectionProps> = (props) => {
  const content = useMemo(() => {
    switch (props.sectionModel.__typename) {
      case "BlockSection":
        return <RealmDataBlockSection section={props.sectionModel} />;
      case "ChartSection":
        return <RealmChartSection section={props.sectionModel} />;
      case "TableSection":
        return <TableSection section={props.sectionModel} />;
      case "GraphSection":
      case "ProgressBarSection":
      case "StatementSheetSection":
      case "ListSection":
      case "InfoFlowSection":
      case "FeaturedTableSection":
      case "FeaturedListSection":
        return null;
      default:
        // eslint-disable-next-line no-case-declarations
        const _exhaustiveCheck: never = props.sectionModel;
        return _exhaustiveCheck;
    }
  }, [props]);

  return content;
};

export default Section;
