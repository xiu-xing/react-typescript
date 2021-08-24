import { useClient } from "@momentum-valley/muse-js";
import { useRouter } from "next/router";
import { useEffect, useMemo, useState } from "react";
import { createContainer } from "unstated-next";
import ConfigContainer from "../../containers/configContainer";
import { CollectionGroupWithItemCount, RiskNode } from "../../generated/graphql";
import { TagConfigModel } from "../../models/risk/tagsConfigModel";

export enum RiskRouterType {
  Search,
  Institution,
  Companies,
  Favors,
  Groups,
}

export interface SearchEntityResult {
  id: string;
  entityType: string;
  name: string;
  logo: string;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useRiskManagement() {
  const query = useRouter().query;
  const riskType: string = query.riskType as string;
  const { riskManagementConfig } = ConfigContainer.useContainer();
  const muse = useClient();
  const tagsConfig = useMemo(() => {
    return TagConfigModel.fromJSON(riskManagementConfig || {});
  }, [riskManagementConfig]);
  const tagParentIds = useMemo((): string[] => {
    const ids: string[] = [];
    tagsConfig.tagParents.forEach((_, key: string) => {
      ids.push(key);
    });
    return ids;
  }, [tagsConfig]);
  const tagIds = useMemo((): string[] => {
    const ids: string[] = [];
    tagsConfig.tags.forEach((_, key: string) => {
      ids.push(key);
    });
    return ids;
  }, [tagsConfig]);

  // 时间戳
  const [dateFilter, setDateFilter] = useState<string>(`${new Date().getTime()}`);
  const [selectedTagParentIds, setSelectedTagParentIds] = useState<string[]>(tagParentIds);
  const [selectedTagIds, setSelectedTagIds] = useState(tagIds);

  // 搜索的实体
  const defaultSearchEntity: SearchEntityResult | undefined = useMemo(() => {
    if (riskType !== "search") {
      return undefined;
    }
    if (!(query.id && query.type && query.name)) {
      return undefined;
    }
    return {
      id: query.id as string,
      entityType: query.type as string,
      name: decodeURIComponent(query.name as string),
      logo: query.logo ? decodeURIComponent(query.logo as string) : "",
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [query]);
  const [searchEntity, setSearchEntity] = useState<SearchEntityResult | undefined>(defaultSearchEntity);

  // 分组
  const defaultGroup: CollectionGroupWithItemCount | undefined = useMemo(() => {
    if (riskType !== "groups") {
      return undefined;
    }
    if (!(query.id && query.name)) {
      return undefined;
    }
    return {
      __typename: "CollectionGroupWithItemCount",
      groupID: query.id as string,
      groupName: decodeURIComponent(query.name as string),
      itemCount: 0,
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [query]);
  const [group, setGroup] = useState<CollectionGroupWithItemCount | undefined>(defaultGroup);

  // 查看详情的数据和对话框
  const [riskDetail, setRiskDetail] = useState<RiskNode>();
  const [riskDetailDialogOpen, setRiskDetailDialogOpen] = useState(false);

  const [eventFilterDialogOpen, setEventFilterDialogOpen] = useState(false);

  const [searchDialogOpen, setSearchDialogOpen] = useState(false);
  const [groupDialogOpen, setGroupDialogOpen] = useState(false);

  function getTeamGroupCodes(): string[] {
    switch (riskType) {
      // 机构主体和基金
      case "institution":
        return ["corporate_entity", "fund"];
      // 已投项目
      case "companies":
        return ["invested_company"];
      // 关联项目
      case "fund-companies":
        return ["invested_fund_investments"];
      default:
        return [];
    }
  }

  useEffect(() => {
    if (riskDetail) {
      setRiskDetailDialogOpen(true);
    }
  }, [riskDetail]);

  useEffect(() => {
    if (!riskDetailDialogOpen) {
      setRiskDetail(undefined);
    }
  }, [riskDetailDialogOpen]);

  useEffect(() => {
    if (searchEntity) {
      muse.sendTrackingEvent("risk_management.risks_by_entity", {
        entity: {
          id: searchEntity.id,
          type: searchEntity.entityType,
        },
      });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [searchEntity]);

  return {
    riskType,
    dateFilter,
    setDateFilter,
    tagsConfig,
    selectedTagParentIds,
    setSelectedTagParentIds,
    selectedTagIds,
    setSelectedTagIds,
    tagParentIds,
    tagIds,
    eventFilterDialogOpen,
    setEventFilterDialogOpen,
    searchEntity,
    setSearchEntity,
    getTeamGroupCodes,
    group,
    setGroup,

    riskDetail,
    setRiskDetail,
    riskDetailDialogOpen,
    setRiskDetailDialogOpen,
    searchDialogOpen,
    setSearchDialogOpen,
    groupDialogOpen,
    setGroupDialogOpen,
  };
}

const RiskManagementContainer = createContainer(useRiskManagement);
export default RiskManagementContainer;
