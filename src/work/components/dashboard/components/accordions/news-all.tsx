import { Card } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import { format, fromUnixTime } from "date-fns";
import React, { ReactNode, useEffect, useState } from "react";
import { useClient } from "urql";
import { PlaceholderWEBP } from "../../../../assets/svg/placeholder";
import { News, NewsListDocument, NewsListQuery, NewsListQueryVariables } from "../../../../generated/graphql";
import { getResourceUrl } from "../../../../utils/url";
import CommonAccordionDetails from "../../../common/accordion/components/details";
import CommonAccordionLoading from "../../../common/accordion/components/loading";
import CommonAccordionPlaceholder from "../../../common/accordion/components/placeholder";
import CommonCell from "../../../common/cell/cell";
import CommonCellTag from "../../../common/cell/components/tag";
import LoadMore from "../load-more";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    image: {
      width: "100%",
      height: "100%",
      objectFit: "contain",
      pointerEvents: "none",
    },
  }),
);

const NewsAll: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const client = useClient();
  const [fetching, setFetching] = useState(true);
  const [news, setNews] = useState<News[]>([]);
  const [noData, setNoData] = useState(false);
  const muse = useMuseClient();

  useEffect(() => {
    async function fetchData(): Promise<void> {
      try {
        const newsQueryResult = await client
          .query<NewsListQuery, NewsListQueryVariables>(NewsListDocument, {
            first: 8,
          })
          .toPromise();

        if (!newsQueryResult.data?.newsList?.nodes?.length) {
          setNoData(true);
          setFetching(false);
          return;
        }

        setNews((newsQueryResult.data?.newsList?.nodes ?? []) as News[]);

        setFetching(false);
      } catch (error) {
        setFetching(false);
        setNoData(true);
      }
    }
    fetchData();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  function detailsContentComponent(): ReactNode {
    if (fetching) {
      return <CommonAccordionLoading />;
    }

    if (noData) {
      return <CommonAccordionPlaceholder />;
    }

    return (
      <>
        {news.map((newsItem, newIndex) => (
          <CommonCell
            key={newIndex}
            image={
              <img
                className={classes.image}
                src={newsItem.pictureURL ? getResourceUrl(newsItem.pictureURL) : PlaceholderWEBP}
              />
            }
            heading={newsItem.title ?? ""}
            subheading={
              format(fromUnixTime(parseInt(newsItem.publishTime ?? "")), "yyyy-MM-dd") +
              `${newsItem.abstract ? " | " + newsItem.abstract : ""}`
            }
            tags={newsItem.source ? [<CommonCellTag key="1">{newsItem.source}</CommonCellTag>] : []}
            onClick={(): void => {
              muse.sendTrackingEvent("dashboard.news_item_tap", {
                related_entities: newsItem.relatedEntity.map((r) => {
                  return {
                    id: r?.entityId as string,
                    type: r?.entityType ?? "ORGANIZATION",
                  };
                }),
              });
              if (newsItem.link) {
                window.open(newsItem.link);
              }
            }}
          />
        ))}
      </>
    );
  }

  return (
    <Card>
      <CommonAccordionDetails
        footerButton={noData || fetching ? null : <LoadMore />}
        footerButtonClick={(): void => {
          muse.sendTrackingEvent("dashboard.news_market_read_more", {});
          window.open("/news/all");
        }}
        disableTopDivider
      >
        {detailsContentComponent()}
      </CommonAccordionDetails>
    </Card>
  );
};

export default NewsAll;
