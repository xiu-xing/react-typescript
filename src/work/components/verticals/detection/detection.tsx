import { createStyles, makeStyles } from "@material-ui/core/styles";
import { cloneDeep } from "lodash";
import Head from "next/head";
import React, { useEffect, useState } from "react";
import { useClient } from "urql";
import {
  QuarterRange,
  QuarterSequence,
  VerticalMetricsQuarterRangeDocument,
  VerticalMetricsQuarterRangeQuery,
  VerticalMetricsQuarterRangeQueryVariables
} from "../../../generated/graphql";
import Navigation from "../../common/navigation/navigation";
import { NavigationCollapseItemProps } from "../../common/navigation/navigation-collapse-item";
import { NavigationItemProps } from "../../common/navigation/navigation-item";
import StickyToolbar from "../../common/toolbar/sticky-toolbar";
import CompanyCountIncrementChart from "./components/section/charts/company-count-increment-chart";
import DealCountChart from "./components/section/charts/deal-count-chart";
import DealCountIncrementChart from "./components/section/charts/deal-count-increment-chart";
import DealIntervalChart from "./components/section/charts/deal-interval-chart";
import InvestorCountChart from "./components/section/charts/investor-count-chart";
import RankingScoreChart from "./components/section/charts/ranking-score-chart";
import Section, { SectionProps } from "./components/section/section";
import DetectionContainer, { MetricsIDs } from "./detectionContainer";

const useStyles = makeStyles(() =>
  createStyles({
    outermostBox: {
      width: 1316,
      margin: "auto",
    },
    root: {
      display: "grid",
      gridTemplateColumns: "148px 1fr",
    },
    navigationBox: {
      position: "fixed",
      top: 48,
      bottom: 0,
      padding: "24px 4px 0px 24px",
      width: 148,
      zIndex: 1,
      backgroundColor: "white",
      overflowY: "hidden",
      "&:hover": {
        overflowY: "overlay",
      },
      "&::-webkit-scrollbar": {
        width: "6px",
        height: "6px",
      },
      "&::-webkit-scrollbar-thumb": {
        backgroundColor: "rgba(0, 0, 0, 0.4)",
        borderRadius: "3px",
      },
    },
    navigationItem: {
      fontSize: 14,
      color: "#333",
      padding: "6px 0 6px 8px",
    },
    navigationPseudo: {
      marginTop: 0,
      transform: "translateY(-50%)",
    },
    contentBox: {
      width: 1144 + 148,
      paddingLeft: 148,
      paddingTop: 56,
    },
    toolbar: {
      paddingTop: 10,
      position: "fixed",
    },
    title: {
      color: "#333",
      fontWeight: 500,
    },
    sectionBox: {
      paddingTop: 10,
      paddingLeft: 12,
    },
    section: {
      marginTop: 40,
      paddingBottom: 40,
      borderBottom: "1px solid #EEE",
      "&:first-child": {
        marginTop: 14,
      },
      "&:last-child": {
        borderBottom: "none",
      },
    },
  }),
);

