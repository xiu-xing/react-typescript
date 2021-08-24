import React, { useMemo } from "react";
import { Filter, RealmSuggestion, SuggestionFilterInput } from "../../../generated/graphql";
import { FilterConditionInputType } from "../filter-condition-context";
import { FilterInputType } from "../filter-item";
import SelectorFilter, { SelectorFilterOwnerProps } from "./selector-filter";
import SuggestionFilter, { SuggestionFilterOwnerProps } from "./suggestion-filter/suggestion-filter";

export interface FilterConditionItemCommonProps {
  onChange?: (value: FilterConditionInputType) => void;
}

interface FilterConditionItemProps extends FilterConditionItemCommonProps {
  filter: Filter;
  suggestionFilterProps?: SuggestionFilterOwnerProps;
  selectorFilterProps?: SelectorFilterOwnerProps;
}

const FilterConditionItem: React.FunctionComponent<FilterConditionItemProps> = (props) => {
  const { filter, suggestionFilterProps, selectorFilterProps, ...restProps } = props;

  const contentComponent = useMemo(() => {
    switch (filter.__typename) {
      case "SelectorFilter": {
        return <SelectorFilter filter={filter} {...selectorFilterProps} {...restProps} />;
      }
      case "SuggestionFilter":
        return <SuggestionFilter filter={filter} {...suggestionFilterProps} {...restProps} />;
      default: {
        return null;
      }
    }
  }, [props]);

  return contentComponent;
};

export default FilterConditionItem;
