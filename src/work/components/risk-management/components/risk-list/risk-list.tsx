import { CircularProgress, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { format } from "date-fns";
import React, { ReactNode, useEffect, useState } from "react";
import { OperationResult, useClient } from "urql";
import UserContainer from "../../../../containers/userContainer";
import { EntityType, RiskDocument, RiskNode, RiskQuery, Role } from "../../../../generated/graphql";
import { parseError } from "../../../../utils/error";
import { isAccessError } from "../../../../utils/errorHandler";
import { useReachPageBottom } from "../../../../utils/hooks";
import CommonAccordionPlaceholder from "../../../common/accordion/components/placeholder";
import RiskManagementContainer from "../../riskManagementContainer";
import RiskItem from "./components/risk-item";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    itemBox: {},
    riskItem: {},
    dataCell: {
      display: "flex",
      justifyContent: "flex-start",
      alignItems: "center",
    },
    tag: {
      marginRight: 12,
    },
    actionBox: {
      cursor: "pointer",
      color: theme.palette.primary.main,
      fontSize: 14,

      display: "flex",
      alignItems: "center",
    },
    actionIcon: {
      marginLeft: 4,
    },
    loadMoreBox: {
      fontSize: 12,
      textAlign: "center",
      margin: "24px 0",
    },
    loadingIcon: {
      width: 32,
      height: 32,
    },
    loadMoreText: {
      fontSize: 12,
    },
    skeletonBox: {
      display: "grid",
      gridRowGap: 16,
      padding: "16px 0",
    },
  }),
);

const PAGE_SIZE = 10;
const RiskList: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const {
    user,
    setInstitutionAuthenticationDialog,
    setTrailServiceDialogOpen,
    setActiveServiceDialogOpen,
  } = UserContainer.useContainer();
  const { searchEntity, selectedTagIds, tagIds, dateFilter } = RiskManagementContainer.useContainer();

  const [page, setPage] = useState(1);
  const [isFirstLoaded, setIsFirstLoaded] = useState(true);
  const [hasNextPage, setHasNextPage] = useState(true);
  const [fetching, setFetching] = useState(false);
  const [risks, setRisks] = useState<RiskNode[]>([]);
  const [riskQueryResult, setRiskQueryResult] = useState<OperationResult<RiskQuery>>();
  const client = useClient();
  function executeRiskQuery(): void {
    client
      .query(RiskDocument, {
        first: PAGE_SIZE,
        after: page !== 1 ? btoa(`${(page - 1) * PAGE_SIZE}`) : undefined,
        filter: {
          entityRequest: {
            entityId: searchEntity?.id || "",
            entityType: searchEntity?.entityType as EntityType,
          },
          endTime: format(Number(dateFilter), "yyyy-MM-dd HH:mm:ss"),
          tagIDs: selectedTagIds.length === tagIds.length ? undefined : selectedTagIds,
        },
      })
      .toPromise()
      .then((res) => {
        setRiskQueryResult(res);
      });
  }

  function scrollToTop(): void {
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
  }

  // 下拉加载
  function loadMore(): void {
    if (fetching || !hasNextPage) {
      return;
    }

    setPage((oldValue) => oldValue + 1);
  }

  function executeQuery(): void {
    if (searchEntity) {
      // execute query
      setFetching(true);
      setIsFirstLoaded(false);
      executeRiskQuery();
    }
  }

  // 滑动事件，监听是否滑倒底部，进行数据加载
  // const scrollHandler = _.throttle(() => {
  //   if (
  //     document.documentElement.scrollTop ==
  //     document.documentElement.scrollHeight - document.documentElement.clientHeight
  //   ) {
  //     loadMore();
  //   }
  // }, 100);

  // 滑动事件监听
  useReachPageBottom({
    pause: !(hasNextPage || fetching),
    callBack: loadMore,
  });
  // useEffect(() => {
  //   if (hasNextPage) {
  //     window.addEventListener("scroll", scrollHandler);
  //     return (): void => {
  //       window.removeEventListener("scroll", scrollHandler);
  //     };
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [hasNextPage]);

  useEffect(() => {
    scrollToTop();
    if (page == 1 && !isFirstLoaded) {
      executeQuery();
      return;
    }
    setPage(1);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [searchEntity, selectedTagIds, dateFilter]);

  useEffect(() => {
    // execute query
    executeQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page]);

  // 数据处理
  useEffect(() => {
    if (!riskQueryResult) {
      return;
    }
    if (riskQueryResult.error) {
      const error = parseError(riskQueryResult.error);
      if (isAccessError(error.code)) {
        if (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
          setInstitutionAuthenticationDialog(true);
        }
        if (user?.role == Role.Basic) {
          setTrailServiceDialogOpen(true);
        }
        if (user?.role == Role.Expired) {
          setActiveServiceDialogOpen(true);
        }
        setFetching(false);
        return;
      }
    }
    if (riskQueryResult.data) {
      const nodes = riskQueryResult.data.risk.nodes || [];
      const riskList: RiskNode[] = [];
      nodes.forEach((value) => {
        if (value) {
          riskList.push(value);
        }
      });
      if (page == 1) {
        setRisks(riskList);
      } else {
        setRisks((oldValue) => oldValue.concat(riskList));
      }
      setHasNextPage(nodes.length == PAGE_SIZE);
      setFetching(false);
      return;
    }
    if (riskQueryResult.error) {
      setFetching(false);
      setHasNextPage(false);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [riskQueryResult]);

  function loadingStatus(): ReactNode {
    if (!searchEntity) {
      return (
        <div className={classes.loadMoreBox}>
          <CommonAccordionPlaceholder />
        </div>
      );
    }
    if (fetching) {
      return (
        <div className={classes.loadMoreBox}>
          <CircularProgress className={classes.loadingIcon} color="primary" size="small" />
        </div>
      );
    }
    if (hasNextPage) {
      return null;
    }
    if (risks.length) {
      return (
        <div className={classes.loadMoreBox}>
          <Typography className={classes.loadMoreText}>滑到底啦！</Typography>
        </div>
      );
    }
    return (
      <div className={classes.loadMoreBox}>
        <CommonAccordionPlaceholder />
      </div>
    );
  }

  return (
    <div className={classes.root}>
      {risks.map((risk, index) => {
        return (
          <RiskItem
            classes={{ root: classes.riskItem }}
            key={index}
            entityID={searchEntity?.id}
            entityType={searchEntity?.entityType}
            primaryName={searchEntity?.name}
            data={risk}
            showAction
          />
        );
      })}
      <>{loadingStatus()}</>
    </div>
  );
};

export default RiskList;
