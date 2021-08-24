import { Box, CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import nanoid from "nanoid";
import React, { useEffect, useState } from "react";
import {
  NextPlatform,
  QuickSearchEntityNode,
  useQuickSearchLatestViewQuery,
  useQuickSearchTrendingQuery,
} from "../../../../../../generated/graphql";
import CommonAccordionPlaceholder from "../../../../../common/accordion/components/placeholder";
import { EntityLayout } from "./search-display/result-list/result-item";
import TabPanel from "./tab/tab-panel";
import Tabs from "./tab/tabs";

const useStyles = makeStyles(() =>
  createStyles({
    loading: {
      height: 500,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    bottom: {
      textAlign: "center",
      paddingTop: 16,
      color: "#666",
      height: 50,
      display: "flex",
    },
    result: {
      width: "100%",
      padding: "0px 24px",
      overflowY: "scroll",
      overflowX: "hidden",
      height: "100%",
      "&:hover": {
        overflowY: "scroll",
      },
      "&::-webkit-scrollbar": {
        height: 5,
        width: 5,
      },
      "&::-webkit-scrollbar-thumb": {
        borderRadius: 2.5,
        backgroundColor: "rgba(0, 0, 0, 0.2)",
      },
    },
  }),
);

const DefaultDisplay: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const [currentTabId, setCurrentTabId] = useState<string>("0");
  const tabs: string[] = ["大家都在看", "最近浏览"];
  const [trendingQueryFetching, setTrendingQueryFetching] = useState<boolean>(true);
  const [latestVisitQueryFetching, setLatestVisitQueryFetching] = useState<boolean>(true);
  const [trendingQueryResult, executeTrendingQueryResult] = useQuickSearchTrendingQuery({
    pause: true,
    variables: {
      first: 10,
      platform: NextPlatform.PlatformWeb,
    },
    requestPolicy: "network-only",
  });

  const [latestVisitQueryResult, executeLatestVisitQueryResult] = useQuickSearchLatestViewQuery({
    pause: true,
    variables: {
      first: 10,
      platform: NextPlatform.PlatformWeb,
    },
    requestPolicy: "network-only",
  });

  const [trendingResults, setTrendingResults] = useState<QuickSearchEntityNode[]>();
  const [latestVisitResults, setLatestVisitResults] = useState<QuickSearchEntityNode[]>();

  const handleTabChange = (newValue: string): void | Promise<void> => setCurrentTabId(newValue);

  useEffect(() => {
    setTimeout(function () {
      executeTrendingQueryResult();
      executeLatestVisitQueryResult();
    }, 200);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    setTrendingQueryFetching(trendingQueryResult.fetching);
    if (!trendingQueryResult.fetching) {
      if (!trendingQueryResult || !trendingQueryResult.data) {
        return;
      }
      const nodes: QuickSearchEntityNode[] = _.get(trendingQueryResult, ["data", "quickSearchTrending", "nodes"]);
      setTrendingResults(nodes);
    }
  }, [trendingQueryResult]);

  useEffect(() => {
    setLatestVisitQueryFetching(latestVisitQueryResult.fetching);
    if (!latestVisitQueryResult.fetching) {
      if (!latestVisitQueryResult || !latestVisitQueryResult.data) {
        return;
      }
      const nodes: QuickSearchEntityNode[] = _.get(latestVisitQueryResult, ["data", "quickSearchLatestView", "nodes"]);
      setLatestVisitResults(nodes);
    }
  }, [latestVisitQueryResult]);

  function resultList(results: QuickSearchEntityNode[] | undefined, tabId: string, fetching: boolean): React.ReactNode {
    if (fetching || results === undefined) {
      return (
        <Box className={classes.result} hidden={tabId !== currentTabId}>
          <Box className={classes.loading}>
            <CircularProgress color="primary" thickness={2.8} size={30} />
          </Box>
        </Box>
      );
    }

    return (
      <TabPanel tabId={tabId} key={nanoid(8)}>
        {results && results.length > 0 ? (
          results.map((v) => (
            <EntityLayout
              key={nanoid(8)}
              nodeId={v.nodeId}
              searchType={v.searchType}
              logoURI={v.logoURI}
              title={v.title}
              subtitle={v.subtitle}
              description={v.description}
              tags={v.tags}
              action={v.action}
            />
          ))
        ) : (
          <CommonAccordionPlaceholder />
        )}
        {results && results.length > 0 ? <div className={classes.bottom}>滑到底啦！</div> : null}
      </TabPanel>
    );
  }
  return (
    <Tabs tabTitle={tabs} onChange={handleTabChange}>
      {resultList(trendingResults, "0", trendingQueryFetching)}
      {resultList(latestVisitResults, "1", latestVisitQueryFetching)}
    </Tabs>
  );
};

export default DefaultDisplay;
