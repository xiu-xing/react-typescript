import { useState, useEffect } from "react";
import { createContainer } from "unstated-next";
import React from "react";
import { useGetTemplateFileQuery, useTeamGroupOverviewQuery, Role } from "../../generated/graphql";
import UserContainer from "../../containers/userContainer";
export enum InstitutionType {
  CorporateEntity = "institutional_subject",
  FOF = "fof",
  Fund = "fund",
  InvestedFund = "invested_fund",
  InvestedCompany = "invested_company",
  FundInvestedCompany = "invested_fund_investments",
  LP = "lp",
  CoInvestor = "co_ins_investor",
  Vertical = "vertical_preference",
}

export const fileImportedTypes = [
  {
    name: "机构主体",
    groupCode: InstitutionType.CorporateEntity,
  },
  {
    name: "母基金",
    groupCode: InstitutionType.FOF,
  },
  {
    name: "基金",
    groupCode: InstitutionType.Fund,
  },
  {
    name: "对外投资基金",
    groupCode: InstitutionType.InvestedFund,
  },
  {
    name: "项目企业",
    groupCode: InstitutionType.InvestedCompany,
  },
  {
    name: "对外投资基金项目",
    groupCode: InstitutionType.FundInvestedCompany,
  },
  {
    name: "LP",
    groupCode: InstitutionType.LP,
  },
  {
    name: "同行机构",
    groupCode: InstitutionType.CoInvestor,
  },
  {
    name: "投资方向",
    groupCode: InstitutionType.Vertical,
  },
];

export const tableConfigs = [
  { id: "saic.team_group_corporate_entity", type: InstitutionType.CorporateEntity },
  { id: "pevc.team_group_fof", type: InstitutionType.FOF },
  { id: "pevc.team_group_fund", type: InstitutionType.Fund },
  { id: "pevc.team_group_invested_fund", type: InstitutionType.InvestedFund },
  { id: "pevc.team_group_invested_company", type: InstitutionType.InvestedCompany },
  { id: "pevc.team_group_invested_fund_investments", type: InstitutionType.FundInvestedCompany },
  { id: "pevc.team_group_lp", type: InstitutionType.LP },
  { id: "pevc.team_group_co_ins_investor", type: InstitutionType.CoInvestor },
  { id: "pevc.team_group_vertical_preference", type: InstitutionType.Vertical },
];

// eslint-disable-next-line @typescript-eslint/class-name-casing
export interface confirmItem {
  count: string;
  groupCode: string;
}
// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useInstitution() {
  const { user } = UserContainer.useContainer();
  const [isProRole] = useState<boolean>(user?.role === Role.Active);
  const [institutionChildrenType, setInstitutionChildrenType] = useState(InstitutionType.CorporateEntity);
  const [topHeight, setTopHeight] = useState<number>(250);
  const [groupTotalMap, setGroupTotalMap] = useState<Map<string, number>>(new Map());
  const [mockData, setMockData] = useState<Array<confirmItem>>([]);
  const [resourceKey, setResourceKey] = useState("");
  const [taskID, setTaskID] = useState("");
  const [isCallLittleBell, setIsCallLittleBell] = useState(true);
  const [confirmDialogOpen, setConfirmDialogOpen] = useState(false);
  const [refreshTable, setRefreshTable] = useState<boolean>(true);
  const [fileUpload, setFileUpload] = useState<boolean>(true);
  const [failDialogOpen, setFailDialogOpen] = useState(false);
  const [findGetTemplateFileQueryResult] = useGetTemplateFileQuery({
    requestPolicy: "network-only",
  });
  const [TeamGroupOverviewQueryResult, executeTeamGroupOverviewQuery] = useTeamGroupOverviewQuery();

  const [anchorEl, setAnchorEl] = React.useState<HTMLButtonElement | null>(null);

  const [errorCode, setErrorCode] = useState("");
  const [errorMessage, setErrorMessage] = useState("");

  useEffect(() => {
    if (findGetTemplateFileQueryResult.data?.getTemplateFileResourceKey) {
      setResourceKey(findGetTemplateFileQueryResult.data.getTemplateFileResourceKey);
    }
  }, [findGetTemplateFileQueryResult]);

  function funcId(type: InstitutionType): string {
    switch (type) {
      case InstitutionType.CorporateEntity:
        return "saic.institution_corporate_entity";
      case InstitutionType.FOF:
        return "pevc.institution_fof";
      case InstitutionType.Fund:
        return "pevc.institution_fund";
      case InstitutionType.InvestedFund:
        return "pevc.institution_invested_fund";
      case InstitutionType.InvestedCompany:
        return "pevc.institution_invested_company";
      case InstitutionType.FundInvestedCompany:
        return "pevc.institution_invested_fund_investments";
      case InstitutionType.LP:
        return "pevc.institution_lp";
      case InstitutionType.CoInvestor:
        return "pevc.institution_co_ins_investor";
      case InstitutionType.Vertical:
        return "pevc.institution_vertical_preference";
      default:
        return "";
    }
  }

  function getTypeName(type: string): string {
    switch (type) {
      case "fund_manager":
        return "机构主体";
      case InstitutionType.CorporateEntity.toString():
        return "机构主体";
      case InstitutionType.FOF.toString():
        return "母基金";
      case InstitutionType.Fund.toString():
        return "基金";
      case InstitutionType.InvestedFund.toString():
        return "对外投资基金";
      case InstitutionType.InvestedCompany.toString():
        return "项目企业";
      case InstitutionType.FundInvestedCompany.toString():
        return "对外投资基金项目";
      case InstitutionType.LP.toString():
        return "LP";
      case InstitutionType.CoInvestor.toString():
        return "同行机构";
      case InstitutionType.Vertical.toString():
        return "投资方向";
      default:
        return "";
    }
  }

  function popoverCloseHandler(): void {
    setAnchorEl(null);
  }

  return {
    institutionChildrenType,
    setInstitutionChildrenType,
    funcId,
    topHeight,
    setTopHeight,
    groupTotalMap,
    setGroupTotalMap,
    mockData,
    setMockData,
    taskID,
    setTaskID,
    resourceKey,
    setResourceKey,
    getTypeName,
    confirmDialogOpen,
    setConfirmDialogOpen,
    TeamGroupOverviewQueryResult,
    executeTeamGroupOverviewQuery,
    isCallLittleBell,
    setIsCallLittleBell,
    refreshTable,
    setRefreshTable,
    anchorEl,
    setAnchorEl,
    popoverCloseHandler,
    errorCode,
    setErrorCode,
    errorMessage,
    setErrorMessage,
    failDialogOpen,
    setFailDialogOpen,
    fileUpload,
    setFileUpload,
    isProRole,
  };
}

const InstitutionContainer = createContainer(useInstitution);
export default InstitutionContainer;
