import _ from "lodash";
import { useMemo, useState } from "react";
import { createContainer } from "unstated-next";
import ConfigContainer from "../../../containers/configContainer";
import { FilterInput, SqlOperator } from "../../../generated/graphql";
import { FilterConfig } from "../../../models/filter/filterConfig";

interface FilterInitialStateProps {
  sectionID: string;
}

export function getFilterContainerParam(
  filterConfigs: FilterConfig,
  id: string,
): {
  filterNames: Map<string, string[]>;
  filtersMap: Map<string, Map<string, FilterInput>>;
  filterIDs: string[] | undefined;
  sectionID: string;
} {
  const optionsArr = _.cloneDeep(filterConfigs.filterMap?.get?.(id));

  const currentYear = new Date().getFullYear();
  const filtersMap = new Map<string, Map<string, FilterInput>>();
  const filterNames: Map<string, string[]> = new Map();

  const filterIDs = optionsArr
    ? optionsArr?.map((option) => {
        const filterMap = new Map();

        const names: string[] = [];
        if (option.filter_id !== "filter_id_year") {
          option.inputs?.map((input) => {
            names.push(input.name);
            filterMap.set(input.name, {
              operator: input.operator,
              values: input.values ?? [],
              filterID: option.filter_id,
            });
          });
        } else {
          const allYear = `全部年份`;
          names.push(allYear);
          filterMap.set(allYear, {
            operator: SqlOperator.Any,
            values: [],
            filterID: option.filter_id,
          });

          for (let i = 0; i < 11; i++) {
            const name = (currentYear - i).toString() + " 年";
            const filterInput = {
              operator: SqlOperator.Equal,
              values: [(currentYear - i).toString()],
              filterID: option.filter_id,
            };
            names.push(name);
            filterMap.set(name, filterInput);
          }

          const beforeYear = `${currentYear - 10} 年前`;
          names.push(beforeYear);

          filterMap.set(beforeYear, {
            operator: SqlOperator.LessThan,
            values: [(currentYear - 10).toString()],
            filterID: option.filter_id,
          });
        }

        filtersMap.set(option.filter_id, filterMap);
        filterNames.set(option.filter_id, names);
        return option.filter_id;
      })
    : undefined;

  return {
    filterIDs,
    filterNames,
    filtersMap,
    sectionID: id,
  };
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useFilter(filterInitialState?: FilterInitialStateProps) {
  const { filterConfigs } = ConfigContainer.useContainer();
  const filterConfigResult = getFilterContainerParam(
    filterConfigs ?? new FilterConfig(),
    filterInitialState?.sectionID || "",
  );
  const [filtersMap, setFilterMap] = useState<Map<string, Map<string, FilterInput>>>(filterConfigResult.filtersMap);
  const [filterNames, setFilterNames] = useState<Map<string, string[]>>(filterConfigResult.filterNames);
  const [filterIDs, setFilterIDs] = useState<string[]>(filterConfigResult.filterIDs ?? []);
  const [sectionID, setSectionID] = useState<string>(filterConfigResult.sectionID);

  const defaultFilterInputs = useMemo(() => {
    const newFilterInputs: FilterInput[] = [];
    filterIDs.forEach((filterId) => {
      const filterName = filterNames.get(filterId)?.[0] || "";
      if (filterName) {
        const filterOptionsMap = filtersMap.get(filterId);
        if (filterOptionsMap) {
          const filterValule = filterOptionsMap.get(filterName);
          filterValule && newFilterInputs.push(filterValule);
        }
      }
    });
    return newFilterInputs;
  }, [filtersMap, filterNames, filterIDs]);

  const [filterInputs, setFilterInputs] = useState<FilterInput[]>(defaultFilterInputs);

  return {
    filterInputs,
    setFilterInputs,
    filtersMap,
    setFilterMap,
    filterIDs,
    setFilterIDs,
    filterNames,
    setFilterNames,
    sectionID,
  };
}

const FilterContainer = createContainer(useFilter);
export default FilterContainer;
