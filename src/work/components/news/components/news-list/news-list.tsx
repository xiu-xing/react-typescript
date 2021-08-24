import { CircularProgress, createStyles, makeStyles, Theme } from "@material-ui/core";
import { useClient } from "@momentum-valley/muse-js";
import { format, fromUnixTime } from "date-fns";
import { ChevronRight } from "mdi-material-ui";
import React, { FunctionComponent, useEffect, useState } from "react";
import { withAlphaHex } from "with-alpha-hex";
import UserContainer from "../../../../containers/userContainer";
import { ChannelData, useNewsListQuery } from "../../../../generated/graphql";
import theme from "../../../../theme";
import { urlTools } from "../../../../utils/url";
import CommonAccordion from "../../../common/accordion/accordion";
import CommonAccordionDetails from "../../../common/accordion/components/details";
import CommonAccordionPlaceholder from "../../../common/accordion/components/placeholder";
import EntityAvatar from "../../../common/entity-avatar-next/entity-avatar";
import { NewsEntityProps } from "../../newsContainer";
import InfoItem from "./components/info-item";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    paperRoot: {
      overflow: "hidden",
      marginBottom: 12,
    },
    containerBox: {
      width: "100%",
      minWidth: 746,
    },
    expandedListRoot: {
      padding: 0,
    },
    contentBox: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      flexDirection: "column",
      minWidth: 746,
      overflow: "hidden",
      minHeight: 150,
    },
    tag: {
      marginRight: 12,
      marginBottom: 8,
      background: withAlphaHex(theme.palette.primary.main, 0.16),
      color: theme.palette.primary.main,
      fontSize: 10,
      minWidth: 50,
      display: "flex",
      alignItems: "center",
    },
    moreInfoBox: {
      height: 52,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      fontSize: 14,
      fontWeight: 500,
    },
    moreText: {
      color: theme.palette.primary.main,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
    image: {
      width: 30,
      height: 30,
      objectFit: "cover",
      marginRight: 8,
    },
    accordionRoot: {
      margin: "0 0 1px 0",
    },
    accordionExpandedRoot: {
      margin: "14px 0",
    },
    accordionSingleRoot: {
      borderRadius: 4,
    },
    accordionDefaultRoot: {
      borderRadius: 0,
    },
    accordionFirstRoot: {
      borderRadius: "4px 4px 0 0",
    },
    accordionLastRoot: {
      borderRadius: "0 0 4px 4px",
    },
  }),
);

export interface MoreBoxProps {
  targetSrc: string;
  text: string;
}

interface NewsListProps {
  channelData: ChannelData;
  date: string;
}

interface NewsInfoProps {
  title: string;
  value: string;
}

const NewsList: FunctionComponent<NewsListProps> = ({ channelData, date }) => {
  const [newsInfo] = useState<NewsInfoProps>((JSON.parse(channelData.jsonValue as string) as NewsInfoProps[])[0]);
  const [noData, setNoData] = useState(false);
  const muse = useClient();
  const [{ data, fetching }, executeQuery] = useNewsListQuery({
    variables: {
      first: 3,
      entities: [{ entityId: channelData.entityID, entityType: channelData.entityType }],
      startTime: `${date} 00:00:00`,
      endTime: `${date} 23:59:59`,
    },
    pause: true,
  });

  useEffect(() => {
    if (data?.newsList?.nodes && data?.newsList?.nodes?.length < 0) {
      setNoData(true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [data?.newsList?.nodes]);

  const [expanded, setExpanded] = useState(true);
  const classes = useStyles({ expanded });

  useEffect(() => {
    executeQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const clickMoreHandler = (): void => {
    muse.sendTrackingEvent("news.entity_news_read_more", {
      entity: {
        id: channelData.entityID,
        type: channelData.entityType,
      },
    });
    if (process.browser) {
      window.open(
        `/news/all?entityId=${urlTools.encode(channelData.entityID)}&entityName=${urlTools.encode(
          channelData.entityName,
        )}&entityType=${channelData.entityType}`,
      );
    }
  };

  const accordionChangeHandler = (_: React.ChangeEvent<{}>, expanded: boolean): void => {
    setExpanded(expanded);
  };

  const MoreNodes =
    data?.newsList?.nodes && data?.newsList?.nodes?.length === 3 ? (
      <div className={classes.moreText}>
        <span>查看更多</span>
        <ChevronRight />
      </div>
    ) : null;

  return (
    <CommonAccordion
      heading={channelData.entityName}
      square={!expanded}
      onChange={accordionChangeHandler}
      summaryItems={[
        {
          subheading: <span style={{ fontSize: 12 }}>当日</span>,
          valueColor: theme.palette.primary.main,
          heading: newsInfo.title,
          value: newsInfo.value,
        },
      ]}
      defaultExpanded={expanded}
      image={<EntityAvatar className={classes.image} src={channelData.portraitURL as string} />}
    >
      <CommonAccordionDetails footerButton={MoreNodes} footerButtonClick={clickMoreHandler}>
        <div className={classes.contentBox}>
          {fetching ? <CircularProgress size={30} /> : null}
          {!noData ? (
            data?.newsList?.nodes?.map((item) => {
              const formatDate = format(fromUnixTime(Number(item?.publishTime)), "yyyy-MM-dd HH:mm:ss");
              const entity: NewsEntityProps = {
                id: channelData.entityID,
                primaryName: channelData.entityName,
                entityType: channelData.entityType,
              };
              const entities: NewsEntityProps[] = [entity];
              return (
                <InfoItem
                  key={item?.id as string}
                  link={item?.link}
                  title={item?.title}
                  content={item?.abstract}
                  publishedTime={formatDate}
                  imgSrc={item?.pictureURL}
                  entities={entities}
                  tags={[item?.source as string]}
                  classes={{
                    tag: classes.tag,
                  }}
                />
              );
            })
          ) : (
            <CommonAccordionPlaceholder />
          )}
        </div>
      </CommonAccordionDetails>
    </CommonAccordion>
  );
};

export default NewsList;
