import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import DetailTab from "./components/detail-tab";
import Idea from "./components/idea";
import { request } from "../../../utils/axios";
import { useRouter } from "next/router";
import { Document, Page } from "react-pdf";
import { pdfjs } from "react-pdf";
pdfjs.GlobalWorkerOptions.workerSrc = `//cdnjs.cloudflare.com/ajax/libs/pdf.js/${pdfjs.version}/pdf.worker.min.js`;
import _ from "lodash";
import NoData from "../components/no-data";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
    },
    file: {
      paddingLeft: 16,
      fontSize: 14,
      color: "#737373",
      margin: "10px auto",
      textAlign: "center",
    },
    document: {
      width: "100%",
    },
    placeholder: {
      height: 500,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
  }),
);

export interface DetailSource {
  imgShowPath: string;
  insContent: string;
  insSubTitle: string;
  insTitle: string;
  matPath: string;
  insId: string;
  videoId: string;
  pptId: string;
  pptPath: string;
  pptShowPath: string;
}

interface DetailResponse {
  page?: string;
  returnCode?: number;
  returnMsg?: string;
  source: DetailSource;
}

const detailTabs = ["核心观点", "文档"];

const WinSightsContent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const query = useRouter().query;
  const [numPages, setNumPages] = useState<number[]>([]);
  const [detail, setDetail] = useState<DetailSource>();
  const [pptId, setPPTId] = useState<boolean>(false);

  function getActivityData() {
    request.get<DetailResponse>(`${process.env.NEXT_PUBLIC_WINSIGHTS}/insight/${query.insId}`, {}).then((data) => {
      if (data.source) {
        setDetail(data.source);
        if (data.source.pptId && data.source.pptShowPath && data.source.pptShowPath.split(".")[1] == "pdf") {
          setPPTId(true);
        }
      }
    });
  }

  function onDocumentLoadSuccess(num: any) {
    const pageNumber = _.get(num, ["_pdfInfo", "numPages"]) as number;
    for (let index = 0; index < pageNumber; index++) {
      setNumPages((numPages) => numPages.concat(index));
    }
  }

  function showDocument() {
    if (pptId) {
      return (
        <Document
          file={`${process.env.NEXT_PUBLIC_WINSIGHTS}/attachment/${detail?.pptShowPath}`}
          onLoadSuccess={onDocumentLoadSuccess}
          loading=""
          className={classes.document}
        >
          {numPages.length > 0 &&
            numPages.map((item) => {
              return (
                <div key={item}>
                  <Page pageNumber={item + 1} />
                </div>
              );
            })}
        </Document>
      );
    } else {
      return (
        <div className={classes.placeholder}>
          <NoData tip="应专家要求本场会议不上传文档" />
        </div>
      );
    }
  }

  useEffect(() => {
    getActivityData();
  }, []);

  return (
    <div className={classes.root}>
      <DetailTab detail={detail} tabs={detailTabs} defaultActiveIndex={0}>
        <Idea detail={detail} />
        {showDocument()}
      </DetailTab>
    </div>
  );
};

export default WinSightsContent;
