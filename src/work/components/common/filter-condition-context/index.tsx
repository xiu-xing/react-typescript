import { isEmpty } from "lodash";
import React, { createContext, useContext, useMemo } from "react";
import {
  FilterInputs,
  FilterOption,
  MultiSelectorFilterInput,
  RealmSuggestion,
  SelectorFilterInput,
  SuggestionFilterInput,
} from "../../../generated/graphql";

export type FilterConditionInputType =
  | (SelectorConditionInput & { type?: "Selector" })
  | (MultiSelectorConditionInput & { type?: "MultiSelector" })
  | (SuggestionConditionInput & { type?: "Suggestion" })
  | null;

export interface FilterConditionInputs {
  suggestion?: SuggestionConditionInput[];
  selectors?: SelectorConditionInput[];
  multiSelectors?: MultiSelectorConditionInput[];
}

export interface SelectorConditionInput {
  filterID: string;
  filterName?: string;
  operator?: string;
  filterValue?: FilterOption;
}

export interface MultiSelectorConditionInput {
  filterID: string;
  filterName?: string;
  operator?: string;
  filterValues: FilterOption[];
}

export interface SuggestionConditionInput {
  filterID: string;
  filterName?: string;
  filterValues: RealmSuggestion[];
}

const Context = createContext<FilterConditionInputs>({});
interface FilterConditionContextProps {
  value: FilterConditionInputs;
}

const FilterConditionContext: React.FC<FilterConditionContextProps> = (props) => {
  const { value, children } = props;

  const context = useMemo(() => value, [value]);

  return <Context.Provider value={context}>{children}</Context.Provider>;
};

export default FilterConditionContext;

export const useFilterConditionContext = () => useContext(Context);

export interface TranscodeOption {
  transcodeSuggestionFunc?: (v: RealmSuggestion) => string;
}

export function transcodeFilterConditionInputs(
  inputs?: FilterConditionInputs,
  options?: TranscodeOption,
): FilterInputs | undefined {
  if (!inputs) {
    return undefined;
  }
  const res: FilterInputs = {};

  if (inputs.selectors && inputs.selectors.length > 0) {
    res.selectorFilterInputs = inputs.selectors.map(
      (v) =>
        ({
          filterValue: v.filterValue?.value,
          displayValue: v.filterName,
          name: v.filterName,
          operator: v.operator,
          filterID: v.filterID,
        } as SelectorFilterInput),
    );
  }

  if (inputs.multiSelectors && inputs.multiSelectors.length > 0) {
    res.multiSelectorFilterInputs = inputs.multiSelectors.map(
      (v) =>
        ({
          filterValues: v.filterValues.map((v) => v.value),
          displayValue: v.filterName,
          name: v.filterName,
          operator: v.operator,
          filterID: v.filterID,
        } as MultiSelectorFilterInput),
    );
  }

  if (inputs.suggestion) {
    res.suggestionFilterInput = inputs.suggestion.map(
      (v) =>
        ({
          filterID: v.filterID,
          name: v.filterName,
          displayValue: v.filterName,
          values: v.filterValues.map(options?.transcodeSuggestionFunc ?? ((v) => v.id)),
        } as SuggestionFilterInput),
    );
  }

  return isEmpty(res) ? undefined : res;
}

export function hasConditionActive(inputs?: FilterConditionInputs): boolean {
  if (!inputs) {
    return false;
  }

  if (inputs.selectors && inputs.selectors.length > 0) {
    return true;
  }

  if (inputs.multiSelectors && inputs.multiSelectors.length > 0) {
    return true;
  }

  if (inputs.suggestion && inputs.suggestion.length > 0) {
    return true;
  }

  return false;
}
