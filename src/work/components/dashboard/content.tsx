import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import Head from "next/head";
import React from "react";
import UserContainer from "../../containers/userContainer";
import { Role } from "../../generated/graphql";
import Toolbar from "../common/toolbar/toolbar";
import ToolbarPlaceholder from "../common/toolbar/toolbar-placeholder";
import EventsDeal from "./components/accordions/events-deal";
import EventsExit from "./components/accordions/events-exit";
import NewsAll from "./components/accordions/news-all";
import NewsOrganization from "./components/accordions/news-organization";
import RisksOrganization from "./components/accordions/risks-organization";
import StatisticSection from "./components/statistic/statistic-section";
import TabsSection from "./components/tabs-section";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "grid",
      justifyContent: "center",
      alignItems: "end",
      gridTemplateColumns: "874px 520px",
      gridColumnGap: 60,
      padding: 16,
      minWidth: 1480,
    },
    sectionList: {
      alignSelf: "start",
      display: "grid",
      gridAutoFlow: "row",
      gridRowGap: 40,
      gridTemplateRows: "repeat(4, min-content)",
    },
    gadgetBox: {
      marginTop: 24,

      position: "sticky",
      bottom: 16,
      minHeight: "calc(100vh - 152px)",
    },
    adsBox: {
      lineHeight: 0,
      marginBottom: 16,
    },
    accordionImage: {
      width: "100%",
      height: "100%",
      color: "rgba(0, 0, 0, 0.6)",
    },
    adsImg: {
      width: "calc(100% + 4px)",
      marginLeft: -2,
      cursor: "pointer",
    },
  }),
);

const newsTabs = ["全市场动态", "我的机构"];
const risksTabs = ["我的机构"];

const DashboardContent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const { user } = UserContainer.useContainer();
  const muse = useClient();

  let disableNewsItemIndex = -1;
  let disableRisksItemIndex = -1;

  newsTabs.forEach((tab, index) => {
    if (
      user &&
      user.role &&
      (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) &&
      tab == "我的机构"
    ) {
      disableNewsItemIndex = index;
    }
  });

  risksTabs.forEach((tab, index) => {
    if (
      user &&
      user.role &&
      (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) &&
      tab == "我的机构"
    ) {
      disableRisksItemIndex = index;
    }
  });

  return (
    <>
      <Head>
        <title>看板 | RimeData</title>
      </Head>
      <Toolbar title="看板" />
      <ToolbarPlaceholder />
      <div className={classes.root}>
        <div className={classes.sectionList}>
          <StatisticSection />
          <TabsSection
            title="新闻"
            tabs={newsTabs}
            disableItemIndex={disableNewsItemIndex}
            defaultActiveIndex={disableNewsItemIndex == 0 ? 1 : 0}
          >
            <NewsAll />
            <NewsOrganization />
          </TabsSection>
          {/* <VerticalRecommendatioinContainer.Provider initialState={{ tagId: TagId.Vertical }}>
              <TabsSection title="推荐" tabs={recommendationTabs}>
                <RecommendationProject />
                <RecommendationLP />
              </TabsSection>
            </VerticalRecommendatioinContainer.Provider> */}
          <TabsSection
            title="风险"
            tabs={risksTabs}
            disableItemIndex={disableRisksItemIndex}
            defaultActiveIndex={disableRisksItemIndex == 0 ? 1 : 0}
          >
            <RisksOrganization />
          </TabsSection>
        </div>
        <div className={classes.gadgetBox}>
          <EventsDeal />
          <EventsExit />
          {/* <SearchTemplates /> */}
        </div>
      </div>
    </>
  );
};

export default DashboardContent;
