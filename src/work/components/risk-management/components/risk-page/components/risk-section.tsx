import { CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Skeleton } from "@material-ui/lab";
import clsx from "clsx";
import { format } from "date-fns";
import { ChevronDown } from "mdi-material-ui";
import React, { ReactNode, useEffect, useState } from "react";
import UserContainer from "../../../../../containers/userContainer";
import {
  ChannelData,
  Role,
  useTeamChannelDataQuery,
  useUserFollowedChannelDataQuery,
} from "../../../../../generated/graphql";
import { parseError } from "../../../../../utils/error";
import { isAccessError } from "../../../../../utils/errorHandler";
import CommonAccordionPlaceholder from "../../../../common/accordion/components/placeholder";
import { CommonAccordionSummaryItemProps } from "../../../../common/accordion/components/summary-item";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import RiskManagementContainer from "../../../riskManagementContainer";
import RiskCard from "./risk-card";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      marginBottom: 52,
    },
    title: {
      fontSize: 20,
      color: "#5F6368",
      marginBottom: 12,
      marginLeft: 8,
    },
    loadMore: {
      position: "relative",
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      padding: "14px 0",
      borderBottomLeftRadius: 4,
      borderBottomRightRadius: 4,
      boxShadow: "0px 2px 1px -1px rgba(0,0,0,0.2), 0px 1px 1px 0px rgba(0,0,0,0.14), 0px 1px 3px 0px rgba(0,0,0,0.12)",
      backgroundColor: "#fff",
      cursor: "pointer",

      "&:before": {
        top: -1,
        left: 0,
        right: 0,
        height: 1,
        position: "absolute",
        backgroundColor: "rgba(0, 0, 0, 0.12)",
        content: `""`,
      },
    },
    loadMoreAlone: {
      borderRadius: 0,
      "&:before": {
        content: "none",
      },
    },
    loadMoreText: {
      fontSize: 14,
    },
    noDataBox: {
      padding: "0px 0",
      border: "1px solid #EEE",
      borderRadius: 4,
      textAlign: "center",
      pointerEvents: "none",
    },
    noDataText: {
      fontSize: 18,
      marginTop: 12,
    },
    loadingBox: {
      border: "1px solid #EEE",
      borderRadius: 4,

      minHeight: 356,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    loadingIcon: {
      width: 24,
    },
  }),
);

export interface RiskSectionProps {
  startTime: string;
  endTime: string;
  title: string;
  defaultExpanded?: boolean;
}

const pageSize = 10;

/**
 * 以日期划分的模块
 * @param props
 */
