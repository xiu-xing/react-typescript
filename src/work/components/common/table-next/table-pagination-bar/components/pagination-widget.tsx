import React from "react";
import NextPageButton from "./next-page-button";
import PageDetails from "./page-details";
import PrePageButton from "./pre-page-button";

interface PaginationWidgetProps {
  loading: boolean;
  currentPage: number;
  totalPage: number;
  onPrePageButtonClick(prePage: number): void;
  onNextPageButtonClick(nextPage: number): void;
  disableddPre?: boolean;
  disabledNext?: boolean;
}

const PaginationWidget: React.FunctionComponent<PaginationWidgetProps> = (props) => {
  return (
    <>
      <PrePageButton
        disabled={props.disableddPre}
        loading={props.loading}
        onClick={props.onPrePageButtonClick}
        currentPage={props.currentPage}
      />
      <PageDetails currentPage={props.currentPage} totalPage={props.totalPage} />
      <NextPageButton
        disabled={props.disabledNext}
        loading={props.loading}
        onClick={props.onNextPageButtonClick}
        currentPage={props.currentPage}
        totalPage={props.totalPage}
      />
    </>
  );
};

export default PaginationWidget;
