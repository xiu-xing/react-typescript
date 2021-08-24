import { createContainer } from "unstated-next";
import { useState } from "react";
import { TagsProps } from "../../../../../models/risk/configModel";
import RiskManagementContainer from "../../../riskManagementContainer";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useEventTypeFilter() {
  const { tagsConfig, tagParentIds, tagIds } = RiskManagementContainer.useContainer();

  const [currentTags, setCurrentTags] = useState<TagsProps[]>([]);

  // 第一栏的激活项
  const [activeTagParentId, setActiveTagParent] = useState<string>(tagParentIds[0]);
  // 选择全部的项
  const [selectedTagParentIds, setSelectedTagParentIds] = useState<string[]>(tagParentIds);
  // 选中的项
  const [selectedTagIds, setSelectedTagIds] = useState<string[]>(tagIds);

  return {
    tagsConfig,
    activeTagParentId,
    setActiveTagParent,
    currentTags,
    setCurrentTags,
    selectedTagParentIds,
    setSelectedTagParentIds,
    selectedTagIds,
    setSelectedTagIds,
  };
}

const EventTypeFilterContainer = createContainer(useEventTypeFilter);

export default EventTypeFilterContainer;
