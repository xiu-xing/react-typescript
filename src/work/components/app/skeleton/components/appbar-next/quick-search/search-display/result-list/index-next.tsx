import { Box, CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { format, formatDistanceStrict, fromUnixTime } from "date-fns";
import { zhCN } from "date-fns/locale";
import { get, result, unionWith } from "lodash";
import React, { ReactNode, useCallback, useEffect, useMemo, useRef, useState } from "react";
import { useClient } from "urql";
import {
  PaginationPermission,
  QuickSearchDocument,
  QuickSearchNode,
  QuickSearchQuery,
  QuickSearchQueryVariables,
} from "../../../../../../../../generated/graphql";
import { inDay } from "../../../../../../../../utils/date";
import { getFrequencyLimit, getLockLimit, getPaginationLimit } from "../../../../../../../../utils/permission";
import { useCurrentTabId, useKeyword } from "../../../atom";
import NoData from "./nodata";
import { AccessControlPlaceholder } from "./permission";
import { EntityLayout, InfoLayout } from "./result-item";

const useStyles = makeStyles(() =>
  createStyles({
    ac: {
      height: "100%",
      display: "flex",
    },
    root: {
      width: "100%",
      padding: "0px 24px",
      overflowY: "scroll",
      overflowX: "hidden",
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
    placeholder: {
      height: "500px",
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
    bottom: {
      minHeight: 100,
      display: "grid",
      placeItems: "center",
      padding: 16,
    },
    container: {
      width: "100%",
      height: "calc(100vh - 144px)",
    },
    content: {
      display: "flex",
      height: "100%",
      flexDirection: "column",
      alignItems: "center",
      padding: "16px 0px 0px",
    },
    bottomText: {
      textAlign: "center",
      paddingTop: 16,
      color: "#666",
      height: 50,
      display: "flex",
    },
  }),
);

interface ResultListProps {
  searchType: string;
  hasLocked?: boolean;
  index?: string;
}

const ResultList: React.FunctionComponent<ResultListProps> = (props) => {
  const classes = useStyles();
  const { index, searchType, hasLocked } = props;
  const [keyword] = useKeyword();
  const [cachedKeyword, setCachedKeyword] = useState<string>();
  const [currentTabId] = useCurrentTabId();
  const rootRef = useRef<HTMLDivElement | null>(null);
  const client = useClient();
  const [fetching, setFetching] = useState<boolean>(true);
  const [after, setAfter] = useState<string>();
  const [hasNextPage, setHasNextPage] = useState<boolean>(false);
  const [paginationPermission, setPaginationPermission] = useState<PaginationPermission>();
  const [locked, setLocked] = useState(false);
  const [results, setResults] = useState<QuickSearchNode[]>([]);
  const [loadMoreTrigger, setLoadMoreTrigger] = useState(0);
  const [showFeedbackPlaceholder, setShowFeedbackPlaceholder] = useState(false);

  const scrollHandle = useCallback(() => {
    if (!rootRef.current) return;

    if (
      rootRef.current.scrollTop + rootRef.current.clientHeight > rootRef?.current?.scrollHeight * 0.95 &&
      hasNextPage &&
      !locked &&
      results.length < 50
    ) {
      setLoadMoreTrigger((prev) => prev + 1);
    }
  }, [setLoadMoreTrigger, hasNextPage, locked, results]);

  const quickSearchQuery = useCallback(
    (keyword: string, after?: string) => {
      setFetching(true);
      return client
        .query<QuickSearchQuery, QuickSearchQueryVariables>(QuickSearchDocument, {
          first: 25,
          query: keyword,
          searchType: searchType,
          after: after,
        })
        .toPromise();
    },
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [searchType, setFetching],
  );

  function switchLayout(node: QuickSearchNode): ReactNode {
    switch (node.__typename) {
      case "QuickSearchInfoFlowNode": {
        return (
          <InfoLayout
            key={node.nodeId}
            title={node.title}
            subtitle={node.description}
            tags={node.tags ?? []}
            imageURI={node.imageURI}
            highlightTexts={node.highlightTexts}
            footnote={
              node.publishTime
                ? inDay(node.publishTime)
                  ? formatDistanceStrict(fromUnixTime(node.publishTime), Date.now(), {
                      locale: zhCN,
                      addSuffix: true,
                    })
                  : format(fromUnixTime(node.publishTime), "yyyy-MM-dd")
                : void 0
            }
            action={node.action}
          />
        );
      }
      case "QuickSearchEntityNode": {
        return (
          <EntityLayout
            key={node.nodeId}
            nodeId={node.nodeId}
            searchType={searchType}
            logoURI={node.logoURI}
            title={node.title}
            subtitle={node.subtitle}
            description={node.description}
            highlightTexts={node.highlightTexts}
            tags={node.tags ?? []}
            action={node.action}
          />
        );
      }
      default:
        break;
    }
  }

  useEffect(() => {
    if (currentTabId === index) setCachedKeyword(keyword);
  }, [currentTabId, keyword, index]);

  useEffect(() => {
    if (currentTabId !== index) {
      setResults([]);
      setCachedKeyword("");
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [keyword]);

  // 关键词修改
  useEffect(() => {
    setResults([]);
    if (hasLocked) return;

    currentTabId === index &&
      cachedKeyword &&
      cachedKeyword.length > 1 &&
      quickSearchQuery(cachedKeyword)
        .then((res) => {
          const nodes = get(res, ["data", "quickSearch", "nodes"]) ?? [];
          const p = get(res, ["data", "quickSearch", "permissions"]) ?? [];
          const a = get(res, ["data", "quickSearch", "pageInfo", "endCursor"]);
          const n = get(res, ["data", "quickSearch", "pageInfo", "hasNextPage"]);
          const l = getPaginationLimit(p)?.lockNextPage || getLockLimit(p) || getFrequencyLimit(p);
          if (nodes.length === 0) {
            setShowFeedbackPlaceholder(true);
          } else {
            setShowFeedbackPlaceholder(false);
          }
          setResults(nodes);
          setPaginationPermission(getPaginationLimit(p));
          setLocked(l ?? false);
          setAfter(a);
          setHasNextPage(n);
        })
        .finally(() => setFetching(false));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [cachedKeyword]);

  // 加载更多
  useEffect(() => {
    if (hasLocked) return;
    if (loadMoreTrigger == 0) {
      return;
    }
    if (fetching) return;

    cachedKeyword &&
      cachedKeyword.length > 1 &&
      quickSearchQuery(cachedKeyword, after)
        .then((res) => {
          const nodes = get(res, ["data", "quickSearch", "nodes"]) ?? [];
          const p = get(res, ["data", "quickSearch", "permissions"]) ?? [];
          const a = get(res, ["data", "quickSearch", "pageInfo", "endCursor"]);
          const n = get(res, ["data", "quickSearch", "pageInfo", "hasNextPage"]);
          const l = getPaginationLimit(p)?.lockNextPage || getLockLimit(p) || getFrequencyLimit(p);
          setResults((prev) => unionWith(prev, nodes, (a, b) => a.nodeId === b.nodeId));
          setPaginationPermission(getPaginationLimit(p));
          setLocked(l ?? false);
          setAfter(a);
          setHasNextPage(n);
        })
        .finally(() => setFetching(false));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [loadMoreTrigger]);

  const bottom = useMemo(() => {
    if (fetching) {
      return <CircularProgress color="primary" thickness={2.8} size={30} />;
    }

    if (paginationPermission?.lockNextPage) {
      return <AccessControlPlaceholder />;
    }

    if ((results.length > 0 && !hasNextPage) || results.length >= 50) {
      return <div className={classes.bottomText}>滑到底啦！</div>;
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [fetching, paginationPermission, results, hasNextPage]);

  function contentComponent() {
    if (fetching && result.length === 0) {
      return <CircularProgress color="primary" thickness={2.8} size={30} />;
    }

    if (cachedKeyword?.length === 1) {
      return (
        <div className={classes.placeholder}>
          <NoData tip="请至少输入 2 个关键字进行检索！" />
        </div>
      );
    }

    if (hasLocked || locked) {
      return (
        <Box className={classes.ac}>
          <AccessControlPlaceholder />
        </Box>
      );
    }

    return (
      <>
        {results.length > 0 && results.map((r) => switchLayout(r))}
        {showFeedbackPlaceholder && (
          <div className={classes.placeholder}>
            <NoData variant="feedback" />
          </div>
        )}
        <div className={classes.bottom}>{bottom}</div>
      </>
    );
  }

  return (
    <div hidden={currentTabId !== index} className={classes.root} ref={rootRef} onScroll={scrollHandle}>
      <Box className={classes.container}>
        <Box className={classes.content}>{contentComponent()}</Box>
      </Box>
    </div>
  );
};

export default ResultList;
