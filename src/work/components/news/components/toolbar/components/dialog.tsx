import React from "react";
import { EntityType, Suggestion, SuggestType } from "../../../../../generated/graphql";
import SearchDialog from "../../../../common/search-dialog/search-dialog";
import NewsContainer from "../../../newsContainer";
import ToolbarContainer from "../toolbarContainer";
const Dialog: React.FunctionComponent = () => {
  const { keywords, setKeywords, entities, setEntities } = NewsContainer.useContainer();
  const { search, setSearch } = ToolbarContainer.useContainer();

  // 搜索并选中
  function onSearchSelected(suggestion?: Suggestion, keyword?: string): void {
    if (suggestion) {
      const findEntity = entities.find((value) => value.id == suggestion.id);
      !findEntity &&
        setEntities((oldValue) => {
          const newValue = Array.from(oldValue);
          newValue.push({
            id: suggestion.id,
            primaryName: suggestion.primaryName,
            entityType: suggestion.entityType as EntityType,
          });
          return newValue;
        });
      return;
    }
    if (keyword) {
      const findKeyword = keywords.find((value) => value === keyword);
      !findKeyword &&
        setKeywords((oldValue) => {
          const newValue = Array.from(oldValue);
          newValue.push(keyword);
          return newValue;
        });
      return;
    }
  }

  return (
    <SearchDialog
      open={search}
      setOpen={setSearch}
      searchGroups={[
        {
          name: "行业赛道",
          suggestTypes: [SuggestType.SuggestTypeVertical],
        },
        {
          name: "组织",
          suggestTypes: [SuggestType.SuggestTypeOrganization],
        },
        {
          name: "人物",
          suggestTypes: [SuggestType.SuggestTypePerson],
        },
      ]}
      showKeyword
      onSelected={onSearchSelected}
    />
  );
};

export default Dialog;
