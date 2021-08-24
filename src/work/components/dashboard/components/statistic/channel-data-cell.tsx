import _ from "lodash";
import React, { useEffect, useState } from "react";
import { useClient } from "urql";
import {
  ChannelStatisticsDocument,
  ChannelStatisticsQuery,
  ChannelStatisticsQueryVariables,
} from "../../../../generated/graphql";
import theme from "../../../../theme";
import StatisticCell, { FieldProps } from "./components/cell";

interface ChannelDataCellProps {
  channelId: string;
  type: "news" | "risk";
  onClick?: () => void;
}

const ChannelDataCell: React.FunctionComponent<ChannelDataCellProps> = (props) => {
  const client = useClient();
  const [summaryItems, setSummaryItems] = useState<FieldProps[]>([]);

  async function executeQuery(): Promise<void> {
    try {
      const statisticsQueryResult = await client
        .query<ChannelStatisticsQuery, ChannelStatisticsQueryVariables>(ChannelStatisticsDocument, {
          channelID: props.channelId,
        })
        .toPromise();

      const statisticsJSON = JSON.parse(statisticsQueryResult.data?.channelStatistics as string);
      props.type == "news"
        ? setSummaryItems([
            {
              title: `今日新闻`,
              subtitle: _.get(statisticsJSON, [0, "title"], "") || "新闻",
              value: _.get(statisticsJSON, [0, "value"], "0"),
            },
            {
              title: "近 30 日",
              subtitle: _.get(statisticsJSON, [1, "title"], "") || "新闻",
              value: _.get(statisticsJSON, [1, "value"], "0"),
            },
          ])
        : setSummaryItems([
            {
              title: "今日风险",
              subtitle: _.get(statisticsJSON, [0, "title"], "") || "今日风险",
              value: _.get(statisticsJSON, [0, "value"], "0"),
            },
            {
              title: "近 30 日",
              subtitle: _.get(statisticsJSON, [1, "title"], "") || "风险事件",
              value: _.get(statisticsJSON, [1, "value"], "0"),
            },
            {
              title: "近 30 日",
              subtitle: _.get(statisticsJSON, [2, "title"], "") || "负面舆情",
              value: _.get(statisticsJSON, [2, "value"], "0"),
            },
          ]);
    } catch (error) {
      //
    }
  }

  useEffect(() => {
    executeQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [props.channelId]);

  return (
    <StatisticCell
      valueColor={props.type === "risk" ? "#C62828" : theme.palette.primary.main}
      data={summaryItems}
      onClick={props.onClick}
    />
  );
};

export default ChannelDataCell;
