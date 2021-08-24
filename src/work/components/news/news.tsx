import { makeStyles } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import { enableMapSet } from "immer";
import { useRouter } from "next/dist/client/router";
import Head from "next/head";
import React, { FunctionComponent } from "react";
import AppContainer, { FixedTopStyleProps } from "../../containers/appContainer";
import UserContainer from "../../containers/userContainer";
import { Role } from "../../generated/graphql";
import { getTitle, NewsType } from "../../models/news/news";
import BackTopFab from "../common/back-top-fab/back-top-fab";
import Navigation from "../common/navigation/navigation";
import { NavigationItemProps } from "../common/navigation/navigation-item";
import { NavigationSectionProps } from "../common/navigation/navigation-subtitle";
import NewsContent from "./components/news-content/news-content";
import Toolbar from "./components/toolbar/toolbar";
import NewsContainer, { NewsEntityProps } from "./newsContainer";

enableMapSet();

export const useStyles = makeStyles({
  root: {
    display: "grid",
    gridAutoFlow: "column",
    gridTemplateColumns: "minmax(max-content, 1fr) minmax(1124px, 5fr)",
    alignItems: "end",
    gridColumnGap: 40,
  },
  navigationBox: {
    marginTop: 24,
    marginLeft: 24,
    justifySelf: "end",
    alignSelf: "start",
    position: "sticky",
    top: ({ fixedTopHeight }: FixedTopStyleProps): number => fixedTopHeight + 24,
  },
  pageRight: {
    alignSelf: "start",
  },
  content: {
    display: "grid",
    gridColumnGap: 40,
    gridAutoFlow: "column",
    gridTemplateColumns: "min-content minmax(352px, 1fr)",
    alignSelf: "start",
    alignItems: "end",
    paddingTop: 8,
  },
  newsContent: {
    alignSelf: "start",
    paddingLeft: 4,
  },
  rightSectionBox: {
    minHeight: `calc(100vh - 192px)`,
  },
  stickyPosition: {
    position: "sticky",
    bottom: 0,
  },
});

const NewsNavConfig: (NavigationItemProps | NavigationSectionProps)[] = [
  { type: "item", name: "全市场动态", data: NewsType.All },
  { type: "item", name: "我的机构", data: NewsType.MyInstitution },
];

const Wrapper: FunctionComponent<NewsProps> = () => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const { user } = UserContainer.useContainer();
  const classes = useStyles({ fixedTopHeight });
  const router = useRouter();
  const muse = useClient();
  const { setNewsType, newsType } = NewsContainer.useContainer();
  const disableInstitution = user && (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium);

  NewsNavConfig.forEach((newsItem) => {
    const item = newsItem as NavigationItemProps;
    if (disableInstitution && item.data == NewsType.MyInstitution) {
      item.disable = true;
    }
  });

  function onNavigationChange(_: number, data: unknown): void {
    setNewsType(data as NewsType);

    if (data) {
      muse.sendTrackingEvent("news.tab_change", {
        tab: data as string,
      });
    }

    router.push("/news/[newsType]", `/news/${data}`);
  }

  const title = getTitle(newsType);

  return (
    <div className={classes.root}>
      <div className={classes.navigationBox}>
        <Navigation
          title="新闻"
          isRouter={true}
          items={NewsNavConfig}
          activeRoute={newsType}
          onChange={onNavigationChange}
        />
      </div>
      <div className={classes.pageRight}>
        <Toolbar showSearch={newsType === NewsType.All} title={title} />
        <div className={classes.newsContent}>
          <NewsContent newsType={newsType as NewsType} />
        </div>
      </div>
      <BackTopFab />
    </div>
  );
};

interface NewsProps {
  newsType: NewsType;
  suggestion?: NewsEntityProps;
  group?: {
    id: string;
    name: string;
  };
}

const News: FunctionComponent<NewsProps> = ({ group, suggestion, newsType, ...props }) => {
  return (
    <>
      <Head>
        <title>新闻 | RimeData</title>
      </Head>
      <NewsContainer.Provider
        initialState={{ newsType, group, entities: suggestion?.id ? [suggestion as NewsEntityProps] : [] }}
      >
        <Wrapper {...props} group={group} newsType={newsType} />
      </NewsContainer.Provider>
    </>
  );
};

export default News;
