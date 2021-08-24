import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import React, { useMemo } from "react";
import AppContainer, { FixedTopStyleProps } from "../../containers/appContainer";
import UserContainer from "../../containers/userContainer";
import { CollectionGroupWithItemCount, Role, Suggestion, SuggestType } from "../../generated/graphql";
import BackTopFab from "../common/back-top-fab/back-top-fab";
// import SearchGroupsDialog from "../common/collection-groups-dialog/search-groups-dialog";
import Navigation from "../common/navigation/navigation";
import { NavigationItemProps } from "../common/navigation/navigation-item";
import { NavigationSectionProps } from "../common/navigation/navigation-subtitle";
import SearchDialog from "../common/search-dialog/search-dialog";
import EventDetailsDialog from "./components/event-detail/event-detail-dialog";
import RiskPage from "./components/risk-page/risk-page";
import RiskSearchPage from "./components/risk-search-page/risk-search-page";
import RiskManagementContainer from "./riskManagementContainer";
const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "grid",
      gridTemplateColumns: "minmax(max-content, 1fr) minmax(1124px, 5fr)",
      gridColumnGap: 40,
      alignItems: "end",
    },
    navigationBox: {
      position: "sticky",
      top: ({ fixedTopHeight }: FixedTopStyleProps): number => fixedTopHeight,
      justifySelf: "end",
      alignSelf: "start",
      paddingTop: 24,
      marginLeft: 24,
    },
    contentContainer: {
      alignSelf: "start",
    },
  }),
);

const RiskManagementDisplay: React.FunctionComponent<{}> = () => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const classes = useStyles({ fixedTopHeight });
  const {
    riskType,
    riskDetail,
    riskDetailDialogOpen,
    setRiskDetailDialogOpen,
    setSearchEntity,
    setGroup,
    searchDialogOpen,
    setSearchDialogOpen,
    groupDialogOpen,
    setGroupDialogOpen,
  } = RiskManagementContainer.useContainer();
  const { user } = UserContainer.useContainer();
  const muse = useClient();

  const riskItems: (NavigationItemProps | NavigationSectionProps)[] = useMemo(() => {
    const disableInstitution = user && (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium);
    return [
      { type: "item", name: "搜索", data: "search", switch: true },
      { type: "title", name: "我的机构" },
      { type: "item", name: "机构主体和基金", data: "institution", disable: disableInstitution },
      { type: "item", name: "已投项目", data: "companies", disable: disableInstitution },
      { type: "item", name: "对外投资基金项目", data: "fund-companies", disable: disableInstitution },
    ];
  }, [user]);

  function onSearchEntitySelected(suggestion?: Suggestion): void {
    if (!suggestion) {
      return;
    }
    if (riskType !== "search") {
      window.open(
        `/risk-management/search?id=${suggestion.id}&type=${suggestion.entityType}&name=${encodeURIComponent(
          suggestion.primaryName,
        )}&logo=${encodeURIComponent(suggestion.logo || "")}`,
        "_self",
      );
      return;
    }
    setSearchEntity({
      id: suggestion.id,
      name: suggestion.primaryName,
      entityType: `${suggestion.entityType}`,
      logo: suggestion.logo,
    });
  }

  function onGroupSelected(group: CollectionGroupWithItemCount): void {
    setGroup(group);
  }

  function onNavigatorChange(index: number, data: unknown): void {
    if (data === riskType) {
      return;
    }
    if (data === "search") {
      setSearchDialogOpen(true);
      return;
    }

    if (data) {
      muse.sendTrackingEvent("risk_management.tab_change", {
        tab: data as string,
      });
    }

    window.open(`/risk-management/${data}`, "_self");
  }

  return (
    <div className={classes.root}>
      <div className={classes.navigationBox}>
        <Navigation title="风控" isRouter activeRoute={riskType} items={riskItems} onChange={onNavigatorChange} />
      </div>
      <div className={classes.contentContainer}>{riskType === "search" ? <RiskSearchPage /> : <RiskPage />}</div>
      <BackTopFab />
      {riskDetail && (
        <EventDetailsDialog
          open={riskDetailDialogOpen}
          setOpen={setRiskDetailDialogOpen}
          tagCode={riskDetail.tagID}
          content={riskDetail.content as string}
        />
      )}
      <SearchDialog
        open={searchDialogOpen}
        setOpen={setSearchDialogOpen}
        searchGroups={[{ suggestTypes: [SuggestType.SuggestTypeCompany, SuggestType.SuggestTypeOrganization] }]}
        onSelected={onSearchEntitySelected}
      />
    </div>
  );
};

export default RiskManagementDisplay;
