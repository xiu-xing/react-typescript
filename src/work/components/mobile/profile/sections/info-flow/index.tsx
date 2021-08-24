import { Box, ButtonBase, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { format, formatDistanceToNow, fromUnixTime } from "date-fns";
import zhCN from "date-fns/locale/zh-CN/index.js";
import { useAtom } from "jotai";
import { get } from "lodash";
import { ChevronRight } from "mdi-material-ui";
import React, { ReactNode, useEffect, useRef, useState } from "react";
import { useClient } from "urql";
import {
  EntityType,
  FilterInputs,
  InfoFlowDocument,
  InfoFlowItem,
  InfoFlowQuery,
  InfoFlowQueryVariables,
  InfoFlowSection as InfoFlowSectionModel,
  NextPlatform,
  PageInfo,
} from "../../../../../generated/graphql";
import { inDay } from "../../../../../utils/date";
import LoadingIndicator from "../../../common/loadingIndicator";
import { subProfileAtom, subProfileTabActiveIndexAtom } from "../../../sub-profile/states";
import NoData from "../../no-data";
import { ActionModel, getActionHandler } from "../block/action";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    infoTitle: {
      fontSize: 14,
      color: "#333",
      fontWeight: 500,
      paddingBottom: 4,
      lineHeight: "24px",
      wordBreak: "break-all",
    },
    infoDescription: {
      fontSize: 14,
      color: "#666",
      lineHeight: "24px",
      wordBreak: "break-all",
      overflow: "hidden",
      display: "-webkit-box",
      "-webkit-line-clamp": 3,
      "-webkit-box-orient": "vertical",
    },
    bottomBox: {
      display: "flex",
      justifyContent: "space-between",
    },
    timestamp: {
      fontSize: 12,
      color: "#999",
      display: "inline-block",
    },
    titleBox: {
      display: "flex",
      justifyContent: "space-between",
      paddingBottom: 12,
    },
    title: {
      fontSize: 14,
      color: "#333",
      lineHeight: "24px",
      fontWeight: 500,
    },
    more: {
      fontSize: 12,
      fontWeight: 500,
      color: theme.palette.primary.main,
    },
    ChevronRight: {
      color: theme.palette.primary.main,
      fontSize: 16,
    },
    button: {
      display: "flex",
      justifyContent: "center",
      borderRadius: 4,
      padding: "0 4px",
    },
    infoBox: {
      display: "grid",
      gridRowGap: 26,
    },
  }),
);

interface InfoFlowSectionProps {
  section: InfoFlowSectionModel;
  entityId: string;
  entityType: EntityType;
  filters?: FilterInputs;
}

