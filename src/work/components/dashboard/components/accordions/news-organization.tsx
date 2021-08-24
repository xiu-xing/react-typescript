import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { format, fromUnixTime } from "date-fns";
import React, { ReactNode, useEffect, useState } from "react";
import { useClient } from "urql";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import { PlaceholderWEBP } from "../../../../assets/svg/placeholder";
import UserContainer from "../../../../containers/userContainer";
import {
  News,
  NewsListDocument,
  NewsListQuery,
  NewsListQueryVariables,
  TeamDailyChannelDataDocument,
  TeamDailyChannelDataQuery,
  TeamDailyChannelDataQueryVariables,
} from "../../../../generated/graphql";
import { getResourceUrl, urlTools } from "../../../../utils/url";
import CommonAccordionDetails from "../../../common/accordion/components/details";
import CommonAccordionLoading from "../../../common/accordion/components/loading";
import CommonAccordionPlaceholder from "../../../common/accordion/components/placeholder";
import CommonCell from "../../../common/cell/cell";
import CommonCellTag from "../../../common/cell/components/tag";
import Card from "../card";
import CellGroup from "../cell-group/cell-group";
import MoreButton from "../cell-group/components/more-button";
import LoadMore from "../load-more";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    entitiyChange: {
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
    },
    entities: {
      color: theme.palette.primary.main,
      fontSize: 14,
      fontWeight: 500,
    },
    image: {
      width: "100%",
      height: "100%",
      objectFit: "contain",
      pointerEvents: "none",
    },
  }),
);

interface NewsOrganizationGroup {
  id: string;
  logo: string;
  name: string;
  type: string;
  news: News[];
}

const NewsOrganization: React.FunctionComponent = () => {
  const classes = useStyles();
  const client = useClient();
  const [fetching, setFetching] = useState(true);
  const [noData, setNoData] = useState(false);
  const [groups, seGroups] = useState<NewsOrganizationGroup[]>([]);
  const muse = useMuseClient();

  useEffect(() => {
    async function fetchData(): Promise<void> {
      try {
        const teamChannelDataQueryResult = await client
          .query<TeamDailyChannelDataQuery, TeamDailyChannelDataQueryVariables>(TeamDailyChannelDataDocument, {
            dataID: "data_id_news",
            teamGroupCodes: [
              "institutional_investor",
              "corporate_entity",
              "fund_manager",
              "fund",
              "fof",
              "invested_fund",
              "invested_company",
              "lp",
              "partner_institutional_investor",
              "co_ins_investor",
              "vertical_preference",
            ],
            first: 5,
          })
          .toPromise();

        const groupPromises = (teamChannelDataQueryResult.data?.teamDailyChannelData?.nodes ?? []).map(async (node) => {
          const date = fromUnixTime(Number(node.date));
          const newsQueryResult = await client
            .query<NewsListQuery, NewsListQueryVariables>(NewsListDocument, {
              first: 1,
              entities: [
                {
                  entityId: node.entityID,
                  entityType: node.entityType,
                },
              ],
              startTime: `${format(date, "yyyy-MM-dd")} 00:00:00`,
              endTime: `${format(date, "yyyy-MM-dd")} 23:59:59`,
            })
            .toPromise();

          return {
            id: node.entityID,
            logo: node.portraitURL,
            name: node.entityName,
            type: node.entityType,
            news: (newsQueryResult.data?.newsList?.nodes ?? []) as News[],
          };
        });

        const newGroups = await Promise.all(groupPromises);
        seGroups(newGroups as NewsOrganizationGroup[]);
        setFetching(false);

        if (newGroups.length === 0) {
          setNoData(true);
        }
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

    return groups.map((group, groupIndex) => (
      <CellGroup
        key={groupIndex}
        heading={group.name}
        image={<img className={classes.image} src={group.logo ? group.logo : PlaceholderWEBP} />}
        actionArea={
          <MoreButton
            onClick={(): void => {
              muse.sendTrackingEvent("dashboard.my_institution_news_read_more", {
                entity: {
                  id: group.id,
                  type: group.type,
                },
              });
              window.open(
                `/news/all?entityId=${urlTools.encode(group.id)}&entityName=${urlTools.encode(group.name)}&entityType=${
                  group.type
                }`,
              );
            }}
          />
        }
      >
        {group.news.map((newsItem, newIndex) => (
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
      </CellGroup>
    ));
  }

  return (
    <Card>
      <CommonAccordionDetails
        footerButton={noData || fetching ? null : <LoadMore />}
        footerButtonClick={(): void => {
          muse.sendTrackingEvent("dashboard.my_institution_news_read_more", {});
          window.open("/news/my-institution");
        }}
        disableTopDivider
      >
        {detailsContentComponent()}
      </CommonAccordionDetails>
    </Card>
  );
};

export default NewsOrganization;
