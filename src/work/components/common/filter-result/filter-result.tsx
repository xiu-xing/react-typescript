import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import { Filter } from "../../../generated/graphql";
import { FilterConditionInputs, FilterConditionInputType, hasConditionActive } from "../filter-condition-context";
import Space from "../space";
import MultiSelectorFilterResult from "./multi-selector-filter-result";
import SelectorFilterResult from "./selector-filter-result";
import SuggestionFilterResult from "./suggestion-filter-result";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    filterResult: {
      paddingTop: 20,
      overflowY: "hidden",
      overflowX: "hidden",
    },
  }),
);

interface FilterResultProps {
  filters?: Filter[];
  inputs: FilterConditionInputs;
  onFilterChange: (filterInput: FilterConditionInputType) => void;
}

const FilterResult: React.FunctionComponent<FilterResultProps> = (props) => {
  const classes = useStyles();

  const { filters, inputs, onFilterChange } = props;

  function filterResultItemComponent(filter: Filter): ReactNode {
    switch (filter.__typename) {
      case "SelectorFilter":
        if (filter.multiple) {
          const input = inputs.multiSelectors?.find((v) => v?.filterID == filter.id);
          if (!input || !input.filterValues || input.filterValues.length == 0) {
            return null;
          }
          return (
            <MultiSelectorFilterResult key={filter.id || ""} input={input ?? undefined} onDelete={onFilterChange} />
          );
        } else {
          const input = inputs.selectors?.find((v) => v?.filterID == filter.id);
          if (!input || !input.filterValue) {
            return null;
          }
          return <SelectorFilterResult key={filter.id || ""} input={input ?? undefined} onDelete={onFilterChange} />;
        }
      case "SuggestionFilter": {
        const input = inputs.suggestion?.find((v) => v?.filterID == filter.id);
        if (!input || !input.filterValues || input.filterValues.length == 0) {
          return null;
        }

        return <SuggestionFilterResult key={filter.id || ""} input={input ?? undefined} onDelete={onFilterChange} />;
      }
      default:
        return null;
    }
  }

  function contentComponent(): ReactNode {
    if (!filters || filters.length == 0) {
      return null;
    }
    if (!hasConditionActive(inputs)) {
      return null;
    }
    return (
      <div className={classes.filterResult}>
        <Space wrap size={[24, 8]}>
          {filters?.map((f) => {
            if (!f) {
              return null;
            }
            return filterResultItemComponent(f);
          })}
        </Space>
      </div>
    );
  }

  return <>{contentComponent()}</>;
};

export default FilterResult;