const InfoFlowSection: React.FunctionComponent<InfoFlowSectionProps> = ({ section, entityId, entityType, filters }) => {
  const classes = useStyles();
  const client = useClient();
  const [tabActiveIndex] = useAtom(subProfileTabActiveIndexAtom);
  const [subProfileState] = useAtom(subProfileAtom);
  const [infoFlowList, setInfoFlowList] = useState<InfoFlowItem[]>([]);
  const [fetching, setFetching] = useState(false);
  const [pageInfo, setPageInfo] = useState<Pick<PageInfo, "endCursor" | "hasNextPage">>({
    hasNextPage: true,
  });
  const [page, setPage] = useState(0);
  const [noData, setNoData] = useState(false);
  const fetchingRef = useRef<boolean>();
  const hasNextPageRef = useRef<boolean>(true);
  const tabActiveIndexRef = useRef(tabActiveIndex);

  const executeInfoFlowQuery = (funcId: string, first = 10, filterInputs?: FilterInputs, after?: string) => {
    return client
      .query<InfoFlowQuery, InfoFlowQueryVariables>(
        InfoFlowDocument,
        {
          entityID: entityId,
          entityType: entityType,
          funcID: funcId,
          filters: filterInputs,
          after: after,
          first: first,
          platform: NextPlatform.PlatformMobile,
        },
        { requestPolicy: "network-only" },
      )
      .toPromise();
  };

  function getDate(time: number): string {
    const date = inDay(time)
      ? formatDistanceToNow(fromUnixTime(time), {
          addSuffix: true,
          locale: zhCN,
        })
      : format(fromUnixTime(time), "yyyy-MM-dd");
    return date.replace("大约", "");
  }

  function onButtonClick() {
    window.open(`js://webview/sub-profile?id=${entityId}&type=${entityType}&subProfileId=${section?.infoFlowID}`);
  }

  const scrollHandler = () => {
    const sections = subProfileState?.sections ?? [];
    const activeSection = sections[tabActiveIndexRef.current];

    if (section.id != activeSection?.id) return;

    if (fetchingRef.current || !hasNextPageRef.current) return;

    let scrollTop = document.documentElement.scrollTop;
    if (scrollTop == 0) {
      scrollTop = document.body.scrollTop;
    }
    if (scrollTop == 0 && document.scrollingElement?.scrollTop) {
      scrollTop = document.scrollingElement.scrollTop;
    }

    if (
      document.documentElement.scrollHeight - document.documentElement.clientHeight - scrollTop < 100 &&
      !section?.limit
    ) {
      setFetching((fetchingRef.current = true));
      setPage((prev) => prev + 1);
    }
  };

  useEffect(() => {
    if (page) {
      executeInfoFlowQuery(
        section?.infoFlowID as string,
        section?.limit ?? 10,
        filters,
        pageInfo.endCursor ?? undefined,
      )
        .then((res) => {
          const pageInfo: PageInfo = get(res, ["data", "infoFlow", "pageInfo"]);
          const data: InfoFlowItem[] = get(res, ["data", "infoFlow", "nodes"]);
          setPageInfo({
            hasNextPage: pageInfo.hasNextPage,
            endCursor: pageInfo.endCursor,
          });
          hasNextPageRef.current = pageInfo.hasNextPage;
          setInfoFlowList((prev) => prev.concat(data));
        })
        .finally(() => {
          setFetching((fetchingRef.current = false));
        });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page]);

  useEffect(() => {
    if (section) {
      setInfoFlowList([]);
      executeInfoFlowQuery(section?.infoFlowID as string, section?.limit ?? 10, filters)
        .then((res) => {
          const pageInfo: PageInfo = get(res, ["data", "infoFlow", "pageInfo"]);
          const data: InfoFlowItem[] = get(res, ["data", "infoFlow", "nodes"]);
          setPageInfo({
            hasNextPage: pageInfo.hasNextPage,
            endCursor: pageInfo.endCursor,
          });
          hasNextPageRef.current = pageInfo.hasNextPage;
          setNoData(!data);
          setInfoFlowList(data);
        })
        .finally(() => {
          setFetching((fetchingRef.current = false));
        });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filters, section]);

  useEffect(() => {
    if (section?.limit) return;
    window.addEventListener("scroll", scrollHandler);
    return (): void => window.removeEventListener("scroll", scrollHandler);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  function content(infoFlowList: InfoFlowItem[]): ReactNode {
    return (
      <>
        {section?.name && (
          <div className={classes.titleBox}>
            <>
              <Typography className={classes.title}>{section.name}</Typography>
              {!noData && (
                <ButtonBase className={classes.button} onClick={onButtonClick}>
                  <Typography className={classes.more}>查看全部</Typography>
                  <ChevronRight className={classes.ChevronRight} />
                </ButtonBase>
              )}
            </>
          </div>
        )}
        <div className={classes.infoBox}>
          {infoFlowList.map(
            (infoItem, index) =>
              infoItem && (
                <div
                  key={index}
                  onClick={infoItem.action ? getActionHandler(ActionModel.fromJSON(infoItem.action)) : undefined}
                >
                  <Typography className={classes.infoTitle}>{infoItem.title}</Typography>
                  <Typography className={classes.infoDescription}>{infoItem.description}</Typography>
                  <Box height={8} />
                  {infoItem.timestamp && (
                    <Typography className={classes.timestamp}>{getDate(infoItem.timestamp)}</Typography>
                  )}
                </div>
              ),
          )}
        </div>
      </>
    );
  }

  return !noData ? (
    <div className={classes.root}>
      {infoFlowList && content(infoFlowList)}
      {fetching && <LoadingIndicator hasNextPage={pageInfo.hasNextPage} />}
    </div>
  ) : (
    <Box style={{marginTop: 100}}>
      <NoData />
    </Box>
  );
};

export default InfoFlowSection;
