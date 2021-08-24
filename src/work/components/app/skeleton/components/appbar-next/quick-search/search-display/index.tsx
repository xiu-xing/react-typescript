import { CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles, Theme, withStyles } from "@material-ui/core/styles";
import MuiTab from "@material-ui/core/Tab";
import { TabContext, TabList } from "@material-ui/lab";
import _ from "lodash";
import Lock from "mdi-material-ui/Lock";
import React, { ReactNode, useEffect, useMemo, useState } from "react";
import { useClient } from "urql";
import {
  QuickSearchTab,
  QuickSearchTotalCountDocument,
  QuickSearchTotalCountQuery,
  QuickSearchTotalCountQueryVariables,
  useQuickSearchTabsQuery,
} from "../../../../../../../generated/graphql";
import { useCurrentTabId, useKeyword } from "../../atom";
import ResultList from "./result-list/index-next";

const StyledTabList = withStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "sticky",
      maxWidth: 1316,
      width: "100%",
      zIndex: 999,
      top: 0,
      borderBottom: "1px solid #EEE",
      background: "white",
      paddingTop: "24px",
      // paddingLeft: "16px",
      minHeight: 40,
      "& .MuiTabs-flexContainer": {
        "& button:not(:last-child)": {
          marginRight: 32,
        },
      },
    },
    indicator: {
      height: 3,
      backgroundColor: theme.palette.primary.main,
    },
  }),
)(TabList);

const StyledTab = withStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "relative",
      minWidth: 70,
      minHeight: 40,
      padding: "10px 4px",
      lineHeight: 1.72,
      textTransform: "none",
      overflow: "visible",
    },
    textColorInherit: {
      color: "#999",
      opacity: 1,
    },
    selected: {
      color: theme.palette.primary.main,
    },
  }),
)(MuiTab);

const useStyles = makeStyles(() =>
  createStyles({
    tabList: {
      width: "100%",
      justifyContent: "center",
      padding: "0px 24px",
      display: "flex",
    },
    innerContainer: {
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
    },
    root: {
      display: "inline-flex",
      alignItems: "center",
    },
    lock: {
      fontSize: 14,
      marginLeft: 2,
      color: "#CCCCCC",
      zIndex: 1,
    },
    loading: {
      height: 500,
      display: "flex",
      alignItems: "center",
    },
  }),
);

const SearchDisplay: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const [keyword] = useKeyword();
  const [currentTabId, setCurrentTabId] = useCurrentTabId();
  const [tabs, setTabs] = useState<QuickSearchTab[]>([]);
  const [tableCountMap, setTableCountMap] = useState<{ [key: string]: number | undefined }>({});
  const client = useClient();
  const [{ data, fetching }] = useQuickSearchTabsQuery();

  function getTotalCount(): void {
    for (const tab of tabs) {
      (async function () {
        await client
          .query<QuickSearchTotalCountQuery, QuickSearchTotalCountQueryVariables>(QuickSearchTotalCountDocument, {
            query: keyword,
            searchType: tab.searchType,
          })
          .toPromise()
          .then((result) => {
            setTableCountMap((value) => ({ ...value, [tab.searchType]: result.data?.quickSearch.totalCount }));
          });
      })();
    }
  }

  function emptyTotalCount(): void {
    for (const tab of tabs) {
      setTableCountMap((value) => ({ ...value, [tab.searchType]: undefined }));
    }
  }

  const handleTabChange = (event: React.ChangeEvent<{}>, newValue: string): void | Promise<void> =>
    setCurrentTabId(newValue);

  useEffect(() => {
    if (!data) return;
    const result: QuickSearchTab[] = _.get(data, ["quickSearchTabs"]);
    setTabs(result);
  }, [data]);

  useEffect(() => {
    if (tabs.length <= 0) return;
    if (keyword.length < 2) {
      emptyTotalCount();
      return;
    }
    getTotalCount();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [keyword, tabs]);

  function tabLabel(title: string, totalCount: number | undefined, locked: boolean): ReactNode {
    let count = "";
    if (totalCount) {
      count = totalCount.toString();
    }
    if (totalCount && totalCount >= 100) {
      count = "99+";
    }
    return (
      <span className={classes.root}>
        {title + " " + count}
        {locked ? <Lock className={classes.lock} /> : null}
      </span>
    );
  }

  const tabsContent = useMemo(() => {
    return (
      <>
        {tabs.map((tab, i) => {
          return (
            <ResultList
              key={tab.searchType}
              searchType={tab.searchType}
              hasLocked={tab.lockPermission.locked}
              index={i.toString()}
            />
          );
        })}
      </>
    );
  }, [tabs]);

  return (
    <div className={classes.innerContainer}>
      {fetching ? (
        <div className={classes.loading}>
          <CircularProgress color="primary" thickness={2.8} size={30} />
        </div>
      ) : (
        <TabContext value={currentTabId ?? "0"}>
          <div className={classes.tabList}>
            <StyledTabList onChange={handleTabChange} scrollButtons="on" variant="scrollable">
              {tabs.map((tab, i) => (
                <StyledTab
                  key={tab.searchType + i}
                  value={i.toString()}
                  label={tabLabel(tab.title, tableCountMap[tab.searchType], tab.lockPermission.locked)}
                />
              ))}
            </StyledTabList>
          </div>
          {tabsContent}
        </TabContext>
      )}
    </div>
  );
};

export default SearchDisplay;
