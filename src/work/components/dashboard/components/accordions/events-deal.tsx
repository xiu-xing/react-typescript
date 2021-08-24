import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import _ from "lodash";
import React, { ReactNode, useEffect, useState } from "react";
import { useClient } from "urql";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import { PlaceholderWEBP } from "../../../../assets/svg/placeholder";

import {
  ChannelStatisticsDocument,
  ChannelStatisticsQuery,
  ChannelStatisticsQueryVariables,
  EntityType,
  KeyValueMapDocument,
  KeyValueMapQuery,
  KeyValueMapQueryVariables,
} from "../../../../generated/graphql";
import { DealMapDataModel } from "../../../../models/entity/interfaces";
import theme from "../../../../theme";
import CommonAccordion from "../../../common/accordion/accordion";
import CommonAccordionDetails from "../../../common/accordion/components/details";
import CommonAccordionLoading from "../../../common/accordion/components/loading";
import CommonAccordionPlaceholder from "../../../common/accordion/components/placeholder";
import { CommonAccordionSummaryItemProps } from "../../../common/accordion/components/summary-item";
import CommonCell from "../../../common/cell/cell";
import { EventsDealWEBP } from "../../assets/webp";
import LoadMore from "../load-more";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    entitiyChange: {
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
    },
    image: {
      width: "100%",
      height: "100%",
      objectFit: "contain",
      pointerEvents: "none",
    },
    entities: {
      color: theme.palette.primary.main,
      fontSize: 14,
      fontWeight: 500,
    },
  }),
);

const EventsDeal: React.FunctionComponent = () => {
  const classes = useStyles();
  const client = useClient();
  const [fetching, setFetching] = useState(true);
  const [noData, setNoData] = useState(false);
  const [summaryItems, setSummaryItems] = useState<CommonAccordionSummaryItemProps[]>([]);
  const [entities, setEntities] = useState<DealMapDataModel[]>([]);
  const muse = useMuseClient();
  useEffect(() => {
    async function fetchData(): Promise<void> {
      try {
        const channelStatisticsQueryResult = await client
          .query<ChannelStatisticsQuery, ChannelStatisticsQueryVariables>(ChannelStatisticsDocument, {
            channelID: "channel_id_dashboard_deal",
          })
          .toPromise();
        const statisticsJSON = JSON.parse(channelStatisticsQueryResult.data?.channelStatistics as string);
        setSummaryItems([
          {
            heading: "今日",
            subheading: _.get(statisticsJSON, [0, "title"], ""),
            value: _.get(statisticsJSON, [0, "value"], "0"),
            valueColor: theme.palette.primary.main,
          },
          {
            heading: "近 7 日",
            subheading: _.get(statisticsJSON, [1, "title"], ""),
            value: _.get(statisticsJSON, [1, "value"], "0"),
            valueColor: theme.palette.primary.main,
          },
        ]);

        const keyValueMapQueryResult = await client
          .query<KeyValueMapQuery, KeyValueMapQueryVariables>(KeyValueMapDocument, {
            funcID: "pevc.latest_deal",
            requestBody: JSON.stringify({
              type: "deal",
              limit: 5,
            }),
          })
          .toPromise();

        const entityJSONArray: never[] = JSON.parse(keyValueMapQueryResult.data?.keyValueMap?.data as string) ?? [];
        const newEntities = entityJSONArray.map<DealMapDataModel>((entity) => {
          return DealMapDataModel.fromJSON(entity);
        });
        setEntities(newEntities);

        setFetching(false);

        if (newEntities.length === 0) {
          setNoData(true);
        }
      } catch (error) {
        setFetching(false);
        setNoData(true);
      }
    }
    fetchData();
  }, []);

  function detailsContentComponent(): ReactNode {
    if (fetching) {
      return <CommonAccordionLoading />;
    }

    if (noData) {
      return <CommonAccordionPlaceholder />;
    }

    return entities.map((entity, index) => {
      return (
        <CommonCell
          key={index}
          image={<img className={classes.image} src={entity.logo ? entity.logo : PlaceholderWEBP} />}
          heading={entity.name}
          subheading={`${entity.orgnizationName} | ${entity.closedOn} | ${entity.type} | 交易金额 ${entity.size} `}
          onClick={(): void => {
            muse.sendTrackingEvent("dashboard.deal_event_item_tap", {
              entity: {
                id: entity.id,
                type: EntityType.Deal,
              },
            });
            window.open(`/profile?id=${entity.id}&type=DEAL`);
          }}
        />
      );
    });
  }

  return (
    <CommonAccordion
      defaultExpanded
      image={<img className={classes.image} src={EventsDealWEBP} />}
      heading="融资事件"
      subheading="近期融资事件"
      summaryItems={summaryItems}
    >
      <CommonAccordionDetails
        footerButton={noData || fetching ? null : <LoadMore />}
        footerButtonClick={(): void => {
          muse.sendTrackingEvent("dashboard.deal_event_read_more", {});
          window.open("/realm/pevc.event?templateId=preset_recent_deals");
        }}
      >
        {detailsContentComponent()}
      </CommonAccordionDetails>
    </CommonAccordion>
  );
};

export default EventsDeal;