const RiskSection: React.FunctionComponent<RiskSectionProps> = (props) => {
  const classes = useStyles();

  const { startTime, endTime, title, defaultExpanded } = props;

  const [fetching, setFetching] = useState(true);
  const [hasNextPage, setHasNextPage] = useState(false);

  const { riskType, getTeamGroupCodes, group } = RiskManagementContainer.useContainer();
  const {
    user,
    setTrailServiceDialogOpen,
    setInstitutionAuthenticationDialog,
    setActiveServiceDialogOpen,
  } = UserContainer.useContainer();
  const [page, setPage] = useState(1);
  const [channelDatas, setChannelDatas] = useState<ChannelData[]>([]);
  const [isLastCardExpanded, setIsLastCardExpanded] = useState(false);
  const { openSnackbar } = SnackbarContainer.useContainer();

  const [teamChannelDataQueryResult, executeTeamChannelDataQuery] = useTeamChannelDataQuery({
    variables: {
      first: pageSize,
      after: page == 1 ? undefined : btoa(`${(page - 1) * pageSize}`),
      dataID: "data_id_risk",
      teamGroupCodes: getTeamGroupCodes(),
      startDate: format(Number(startTime), "yyyyMMdd"),
      endDate: format(Number(endTime), "yyyyMMdd"),
    },
    pause: true,
  });
  const [userFollowedChannelDataQuery, executeUserFollowedChannelDataQuery] = useUserFollowedChannelDataQuery({
    variables: {
      first: pageSize,
      after: page == 1 ? undefined : btoa(`${(page - 1) * pageSize}`),
      dataID: "data_id_risk",
      groupID: group?.groupID,
      startDate: format(Number(startTime), "yyyyMMdd"),
      endDate: format(Number(endTime), "yyyyMMdd"),
    },
    pause: true,
  });

  function onLoadMoreClick(): void {
    if (hasNextPage && !fetching) {
      setPage((oldValue) => oldValue + 1);
    }
  }

  function summaryTag(): string {
    if (title === "今日" || format(Number(startTime), "yyyyMMdd") === format(Number(endTime), "yyyyMMdd")) {
      return "当日";
    }
    if (title === "近 30 日") {
      return "近 30 日";
    }
    return "当月";
  }

  function summaryItems(jsonString: string): CommonAccordionSummaryItemProps[] | undefined {
    try {
      const items: object[] = JSON.parse(jsonString);
      const heading = summaryTag();
      return items.map((item: object) => {
        return {
          heading: heading,
          subheading: item["title"],
          value: item["value"],
        };
      });
    } catch (error) {
      return undefined;
    }
  }

  useEffect(() => {
    setPage(1);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [group]);

  useEffect(() => {
    setFetching(true);
    if (riskType == "favors" || riskType == "groups") {
      executeUserFollowedChannelDataQuery();
      return;
    }
    executeTeamChannelDataQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page, group]);

  // 机构
  useEffect(() => {
    if (teamChannelDataQueryResult.fetching) {
      return;
    }
    if (teamChannelDataQueryResult.error) {
      setFetching(false);
      setHasNextPage(false);
      const errorRes = parseError(teamChannelDataQueryResult.error);
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
      return;
    }
    if (teamChannelDataQueryResult.data) {
      const nodes = teamChannelDataQueryResult.data.teamChannelData?.nodes || [];
      if (page === 1) {
        setChannelDatas(nodes);
      } else {
        setChannelDatas((oldValue) => {
          const newValue = Array.from(oldValue);
          return newValue.concat(nodes);
        });
      }
      if (nodes.length < pageSize) {
        setHasNextPage(false);
      } else {
        setHasNextPage(true);
      }
      setFetching(false);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [teamChannelDataQueryResult]);

  // 关注
  useEffect(() => {
    if (userFollowedChannelDataQuery.fetching) {
      return;
    }
    if (userFollowedChannelDataQuery.error) {
      setFetching(false);
      setHasNextPage(false);
      const errorRes = parseError(userFollowedChannelDataQuery.error);
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
      return;
    }
    if (userFollowedChannelDataQuery.data) {
      const nodes = userFollowedChannelDataQuery.data.userFollowedChannelData?.nodes || [];
      if (page === 1) {
        setChannelDatas(nodes);
      } else {
        setChannelDatas((oldValue) => {
          const newValue = Array.from(oldValue);
          return newValue.concat(nodes);
        });
      }
      if (nodes.length < pageSize) {
        setHasNextPage(false);
      } else {
        setHasNextPage(true);
      }
      setFetching(false);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [userFollowedChannelDataQuery]);

  function noData(): ReactNode {
    return (
      <div className={classes.noDataBox}>
        <CommonAccordionPlaceholder />
      </div>
    );
  }

  function sectionComponent(): ReactNode {
    return (
      <div>
        {channelDatas.map((item, index) => {
          return (
            <RiskCard
              key={index}
              data={{
                id: item.entityID,
                type: item.entityType,
                logo: item.portraitURL as string,
                name: item.entityName,
              }}
              filter={{ startTime: startTime, endTime: endTime }}
              defaultExpanded={defaultExpanded && index === 0}
              summaryItems={summaryItems(item.jsonValue as string)}
              onChange={(_, expanded: boolean): void => {
                if (index === channelDatas.length - 1) {
                  setIsLastCardExpanded(expanded);
                }
              }}
            />
          );
        })}
        {hasNextPage && (
          <div
            className={clsx(classes.loadMore, isLastCardExpanded ? classes.loadMoreAlone : undefined)}
            onClick={(): void => {
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
              onLoadMoreClick();
            }}
          >
            {fetching ? (
              <CircularProgress color="primary" className={classes.loadingIcon} size={30} />
            ) : (
              <>
                <Typography className={classes.loadMoreText} color="primary">
                  更多风险企业
                </Typography>
                <ChevronDown fontSize="small" color="primary" />
              </>
            )}
          </div>
        )}
      </div>
    );
  }

  function skelectonComponent(): ReactNode {
    return <Skeleton variant="rect" height={300} />;
  }

  return (
    <div className={classes.root}>
      <Typography className={classes.title}>{title}</Typography>
      {fetching && !channelDatas.length ? skelectonComponent() : channelDatas.length ? sectionComponent() : noData()}
    </div>
  );
};

export default RiskSection;
