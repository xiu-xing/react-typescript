import React, { forwardRef, useMemo } from "react";
import {
  BlockSection as BlockSectionModel,
  ChartSection as ChartSectionModel,
  GraphSection as GraphSectionModel,
  ProgressBarSection as ProgressBarSectionModel,
  StatementSheetSection as StatementSheetSectionModel,
  TableSection as TableSectionModel,
} from "../../../generated/graphql";
import BlockSection from "./block-section";
import ChartSection from "./chart-section";
import GraphSection from "./graph-section";
import ProgressBarSection from "./progress-bar-section";
import StatementSheetSection from "./statement-sheet-section";
import TableSection from "./table-section";

export interface SectionProps {
  section:
    | BlockSectionModel
    | ChartSectionModel
    | TableSectionModel
    | GraphSectionModel
    | ProgressBarSectionModel
    | StatementSheetSectionModel;
}

const Section = forwardRef<HTMLDivElement, SectionProps>(function Section(props, ref) {
  const content = useMemo(() => {
    switch (props.section.__typename) {
      case "BlockSection":
        return <BlockSection ref={ref} section={props.section} />;
      case "ChartSection":
        return <ChartSection ref={ref} section={props.section} />;
      case "TableSection":
        return <TableSection ref={ref} section={props.section} />;
      case "GraphSection":
        return <GraphSection ref={ref} section={props.section} />;
      case "ProgressBarSection":
        return <ProgressBarSection ref={ref} section={props.section} />;
      case "StatementSheetSection":
        return <StatementSheetSection ref={ref} section={props.section} />;
      default:
        // eslint-disable-next-line no-case-declarations
        const _exhaustiveCheck: never = props.section;
        return _exhaustiveCheck;
    }
  }, [props]);

  return content;
});

export default Section;
