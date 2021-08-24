import React, { forwardRef, useMemo } from "react";
import { Section as SectionModel } from "../../../../../../generated/graphql";
import TableSection from "../../../../../common/section-next/core/table";
import DataBlockSection from "../../../../../common/section-next/fetching/block/data-block-section";
import DataChartSection from "../../../../../common/section-next/fetching/chart/data-charts-section";
import DataFeaturedTable from "../../../../../common/section-next/fetching/featured-table/data-featured-table";
import GraphSection from "../../../../../common/section-next/fetching/graph";
import ProgressBarSection from "../../../../../common/section-next/fetching/progress-bar-section";
import StatementSheetSection from "../../../../../common/section-next/fetching/statement-sheet";

export interface SectionProps {
  section: SectionModel;
}

const Section = forwardRef<HTMLDivElement, SectionProps>(function Section(props, ref) {
  const content = useMemo(() => {
    switch (props.section.__typename) {
      case "BlockSection":
        return <DataBlockSection ref={ref} section={props.section} />;
      case "ChartSection":
        return <DataChartSection ref={ref} section={props.section} />;
      case "TableSection":
        return <TableSection ref={ref} section={props.section} />;
      case "GraphSection":
        return <GraphSection ref={ref} section={props.section} />;
      case "ProgressBarSection":
        return <ProgressBarSection ref={ref} section={props.section} />;
      case "StatementSheetSection":
        return <StatementSheetSection ref={ref} section={props.section} />;
      case "ListSection":
      case "InfoFlowSection":
      case "FeaturedListSection":
        return null;
      case "FeaturedTableSection":
        return <DataFeaturedTable ref={ref} section={props.section} />;
      default:
        // eslint-disable-next-line no-case-declarations
        const _exhaustiveCheck: never = props.section;
        return _exhaustiveCheck;
    }
  }, [props]);
console.log("00000000000000000000000000",props.section);

  return content;
});

export default Section;
