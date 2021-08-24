import React, { ReactNode } from "react";
import { Filter } from "../../../generated/graphql";
import { FilterConditionInputs, FilterConditionInputType } from "../filter-condition-context";
import MultiSelectorFilterResult from "./multi-selector-filter-result";
import SelectorFilterResult from "./selector-filter-result";
import SuggestionFilterResult from "./suggestion-filter-result";

export interface FilterResultItemCommonProps {
  onDelete: (value: FilterConditionInputType, deleted?: boolean) => void;
}

interface FilterResultItemProps extends FilterResultItemCommonProps {
  filter: Filter;
  filterInputs: FilterConditionInputs;
}

const FilterResultItem: React.FunctionComponent<FilterResultItemProps> = (props) => {
  const { filter, filterInputs, ...restProps } = props;

  function contentComponent(): ReactNode {
    switch (filter.__typename) {
      case "SelectorFilter":
        if (filter.multiple) {
          const input = filterInputs.multiSelectors?.find((v) => v?.filterID == filter.id);
          return <MultiSelectorFilterResult input={input ?? undefined} {...restProps} />;
        } else {
          const input = filterInputs.selectors?.find((v) => v?.filterID == filter.id);
          return <SelectorFilterResult input={input ?? undefined} {...restProps} />;
        }
      case "SuggestionFilter": {
        const input = filterInputs.suggestion?.find((v) => v?.filterID == filter.id);
        if (!input) {
          return null;
        }

        return <SuggestionFilterResult input={input ?? undefined} {...restProps} />;
      }
      default:
        return null;
    }
  }

  return <>{contentComponent()}</>;
};

export default FilterResultItem;
