import React, { useMemo } from "react";
import {
  CheckboxFilterInput,
  DateFilterInput,
  DateRangeFilterInput,
  DateRangeSelectorFilterInput,
  Filter,
  FilterOption,
  MultiSelectorFilterInput,
  SelectorFilterInput,
  SuggestionFilterInput,
} from "../../../generated/graphql";
import CheckBoxFilter from "./check-box-filter";
import DatePickerFilter from "./date-picker-filter";
import DateRangeFilter from "./date-range-filter";
import DateRangeSelectFilter from "./date-range-select-filter";
import NestedCheckBoxFilter from "./nested-check-box-filter";
import SelectFilter from "./select-filter";

export type FilterInputType =
  | (SelectorFilterInput & { type?: "SelectorFilterInput" })
  | (DateFilterInput & { type?: "DateFilterInput" })
  | (CheckboxFilterInput & { type?: "CheckboxFilterInput" })
  | (DateRangeFilterInput & { type?: "DateRangeFilterInput" })
  | (MultiSelectorFilterInput & { type?: "MultiSelectorFilterInput" })
  | (DateRangeSelectorFilterInput & { type?: "DateRangeSelectorFilterInput" })
  | (SuggestionFilterInput & { type?: "SuggestionFilterInput" })
  | null;

export interface FilterItemCommonProps {
  onChange?: (value: FilterInputType) => void;
  disableLabel?: boolean;
}

interface FilterItemProps extends FilterItemCommonProps {
  filter: Filter;
}

const FilterItem: React.FunctionComponent<FilterItemProps> = (props) => {
  const { filter, ...restProps } = props;

  const contentComponent = useMemo(() => {
    switch (filter.__typename) {
      case "SelectorFilter": {
        return <SelectFilter filter={filter} {...restProps} />;
      }
      case "YearFilter": {
        return <DatePickerFilter filter={filter} {...restProps} type="year" />;
      }
      case "MonthFilter": {
        return <DatePickerFilter filter={filter} {...restProps} type="month" />;
      }
      case "DayFilter": {
        return <DatePickerFilter filter={filter} {...restProps} type="date" />;
      }
      case "CheckboxFilter": {
        return <CheckBoxFilter filter={filter} {...restProps} />;
      }
      case "NestedCheckboxFilter": {
        return <NestedCheckBoxFilter filter={filter} {...restProps} />;
      }
      case "DateRangeFilter": {
        return <DateRangeFilter filter={filter} {...restProps} />;
      }
      case "DateRangeSelectorFilter": {
        return <DateRangeSelectFilter filter={filter} {...restProps} />;
      }
      default: {
        return null;
      }
    }
  }, [props]);

  return contentComponent;
};

export default FilterItem;
