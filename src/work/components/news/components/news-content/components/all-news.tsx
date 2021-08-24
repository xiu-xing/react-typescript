import { CircularProgress, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { format, fromUnixTime } from "date-fns";
import React, { FunctionComponent, useEffect, useState } from "react";
import { useBottomScrollListener } from "react-bottom-scroll-listener";
import LazyLoad from "react-lazyload";
import { useClient } from "urql";
import { useImmer } from "use-immer";
import { withAlphaHex } from "with-alpha-hex";
import UserContainer from "../../../../../containers/userContainer";
import {
  EntityInput,
  News,
  NewsListDocument,
  NewsListQuery,
  NewsListQueryVariables,
  QueryType,
  Role,
} from "../../../../../generated/graphql";
import { parseError } from "../../../../../utils/error";
import { isAccessError } from "../../../../../utils/errorHandler";
import CommonAccordionPlaceholder from "../../../../common/accordion/components/placeholder";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import NewsContainer from "../../../newsContainer";
import InfoItem from "../../news-list/components/info-item";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    tag: {
      marginRight: 12,
      background: withAlphaHex(theme.palette.primary.main, 0.16),
      color: theme.palette.primary.main,
      fontSize: 10,
      minWidth: 50,
      display: "flex",
      alignItems: "center",
    },
    newsItemBox: {
      display: "flex",
      justifyContent: "center",
      flexDirection: "column",
      width: "100%",
    },
    tipText: {
      width: "100%",
      fontSize: 16,
      fontWeight: 500,
      color: "#A6A6A6",
      display: "flex",
      justifyContent: "center",
      margin: 16,
    },
    loading: {
      height: 230,
      width: "100%",
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
    loadingText: {
      display: "flex",
      justifyContent: "center",
      margin: 16,
    },
    loadingMoreText: {
      fontSize: 14,
      fontWeight: 400,
      cursor: "pointer",
    },
  }),
);

const AllNewsContent: FunctionComponent = () => {
  const classes = useStyles();
  const { entities, keywords, tags } = NewsContainer.useContainer();
  const [newsData, setNewsData] = useImmer<News[]>([]);
  const [after, setAfter] = useState<string | undefined>();
  const [hasNextPage, setHasNextPage] = useState(false);
  const [fetching, setFetching] = useState(false);
  const client = useClient();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const {
    user,
    setTrailServiceDialogOpen,
    setInstitutionAuthenticationDialog,
    setActiveServiceDialogOpen,
  } = UserContainer.useContainer();

  function executeRecommendQuery(entities?: EntityInput[], keywords?: string[], tags?: string[], clear = false): void {
    if (clear) {
      window.scrollTo(0, 0);
    }
    setFetching(true);
    client
      .query<NewsListQuery, NewsListQueryVariables>(NewsListDocument, {
        first: 8,
        keywords,
        tags,
        queryType: QueryType.Intersection,
        entities: entities ?? [],
        after: !clear ? after : undefined,
      })
      .toPromise()
      .then((result) => {
        const errorRes = parseError(result.error);
        if (isAccessError(errorRes.code)) {
          openSnackbar(errorRes.message, "error");
          if (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
            setInstitutionAuthenticationDialog(true);
            // return;
          }
          if (user?.role == Role.Basic) {
            setTrailServiceDialogOpen(true);
            // return;
          }
          if (user?.role == Role.Expired) {
            setActiveServiceDialogOpen(true);
          }
        }
        setFetching(false);
        if (clear) {
          setNewsData(() => {
            return (result.data?.newsList?.nodes as News[]) ?? [];
          });
        } else {
          setNewsData((draft) => {
            if (result.data?.newsList?.nodes && result.data?.newsList?.nodes.length > 0) {
              draft.push(...(result.data?.newsList?.nodes as News[]));
            }
          });
        }
        if (result.data?.newsList?.pageInfo) {
          setAfter(result.data.newsList.pageInfo.endCursor as string);
          setHasNextPage(Boolean(result.data.newsList.pageInfo.hasNextPage));
        }
      });
  }

  function loadingMore(): void {
    if (fetching || !hasNextPage) {
      return;
    }

    executeRecommendQuery(
      entities.map((item) => {
        return {
          entityId: item.id,
          entityType: item.entityType,
        };
      }),
      keywords,
      tags,
    );
  }

  useBottomScrollListener(loadingMore, 100, 200);

  useEffect(() => {
    executeRecommendQuery(
      entities.map((item) => {
        return {
          entityId: item.id,
          entityType: item.entityType,
        };
      }),
      keywords,
      tags,
      true,
    );

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [entities, keywords, tags]);

  return (
    <>
      <div className={classes.newsItemBox}>
        {!fetching && newsData.length < 1 ? <CommonAccordionPlaceholder /> : null}
        {newsData.map((item, index) => {
          const formatDate = format(fromUnixTime(Number(item?.publishTime)), "yyyy-MM-dd HH:mm:ss");
          return (
            <LazyLoad key={index} height={100} once>
              <InfoItem
                key={item.id as string}
                link={item.link}
                title={item.title}
                imgSrc={item.pictureURL}
                content={item.abstract}
                publishedTime={formatDate}
                entities={entities}
                keywords={keywords}
                tags={[item.source as string]}
                classes={{
                  tag: classes.tag,
                }}
              />
            </LazyLoad>
          );
        })}
        {!fetching && !hasNextPage && newsData.length > 0 ? (
          <Typography className={classes.tipText}>滑到底啦！</Typography>
        ) : null}
      </div>
      {!fetching && hasNextPage && newsData.length > 0 ? (
        <Typography
          className={clsx(classes.loadingText, classes.loadingMoreText)}
          color="primary"
          onClick={loadingMore}
        >
          点击加载更多
        </Typography>
      ) : null}
      {fetching ? (
        <div className={classes.loading}>
          <CircularProgress size={30} />
        </div>
      ) : null}
    </>
  );
};

export default AllNewsContent;
