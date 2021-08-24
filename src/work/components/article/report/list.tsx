import React from "react";
import { ArticleListNode } from "../../../generated/graphql";
import ResearchReportItem from "./item";

interface ReportListProps {
  list: ArticleListNode[];
}

const ReportList: React.FunctionComponent<ReportListProps> = (props) => {
  const { list } = props;

  return (
    <>
      {list?.map((v, k) => {
        return <ResearchReportItem key={k} data={v} />;
      })}
    </>
  );
};

export default ReportList;
