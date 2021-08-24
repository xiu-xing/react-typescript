import { Button, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { ArrowRightCircle, Filter, Refresh } from "mdi-material-ui";
import React, { ReactNode, useEffect } from "react";
import EntityAvatar from "../../../common/entity-avatar-next/entity-avatar";
import RiskManagementContainer from "../../riskManagementContainer";
import DateFilter from "../filters/date-filter";
import EventTypeFilterDialog from "../filters/event-type-filter/event-type-filter-dialog";
import RiskList from "../risk-list/risk-list";

import Toolbar from "../toolbar";
import { Role } from "../../../../generated/graphql";
import UserContainer from "../../../../containers/userContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    contentBox: {
      width: 1100,
      marginLeft: 6,
    },
    filterButton: {
      color: "#333",
    },
    filterText: {
      fontSize: 14,
      marginLeft: 4,
    },
    dateFilter: {
      marginLeft: 24,
    },
    titleBox: {
      display: "flex",
      alignItems: "center",
      paddingLeft: 16,
    },
    logo: {
      width: 30,
      height: 30,
    },
    title: {
      fontSize: 20,
      marginRight: 16,
      marginLeft: 8,
    },
    button: {},
    buttonIcon: {
      fontSize: 18,
    },
    buttonText: {
      fontSize: 14,
      marginLeft: 4,
    },
  }),
);

/**
 * 搜索页
 * 搜索页比较逻辑独立
 */
const RiskSearchPage: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const {
    user,
    setTrailServiceDialogOpen,
    setInstitutionAuthenticationDialog,
    setActiveServiceDialogOpen,
  } = UserContainer.useContainer();

  const {
    setEventFilterDialogOpen,
    setDateFilter,
    searchEntity,
    setSearchDialogOpen,
    selectedTagParentIds,
    selectedTagIds,
    tagParentIds,
  } = RiskManagementContainer.useContainer();

  function onDateChange(dateTime: string): void {
    setDateFilter(dateTime);
  }

  function searchTitle(): ReactNode {
    if (!searchEntity) {
      return "搜索";
    }
    return (
      <div className={classes.titleBox}>
        <EntityAvatar className={classes.logo} src={searchEntity?.logo} />
        <Typography className={classes.title}>{searchEntity?.name}</Typography>
        <Button
          className={classes.button}
          onClick={(): void => {
            setSearchDialogOpen(true);
          }}
        >
          <Refresh fontSize="small" color="primary" />
          <Typography className={classes.buttonText} color="primary">
            重新搜索
          </Typography>
        </Button>
        <Button
          style={{ marginLeft: 4 }}
          className={classes.button}
          onClick={(): void => {
            if (searchEntity) {
              window.open(`/profile?id=${searchEntity.id}&type=${searchEntity.entityType}`);
            }
          }}
        >
          <ArrowRightCircle color="primary" className={classes.buttonIcon} />
          <Typography color="primary" className={classes.buttonText}>
            查看详情
          </Typography>
        </Button>
      </div>
    );
  }

  const hasFilterActive = tagParentIds.length !== selectedTagParentIds.length;

  return (
    <>
      <Toolbar
        title={searchTitle()}
        action={
          <>
            <Button
              size="small"
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
                setEventFilterDialogOpen(true);
              }}
              className={classes.filterButton}
            >
              <Filter fontSize="small" color={hasFilterActive ? "primary" : undefined} htmlColor="#666" />
              <Typography className={classes.filterText} color={hasFilterActive ? "primary" : undefined}>
                {hasFilterActive ? `共 ${selectedTagIds.length} 种事件类型` : `事件类型`}
              </Typography>
            </Button>
            <DateFilter className={classes.dateFilter} placeholder="截止日期" onDateChange={onDateChange} />
          </>
        }
      />
      <div className={classes.contentBox}>
        <RiskList />
      </div>
      <EventTypeFilterDialog />
    </>
  );
};

export default RiskSearchPage;
