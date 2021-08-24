import { Box, makeStyles, createStyles, Typography, Theme } from "@material-ui/core";
import React, { useEffect, useRef, useState } from "react";
import ExpertItem from "./components/expert-item";
import MeetItem from "./components/meet-item";
import { request } from "../../../utils/axios";
import SearchInput from "./components/searchInput";
import SimpleBar from "simplebar-react";
import NoData from "../components/no-data";
import { ContentProps } from "../trendingExpert";

export interface InsightSource {
  date: string;
  id: string;
  imgShowPath: string;
  insId: string;
  insMediaLen: string;
  insSubTitle: string;
  insTitle: string;
}

interface InsightPage {
  total: number;
}

interface InsightData {
  page: InsightPage;
  returnCode?: number;
  returnMsg?: string;
  source: InsightSource[];
}

export interface ExportSource {
  expGoodAt: string;
  expImg: string;
  expIntroduce: string;
  expSummary: string;
  id: string;
  popExpId: string;
  seqId: string;
}

interface ExpertsData {
  returnCode?: number;
  returnMsg?: string;
  source: ExportSource[];
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
    },
    content: {
      paddingBottom: 14,
      width: "66.66%",
      [theme.breakpoints.down("md")]: {
        width: "60%",
      },
      [theme.breakpoints.down("xs")]: {
        width: "55%",
      },
    },
    itemList: {
      display: "flex",
      flexWrap: "wrap",
      alignItems: "start",
      justifyContent: "start",
    },
    item: {
      width: "50%",
      [theme.breakpoints.down("md")]: {
        width: "100%",
      },
    },
    export: {
      position: "sticky",
      top: 0,
      zIndex: 9,
      left: 0,
      height: "100%",
      padding: "16px",
      width: "33.33%",
      [theme.breakpoints.down("md")]: {
        width: "40%",
      },
      [theme.breakpoints.down("xs")]: {
        width: "45%",
      },
    },
    title: {
      fontSize: 16,
      fontWeight: 500,
      color: "#333333",
      marginBottom: "24px",
    },
    onData: {
      textAlign: "center",
      fontSize: 12,
      color: "#999",
      marginTop: 30,
    },
    placeholder: {
      height: 500,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
  }),
);

const ExportMeet: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const [insight, setInsight] = useState<InsightSource[]>([]);
  const [hotAdviser, setHotAdviser] = useState<ExportSource[]>([]);
  const [pageNo, setPageNo] = useState(1);
  const [currentInput, setCurrentInput] = useState<string>();
  const [count, setCount] = useState<number>(0);
  const [fetching, setFetching] = useState<boolean>(true);
  const [hasNextPage, setHasNextPage] = useState(true);
  const scrollElementRef = useRef<SimpleBar | null>(null);
  const [expertDemandContent, setExpertDemandContent] = useState<ContentProps[]>([]);

  const getInsight = (pageNo: number, query?: string) => {
    const filter = {
      insType: "0",
      query: query,
    };
    setFetching(true);
    request
      .get<InsightData>(`${process.env.NEXT_PUBLIC_WINSIGHTS}/insight`, {
        filter: JSON.stringify(filter),
        pageNo: pageNo,
        pageSize: 20,
      })
      .then((data) => {
        if (data.source) {
          setInsight((insight) => insight.concat(data.source));
          setHasNextPage(data.page.total > pageNo * 20);
          setFetching(false);
        }
      })
      .catch((error: unknown) => {
        console.log(error);
      });
  };

  function getHotExport() {
    const filter = {
      seqIds: [],
      i18n: "zh",
    };
    request
      .get<ExpertsData>(`${process.env.NEXT_PUBLIC_WINSIGHTS}/hotadviser/top`, {
        filter: JSON.stringify(filter),
        pageNo: 1,
        pageSize: 5,
      })
      .then((data) => {
        if (data.source.length > 0) {
          setHotAdviser(data.source);
          data.source.forEach((item) => {
            setExpertDemandContent((expertDemandContent) =>
              expertDemandContent.concat({ title: item.expSummary, id: item.id }),
            );
          });
        }
      })
      .catch((error: unknown) => {
        console.log(error);
      });
  }

  function getCurrentInput(keyDown: string) {
    setCurrentInput(keyDown);
  }

  useEffect(() => {
    if (fetching) return;
    setPageNo((pageNo) => pageNo + 1);
  }, [count]);

  useEffect(() => {
    if (!hasNextPage) return;
    getInsight(pageNo, currentInput);
  }, [pageNo]);

  useEffect(() => {
    setHasNextPage(true);
    if (currentInput == undefined) return;
    setInsight([]);
    if (pageNo != 1) {
      setPageNo(1);
      return;
    }
    getInsight(1, currentInput);
  }, [currentInput]);

  const handleOnScroll = () => {
    if (!scrollElementRef?.current) return;
    const element = scrollElementRef.current.getScrollElement();
    if (element.scrollTop + element.clientHeight + 30 >= element.scrollHeight) {
      setCount((pre) => pre + 1);
    }
  };

  useEffect(() => {
    getHotExport();
    if (scrollElementRef.current) {
      scrollElementRef.current.getScrollElement().addEventListener("scroll", handleOnScroll);
      return () => {
        scrollElementRef.current?.getScrollElement().removeEventListener("scroll", handleOnScroll);
      };
    }
  }, []);

  function showNoData() {
    if (insight.length < 1)
      return (
        <div className={classes.placeholder}>
          <NoData tip="暂无数据" />
        </div>
      );
    if (!hasNextPage) {
      return <Typography className={classes.onData}> 滑到底啦！</Typography>;
    } else {
      return null;
    }
  }
  return (
    <SimpleBar style={{ height: "100%" }} ref={scrollElementRef}>
      <Box width="100%" display="flex" justifyContent="center">
        <Box maxWidth={1348} width={"100%"}>
          <SearchInput getCurrentInput={getCurrentInput} />
          <Box className={classes.root}>
            <div className={classes.content}>
              <Box className={classes.itemList}>
                {insight.length > 0 &&
                  insight.map((item, index) => {
                    return (
                      <div key={index} className={classes.item}>
                        <MeetItem data={item} />
                      </div>
                    );
                  })}
              </Box>
              {showNoData()}
            </div>
            <Box className={classes.export}>
              <div className={classes.title}>热门专家</div>
              {hotAdviser.length > 0 &&
                hotAdviser.map((item, index) => {
                  return <ExpertItem key={item.id} index={index} data={item} content={expertDemandContent} />;
                })}
            </Box>
          </Box>
        </Box>
      </Box>
    </SimpleBar>
  );
};

export default ExportMeet;
