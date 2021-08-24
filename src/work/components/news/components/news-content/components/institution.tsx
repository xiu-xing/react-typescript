import { makeStyles, Typography } from "@material-ui/core";
import clsx from "clsx";
import React, { useEffect, useState } from "react";
import { useBottomScrollListener } from "react-bottom-scroll-listener";
import LazyLoad from "react-lazyload";
import { useClient } from "urql";
import { useImmer } from "use-immer";
import UserContainer from "../../../../../containers/userContainer";
import {
  ChannelData,
  Role,
  TeamDailyChannelDataDocument,
  TeamDailyChannelDataQuery,
  TeamDailyChannelDataQueryVariables,
} from "../../../../../generated/graphql";
import { getTeamGroupCodes } from "../../../../../models/news/news";
import { parseError } from "../../../../../utils/error";
import { isAccessError } from "../../../../../utils/errorHandler";
import CommonAccordionPlaceholder from "../../../../common/accordion/components/placeholder";
import Loading from "../../../../common/loading/loading";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import NewsContainer from "../../../newsContainer";
import ListItemContent from "./list-item-content";

const useStyles = makeStyles({
  newsContainerBox: {
    display: "flex",
    justifyContent: "center",
    flexDirection: "column",
    minHeight: 50,
    width: "100%",
  },
  loading: {
    height: 230,
    width: "100%",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
  },
  noData: {
    height: 60,
    width: "100%",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    color: "#A6A6A6",
    fontWeight: 500,
  },
  loadingText: {
    display: "flex",
    justifyContent: "center",
    margin: 16,
  },
  tipText: {
    fontSize: 16,
    fontWeight: 500,
    color: "#A6A6A6",
    textAlign: "center",
  },
  loadingMoreText: {
    fontSize: 14,
    fontWeight: 400,
    cursor: "pointer",
  },
});

const Institution: React.FunctionComponent = () => {
  const classes = useStyles();
  const [after, setAfter] = useState<string | undefined | null>();
  const { tabID } = NewsContainer.useContainer();
  const [fetching, setFetching] = useState(true);
  const [hasNextPage, setHasNextPage] = useState(true);
  const [dataMap, setDataMap] = useImmer<Map<string, ChannelData[]>>(new Map());
  const [dateList, setDateList] = useState<string[]>([]);
  const { openSnackbar } = SnackbarContainer.useContainer();
  const { user, setTrailServiceDialogOpen, setInstitutionAuthenticationDialog, setActiveServiceDialogOpen } =
    UserContainer.useContainer();
  const client = useClient();

  function clearState(): void {
    window.scrollTo(0, 0);
    setAfter(undefined);
    setDataMap((_) => {
      return new Map();
    });
    setDateList([]);
  }

  function executeInstitutionQuery(tabID?: string, clear = false): void {
    setFetching(true);

    // 切换 Tab 状态s
    if (clear) {
      clearState();
    }

    client
      .query<TeamDailyChannelDataQuery, TeamDailyChannelDataQueryVariables>(TeamDailyChannelDataDocument, {
        first: 8,
        after: !clear ? after : undefined,
        dataID: "data_id_news",
        teamGroupCodes: getTeamGroupCodes(tabID),
      })
      .toPromise()
      .then(({ data, error }) => {
        const errorRes = parseError(error);
        if (isAccessError(errorRes.code)) {
          openSnackbar(errorRes.message, "error");
          if (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
            setInstitutionAuthenticationDialog(true);
            return;
          }
          if (user?.role == Role.Basic) {
            setTrailServiceDialogOpen(true);
            return;
          }
          if (user?.role == Role.Expired) {
            setActiveServiceDialogOpen(true);
            return;
          }
        }
        if (data?.teamDailyChannelData?.nodes && data.teamDailyChannelData.nodes.length > 0) {
          if (!clear) {
            data.teamDailyChannelData.nodes.map((node) => {
              setDataMap((draft) => {
                const channelDataList = draft.get(node.date);
                if (node) {
                  if (channelDataList) {
                    channelDataList?.push({
                      __typename: "ChannelData",
                      entityID: node.entityID,
                      entityName: node.entityName,
                      entityType: node.entityType,
                      jsonValue: node.jsonValue,
                      portraitURL: node.portraitURL,
                    });
                    return;
                  }

                  draft.set(node.date, [
                    {
                      __typename: "ChannelData",
                      entityID: node.entityID,
                      entityName: node.entityName,
                      entityType: node.entityType,
                      jsonValue: node.jsonValue,
                      portraitURL: node.portraitURL,
                    },
                  ]);
                }
              });
            });
          } else {
            const newDataMap = new Map() as Map<string, ChannelData[]>;
            data.teamDailyChannelData.nodes.map((node) => {
              const channelDataList = newDataMap.get(node.date);
              if (node) {
                if (channelDataList) {
                  channelDataList?.push({
                    __typename: "ChannelData",
                    entityID: node.entityID,
                    entityName: node.entityName,
                    entityType: node.entityType,
                    jsonValue: node.jsonValue,
                    portraitURL: node.portraitURL,
                  });
                  return;
                }

                newDataMap.set(node.date, [
                  {
                    __typename: "ChannelData",
                    entityID: node.entityID,
                    entityName: node.entityName,
                    entityType: node.entityType,
                    jsonValue: node.jsonValue,
                    portraitURL: node.portraitURL,
                  },
                ]);
              }
              return newDataMap;
            });

            setDataMap((_) => {
              return newDataMap;
            });
          }
        }
        setAfter(data?.teamDailyChannelData?.pageInfo.endCursor);
        setHasNextPage(Boolean(data?.teamDailyChannelData?.pageInfo.hasNextPage));
        return;
      })
      .finally(() => {
        setFetching(false);
      });
  }

  function loadingMore(): void {
    if (fetching || !hasNextPage) {
      return;
    }
    if (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
      setInstitutionAuthenticationDialog(true);
      return;
    }
    if (user?.role == Role.Basic) {
      setTrailServiceDialogOpen(true);
      return;
    }
    if (user?.role == Role.Expired) {
      setActiveServiceDialogOpen(true);
      return;
    }
    executeInstitutionQuery(tabID);
  }

  useBottomScrollListener(loadingMore, 100, 200);

  useEffect(() => {
    executeInstitutionQuery(tabID, true);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tabID]);

  useEffect(() => {
    const dateList: string[] = [];
    dataMap.forEach((_, date) => {
      dateList.push(date);
    });
    setDateList(dateList);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [dataMap]);

  return (
    <div className={classes.newsContainerBox}>
      {dateList.map((date) => {
        return (
          <LazyLoad key={date} height={200} once>
            <ListItemContent data={dataMap.get(date) ?? []} date={date} />
          </LazyLoad>
        );
      })}
      {!fetching && dateList.length < 1 ? <CommonAccordionPlaceholder /> : null}
      {fetching ? (
        <div className={classes.loading}>
          <Loading size={36} />
        </div>
      ) : null}
      {!fetching && !hasNextPage && dateList.length > 0 ? (
        <Typography className={classes.tipText}>暂无更多</Typography>
      ) : null}
      {!fetching && hasNextPage && dateList.length > 0 ? (
        <Typography
          className={clsx(classes.loadingText, classes.loadingMoreText)}
          color="primary"
          onClick={loadingMore}
        >
          点击加载更多
        </Typography>
      ) : null}
    </div>
  );
};

export default Institution;
