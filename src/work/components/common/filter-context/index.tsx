import { fi } from "date-fns/locale";
import React, { createContext, useContext, useMemo } from "react";
import { FilterInputs } from "../../../generated/graphql";

const Context = createContext<FilterInputs>({});
interface FilterContextProps {
  value: FilterInputs;
}

const FilterContext: React.FC<FilterContextProps> = (props) => {
  const { value, children } = props;

  const context = useMemo(() => value, [value]);

  return <Context.Provider value={context}>{children}</Context.Provider>;
};

export default FilterContext;

export const useFilterContext = () => useContext(Context);

export function hasFilterActive(filterInputs: FilterInputs): boolean {
  if (
    filterInputs.keywordFilterInput &&
    filterInputs.keywordFilterInput.keywords &&
    filterInputs.keywordFilterInput.keywords.length > 0
  ) {
    return true;
  }
  if (filterInputs.multiSelectorFilterInputs) {
    for (let index = 0; index < filterInputs.multiSelectorFilterInputs.length; index++) {
      const element = filterInputs.multiSelectorFilterInputs[index];
      if (element?.filterValues && element.filterValues.length > 0) {
        return true;
      }
    }
  }
  if (filterInputs.selectorFilterInputs) {
    for (let index = 0; index < filterInputs.selectorFilterInputs.length; index++) {
      const element = filterInputs.selectorFilterInputs[index];
      if (element?.filterValue) {
        return true;
      }
    }
  }
  if (filterInputs.checkboxFilterInputs) {
    for (let index = 0; index < filterInputs.checkboxFilterInputs.length; index++) {
      const element = filterInputs.checkboxFilterInputs[index];
      if (element?.values && element.values.length > 0) {
        return true;
      }
    }
  }
  if (filterInputs.dateFilterInputs) {
    for (let index = 0; index < filterInputs.dateFilterInputs.length; index++) {
      const element = filterInputs.dateFilterInputs[index];
      if (element?.timestamp) {
        return true;
      }
    }
  }
  if (filterInputs.dateRangeFilterInputs) {
    for (let index = 0; index < filterInputs.dateRangeFilterInputs.length; index++) {
      const element = filterInputs.dateRangeFilterInputs[index];
      if (element?.start || element?.end) {
        return true;
      }
    }
  }
  if (filterInputs.dateRangeSelectorFilterInput) {
    for (let index = 0; index < filterInputs.dateRangeSelectorFilterInput.length; index++) {
      const element = filterInputs.dateRangeSelectorFilterInput[index];
      if (element?.startTimestamp || element?.endTimestamp) {
        return true;
      }
    }
  }
  if (filterInputs.entityFilterInputs) {
    for (let index = 0; index < filterInputs.entityFilterInputs.length; index++) {
      const element = filterInputs.entityFilterInputs[index];
      if (element?.entityID && element?.entityType) {
        return true;
      }
    }
  }
  if (filterInputs.suggestionFilterInput) {
    for (let index = 0; index < filterInputs.suggestionFilterInput.length; index++) {
      const element = filterInputs.suggestionFilterInput[index];
      if (element?.values && element.values.length > 0) {
        return true;
      }
    }
  }
  return false;
}
