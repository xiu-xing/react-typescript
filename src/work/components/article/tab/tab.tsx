import { Button, CircularProgress, Fab, Fade, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import { ChevronUp, CloseCircleOutline } from "mdi-material-ui";
import { OverlayScrollbarsComponent } from "overlayscrollbars-react";
import React, { ReactNode, useCallback, useEffect, useRef, useState } from "react";
import { useClient } from "urql";
import {
  ArticleListDocument,
  ArticleListNode,
  ArticleListQuery,
  ArticleListQueryVariables,
  ArticleTab as ArticleTabModel,
  ArticleType,
  Filter,
  FilterInputs,
  PageInfo,
  Permission,
  RealmSuggestion,
} from "../../../generated/graphql";
import { useFilterConditionInputs } from "../../../utils/hooks";
import { getPaginationLimit } from "../../../utils/permission";
import { APPBAR_HEIGHT } from "../../app/skeleton/components/appbar-next";
import FilterConditionItem from "../../common/filter-condition";
import FilterConditionContext, {
  FilterConditionInputType,
  hasConditionActive,
  transcodeFilterConditionInputs,
} from "../../common/filter-condition-context";
import FilterResult from "../../common/filter-result/filter-result";
import PermissionComponent from "../../common/permission-component";
import ACPlaceholder from "../../common/section/ac-placeholder";
import Space from "../../common/space";
import ArticleContainer from "../container";
import DiagramList from "../diagram/list";
import ArticleLimitedDialog from "../dialog/limited-dialog";
import ReportList from "../report/list";
import { ArticleModuleId } from "../types";

const TITLE_HEIGHT = 54;

const useStyles = makeStyles(() =>
  createStyles({
    root: (props) => ({
      maxHeight: `calc(100vh - ${APPBAR_HEIGHT + props["top"] ?? 0}px)`,
      overflowY: "auto",
      paddingLeft: 24,
      paddingRight: 24,
      "& .os-padding": {
        zIndex: "auto",
      },
    }),
    container: {
      margin: "auto",
      maxWidth: 1300,
    },
    titleBox: {
      padding: "0 24px",
    },
    title: {
      height: TITLE_HEIGHT,
      fontSize: 20,
      color: "#333",
      fontWeight: 500,
      position: "sticky",
      top: 0,
      padding: "24px 16px 0",
      margin: "auto",
      maxWidth: 1300,
    },
    filters: {
      position: "sticky",
      top: 0,
      paddingLeft: 16,
      paddingTop: 16,
      paddingBottom: 8,
      maxWidth: 1300,
      margin: "auto",
      background: "white",
      zIndex: 1,
    },
    button: {
      whiteSpace: "pre",
    },
    list: {},
    totalCount: {
      fontSize: 14,
      color: "#666",
      textAlign: "center",
      marginTop: 16,
      paddingLeft: 16,
    },
    bottom: {
      textAlign: "center",
      padding: 16,
      color: "#666",
      minHeight: 64,
      position: "relative",
    },
    backToTop: {
      position: "fixed",
      right: 36,
      bottom: 36,
    },
    suggestion: {
      width: 336,
    },
  }),
);

interface ArticleTabProps {
  tab: ArticleTabModel;
  articleModuleId: ArticleModuleId;
}

const ArticleTab: React.FunctionComponent<ArticleTabProps> = (props) => {
  const classes = useStyles({ top: TITLE_HEIGHT });

  const { tab, articleModuleId } = props;

  const [filterInputs, setFilterInputs] = useFilterConditionInputs(tab?.filters as Filter[], true);
  const rootRef = useRef<OverlayScrollbarsComponent | null>(null);
  const [permissions, setPermissions] = useState<Permission[]>([]);
  const [showBackToTop, setShowBackToTop] = useState<boolean>(false);
  const [fetching, setFetching] = useState(false);
  const [pageIndex, setPageIndex] = useState(0);
  const [pageInfo, setPageInfo] = useState<Pick<PageInfo, "hasNextPage" | "endCursor">>({
    hasNextPage: true,
  });
  const [list, setList] = useState<ArticleListNode[]>();
  const [showTotalCount, setShowTotalCount] = useState(false);
  const [totalCount, setTotalCount] = useState(0);
  const client = useClient();
  const container = ArticleContainer.useContainer();

  const fetchData = useCallback(
    async (articleModuleId: string, articleListId: string, filters?: FilterInputs, after?: string) => {
      const res = await client
        .query<ArticleListQuery, ArticleListQueryVariables>(ArticleListDocument, {
          articleModuleID: articleModuleId,
          articleListID: articleListId,
          filters: filters,
          first: 20,
          after: after,
        })
        .toPromise();

      return res;
    },
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [tab],
  );

  const handleScroll = () => {
    setShowTotalCount(false);
    const isTop = rootRef.current?.osInstance()?.scroll()?.ratio?.y !== 0;
    setShowBackToTop(isTop);
    if (rootRef.current?.osInstance()?.scroll()?.ratio?.y === 1 && !getPaginationLimit(permissions)) {
      setPageIndex((prev) => prev + 1);
    }
  };

  function setSelectedValues(filter: Filter): string[] | RealmSuggestion[] {
    if (filter.__typename == "SelectorFilter") {
      if (filter.multiple) {
        const input = filterInputs.multiSelectors?.find((o) => o?.filterID == filter.id);
        if (!input) {
          return [];
        }
        return input.filterValues.map((v) => v.value);
      } else {
        const input = filterInputs.selectors?.find((o) => o?.filterID == filter.id);
        if (!input || !input.filterValue) {
          return [];
        }
        return [input.filterValue.value];
      }
    }
    if (filter.__typename == "SuggestionFilter") {
      const input = filterInputs.suggestion?.find((o) => o?.filterID == filter.id);
      if (!input) {
        return [];
      }
      return input.filterValues;
    }
    return [];
  }

  useEffect(() => {
    setFetching(true);
    fetchData(
      articleModuleId,
      tab.articleListID,
      transcodeFilterConditionInputs(filterInputs),
      pageInfo.endCursor as string,
    )
      .then((res) => {
        const nodes: ArticleListNode[] = _.get(res, ["data", "articleList", "nodes"]);
        const page: PageInfo = _.get(res, ["data", "articleList", "pageInfo"]);
        const permissions: Permission[] = _.get(res, ["data", "articleList", "permissions"]);
        setPermissions(permissions);
        setList((prev) => _.unionWith(prev, nodes, (a: ArticleListNode, b: ArticleListNode) => a.data === b.data));
        setPageInfo({
          hasNextPage: page?.hasNextPage,
          endCursor: page?.endCursor,
        });
      })
      .finally(() => setFetching(false));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pageIndex]);

  useEffect(() => {
    setFetching(true);
    rootRef.current?.osInstance()?.scroll(0);
    fetchData(articleModuleId, tab.articleListID, transcodeFilterConditionInputs(filterInputs))
      .then((res) => {
        const totalCount: number = _.get(res, ["data", "articleList", "totalCount"]);
        setTotalCount(totalCount);
        setShowTotalCount(true);
        const nodes: ArticleListNode[] = _.get(res, ["data", "articleList", "nodes"]);
        const page: PageInfo = _.get(res, ["data", "articleList", "pageInfo"]);
        const permissions: Permission[] = _.get(res, ["data", "articleList", "permissions"]);
        setPermissions(permissions);
        setList(nodes ?? []);
        setPageInfo({
          hasNextPage: page?.hasNextPage,
          endCursor: page?.endCursor,
        });
      })
      .finally(() => setFetching(false));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filterInputs]);

  function onFilterChange(filterInput: FilterConditionInputType): void {
    setFilterInputs(filterInput);
  }

  function renderList(): ReactNode {
    switch (tab.articleType) {
      case ArticleType.ArticleTypeResearchReport:
        return <ReportList list={list ?? []} />;
      case ArticleType.ArticleTypeResearchChart:
        return <DiagramList list={list ?? []} />;
      default:
        return null;
    }
  }

  return (
    <FilterConditionContext value={filterInputs}>
      <div className={classes.titleBox}>
        <Typography className={classes.title}>{tab.name}</Typography>
      </div>
      <OverlayScrollbarsComponent
        className={classes.root}
        ref={rootRef}
        options={{
          overflowBehavior: {
            y: "s",
            x: "h",
          },
          scrollbars: {
            autoHide: "scroll",
          },
          callbacks: {
            onScroll: handleScroll,
          },
        }}
      >
        <div className={classes.container}>
          {tab.filters && tab.filters.length > 0 && (
            <div className={classes.filters}>
              <Space wrap size="middle">
                {tab.filters.map((f, i) => (
                  <FilterConditionItem
                    key={f?.id ?? "" + i}
                    filter={f as Filter}
                    onChange={onFilterChange}
                    suggestionFilterProps={{
                      placeholder: "输入关键字",
                      showSearchIcon: true,
                      hideLogo: true,
                      solo: true,
                      className: classes.suggestion,
                      controller: true,
                      selectedValues: setSelectedValues(f as Filter) as RealmSuggestion[],
                    }}
                    selectorFilterProps={{
                      selectedValues: setSelectedValues(f as Filter) as string[],
                    }}
                  />
                ))}
                {hasConditionActive(filterInputs) && (
                  <Button
                    className={classes.button}
                    variant="outlined"
                    color="primary"
                    startIcon={<CloseCircleOutline />}
                    onClick={(): void => {
                      setFilterInputs(null);
                    }}
                  >
                    清除
                  </Button>
                )}
              </Space>
              <FilterResult filters={tab.filters as Filter[]} inputs={filterInputs} onFilterChange={onFilterChange} />
            </div>
          )}
          <div className={classes.list}>
            {/* {showTotalCount && <Typography className={classes.totalCount}>为您检索到 {totalCount} 条记录</Typography>} */}
            {renderList()}
          </div>
          <div className={classes.bottom}>
            {!!getPaginationLimit(permissions) && <ACPlaceholder />}
            {!getPaginationLimit(permissions) && fetching && <CircularProgress size={30} />}
            {!getPaginationLimit(permissions) &&
              !fetching &&
              list &&
              list?.length > 0 &&
              !pageInfo.hasNextPage &&
              "滑到底啦！"}
            {!getPaginationLimit(permissions) && !fetching && list && list.length == 0 && "暂无数据！"}
            <PermissionComponent permissions={permissions} />
          </div>
          <Fade in={showBackToTop}>
            <Fab
              className={classes.backToTop}
              color="primary"
              onClick={(): void => {
                rootRef.current?.osInstance()?.scroll({ y: 0 }, 200, { y: "linear" });
              }}
            >
              <ChevronUp />
            </Fab>
          </Fade>
        </div>
      </OverlayScrollbarsComponent>
      <ArticleLimitedDialog
        type="read"
        open={container.limitedDialogOpen}
        numberOfUsedCount={container.numberOfUsedCount}
        onClose={() => container.setLimitedDialogOpen(false)}
        numberOfUnusedCount={container.numberOfUnusedCount}
      />
    </FilterConditionContext>
  );
};

export default ArticleTab;