const DetectionDisplay: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const client = useClient();
  const { year, setYear, quarter, setQuarter, quarterName } = DetectionContainer.useContainer();
  const [verticalMetricsQuarterRangeResult, setVerticalMetricsQuarterRangeResult] = useState<QuarterRange>();
  const [navigationItems, setNavigationItems] = useState<NavigationCollapseItemProps[]>([]);
  const quarterSequenceArray: QuarterSequence[] = [
    QuarterSequence.One,
    QuarterSequence.Two,
    QuarterSequence.Three,
    QuarterSequence.Four,
  ];

  function getNavigationItemProps(qs: QuarterSequence): NavigationItemProps[] {
    const navigationItemProps: NavigationItemProps[] = [];
    let i = 0;
    switch (qs) {
      case QuarterSequence.One:
        i = 1;
        break;
      case QuarterSequence.Two:
        i = 2;
        break;
      case QuarterSequence.Three:
        i = 3;
        break;
      case QuarterSequence.Four:
        i = 4;
        break;
    }
    for (i; i > 0; i--) {
      const quarterSequence = quarterSequenceArray[i - 1];
      navigationItemProps.push({
        type: "item",
        name: `第 ${i} 季度`,
        onClick: (): void => setQuarter(() => quarterSequence),
      });
    }
    return navigationItemProps;
  }

  useEffect(() => {
    client
      .query<VerticalMetricsQuarterRangeQuery, VerticalMetricsQuarterRangeQueryVariables>(
        VerticalMetricsQuarterRangeDocument,
        undefined,
        {
          requestPolicy: "network-only",
        },
      )
      .toPromise()
      .then((result) => {
        if (result && result.data) {
          setVerticalMetricsQuarterRangeResult(result.data.verticalMetricsQuarterRange);
        }
      });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    if (!verticalMetricsQuarterRangeResult) return;
    const minQuarter = verticalMetricsQuarterRangeResult.min;
    const maxQuarter = verticalMetricsQuarterRangeResult.max;

    for (let i = maxQuarter.year; i >= minQuarter.year; i--) {
      let newQuarterItems = getNavigationItemProps(QuarterSequence.Four);
      if (i === maxQuarter.year) {
        newQuarterItems = getNavigationItemProps(maxQuarter.quarter);
      }
      setNavigationItems((prev) => {
        const newNavigationItems = cloneDeep(prev);
        newNavigationItems.push({
          type: "collapse",
          name: i.toString(),
          data: i,
          childrenProps: newQuarterItems,
        });
        return newNavigationItems;
      });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [verticalMetricsQuarterRangeResult]);

  const sections: SectionProps[] = [
    {
      title: "综合排名",
      tip: `按照当前${quarter !== QuarterSequence.Annual ? "季度" : "年度"}，五个维度综合算分排名。`,
      metricsID: MetricsIDs.RankingScore,
      chartComponent: <RankingScoreChart />,
    },
    {
      title: "最受 Top 投资机构青睐",
      tip: `按照当前${
        quarter !== QuarterSequence.Annual ? "季度" : "年度"
      }，该赛道头部投资机构投资数量超出预期的量算分排名。`,
      metricsID: MetricsIDs.InvestorCount,
      chartComponent: <InvestorCountChart />,
    },
    {
      title: "交易事件远超预期",
      tip: `按照当前${quarter !== QuarterSequence.Annual ? "季度" : "年度"}，该赛道交易数量超出预期的量算分排名。`,
      metricsID: MetricsIDs.DealCount,
      chartComponent: <DealCountChart />,
    },
    {
      title: "交易事件连续增长",
      tip: `交易事件数量增幅连续增长${quarter !== QuarterSequence.Annual ? "两个季度" : "一个年度"}以上，按照截止当前${
        quarter !== QuarterSequence.Annual ? "季度" : "年度"
      }，该赛道累计增幅及连增次数综合算分排名。`,
      metricsID: MetricsIDs.DealCountIncrement,
      chartComponent: <DealCountIncrementChart />,
    },
    {
      title: "企业数量连续增长",
      tip: `企业数量增幅连续增长${quarter !== QuarterSequence.Annual ? "两个季度" : "一个年度"}以上，按照截止当前${
        quarter !== QuarterSequence.Annual ? "季度" : "年度"
      }，该赛道累计增幅及连增次数综合算分排名。`,
      metricsID: MetricsIDs.CompanyCountIncrement,
      chartComponent: <CompanyCountIncrementChart />,
    },
    {
      title: "平均融资间隔最短",
      tip: `按照当前${quarter !== QuarterSequence.Annual ? "季度" : "年度"}，该赛道企业融资的平均速度算分排名。`,
      metricsID: MetricsIDs.DealInterval,
      chartComponent: <DealIntervalChart />,
    },
  ];

  return (
    <div className={classes.outermostBox}>
      <div className={classes.root}>
        <div className={classes.navigationBox}>
          {navigationItems.length > 0 && (
            <Navigation
              title="风口赛道"
              items={navigationItems}
              onChange={(i, data): void => {
                setYear(data as number);
                setQuarter(QuarterSequence.Annual);
              }}
              classes={{
                item: classes.navigationItem,
                pseudo: classes.navigationPseudo,
              }}
            />
          )}
        </div>
        <div className={classes.contentBox}>
          <StickyToolbar
            className={classes.toolbar}
            classes={{ title: classes.title }}
            title={`${year} ${quarterName}`}
            hasAppbar
            contentWidth={1144}
          />
          {/* <Typography className={classes.title}>{year}</Typography> */}
          <div className={classes.sectionBox}>
            {sections.map((v, i) => {
              return <Section key={i} {...v} className={classes.section} />;
            })}
          </div>
        </div>
      </div>
    </div>
  );
};

const VerticalDetection: React.FunctionComponent<{}> = () => {
  return (
    <DetectionContainer.Provider>
      <Head>
        <title>风口赛道 | RimeData</title>
      </Head>
      <DetectionDisplay />
    </DetectionContainer.Provider>
  );
};

export default VerticalDetection;
