import { Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import { FileSearchOutline, TextSearch } from "mdi-material-ui";
import React, { ReactNode, useEffect, useState } from "react";
import { useClient } from "urql";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import UserContainer from "../../../../containers/userContainer";
import {
  ChannelStatisticsDocument,
  ChannelStatisticsQuery,
  ChannelStatisticsQueryVariables,
  SearchTemplate,
} from "../../../../generated/graphql";
import theme from "../../../../theme";
import CommonAccordion from "../../../common/accordion/accordion";
import CommonAccordionDetails from "../../../common/accordion/components/details";
import CommonAccordionLoading from "../../../common/accordion/components/loading";
import CommonAccordionPlaceholder from "../../../common/accordion/components/placeholder";
import { CommonAccordionSummaryItemProps } from "../../../common/accordion/components/summary-item";
import CommonCell from "../../../common/cell/cell";
import { ArrowUp } from "../../assets/svg/index";
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

const SearchTemplates: React.FunctionComponent = () => {
  const classes = useStyles();
  const client = useClient();
  const [searchTemplates, setSearchTemplates] = useState<SearchTemplate[]>([]);
  const [fetching, setFetching] = useState(true);
  const [summaryItems, setSummaryItems] = useState<CommonAccordionSummaryItemProps[]>([]);
  const muse = useMuseClient();
  const [noData, setNoData] = useState(false);

  useEffect(() => {
    async function fetchData(): Promise<void> {
      try {
        const statisticsQueryResult = await client
          .query<ChannelStatisticsQuery, ChannelStatisticsQueryVariables>(ChannelStatisticsDocument, {
            channelID: "channel_id_dashboard_discovery_template",
          })
          .toPromise();
        const statisticsJSON = JSON.parse(statisticsQueryResult.data?.channelStatistics as string);
        setSummaryItems([
          {
            heading: "当前",
            subheading: _.get(statisticsJSON, [0, "title"], ""),
            value: _.get(statisticsJSON, [0, "value"], "0"),
            valueColor: theme.palette.primary.main,
          },
          {
            heading: "当前",
            subheading: _.get(statisticsJSON, [1, "title"], ""),
            value: _.get(statisticsJSON, [1, "value"], "0"),
            valueColor: theme.palette.primary.main,
          },
        ]);

        // const searchTemplatesQueryResult = await client
        //   .query<SearchTemplatesQuery, SearchTemplatesQueryVariables>(SearchTemplatesDocument, {
        //     first: 5,
        //     sortBy: SearchTemplatesSortBy.NumOfNewEntities,
        //     isDesc: true,
        //   })
        //   .toPromise();
        // const newSearchTemplates = (searchTemplatesQueryResult.data?.searchTemplates.nodes ?? []).map(
        //   (node) => node as SearchTemplate,
        // );
        setFetching(false);
        // setSearchTemplates(newSearchTemplates as SearchTemplate[]);
        // if (newSearchTemplates.length === 0) {
        //   setNoData(true);
        // }
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

    return searchTemplates.map((node, index) => {
      return (
        <CommonCell
          key={index}
          image={
            <div>
              <FileSearchOutline style={{ fontSize: 24, color: theme.palette.primary.main }} />
            </div>
          }
          heading={node?.name ?? "无标题"}
          // subheading={
          //   formatDistanceToNow(fromUnixTime(node?.lastExecutedAt ?? 0), {
          //     locale: cnLocale,
          //   }) + "前"
          // }
          actions={
            <div className={classes.entitiyChange}>
              {/* <Typography className={classes.entities}>{`${node?.numOfNewEntities} 条目`}</Typography> */}
              <ArrowUp style={{ width: 16, height: 16 }} />
            </div>
          }
          onClick={(): void => {
            muse.sendTrackingEvent("dashboard.my_search_template_item_tap", {
              template_id: node.id ?? "",
              search_type: node.realmID ?? "",
            });
            window.open(`/realm/search/${node.realmID}?templateId=${node?.id}`);
          }}
        />
      );
    });
  }

  return (
    <CommonAccordion
      image={<TextSearch className={classes.image} style={{ color: "#656565" }} />}
      heading="我的搜索模版"
      subheading="命中搜索条件的新实体"
      defaultExpanded
      summaryItems={summaryItems}
    >
      <CommonAccordionDetails
        footerButton={noData || fetching ? null : <LoadMore />}
        footerButtonClick={(): void => {
          muse.sendTrackingEvent("dashboard.my_search_template_read_more", {});
          window.open("/templates");
        }}
      >
        {detailsContentComponent()}
      </CommonAccordionDetails>
    </CommonAccordion>
  );
};

export default SearchTemplates;
