import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import { FilterInputs, MultiSelectorFilterInput, SelectorFilterInput } from "../../../generated/graphql";
import { Content, FilterProto, Option } from "../common-grid-components/timeline/types";
import Space from "../space";
import ConditionSelect from "./condition-select";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    selectText: {
      fontSize: 14,
      color: "#333",
      fontWeight: theme.typography.fontWeightRegular,
      lineHeight: "24px",
      display: "flex",
      alignItems: "center",
    },
    filterIcon: {
      width: 16,
      height: 16,
      marginRight: 4,
    },
  }),
);

interface FilterInputSelectProps {
  prefix?: ReactNode;
  suffix?: ReactNode;
  filterConfigs: FilterProto[];
  filterInputs?: FilterInputs;
  onSelectFilterChange?: (filter: SelectorFilterInput) => void;
  onMultiSelectFilterChange?: (filter: MultiSelectorFilterInput) => void;
}

const FilterInputSelect: React.FunctionComponent<FilterInputSelectProps> = (props) => {
  const classes = useStyles();
  const { prefix, suffix, filterConfigs, filterInputs, onSelectFilterChange, onMultiSelectFilterChange } = props;

  function getValuesFromSelectorFilterInputs(id: string, multiple: boolean) {
    if (!filterInputs) return [];
    if (multiple) {
      const multiSelectorFilter = filterInputs.multiSelectorFilterInputs?.find((filter) => filter?.filterID === id);
      if (!multiSelectorFilter) return [];
      return multiSelectorFilter?.filterValues;
    }

    const selectFilter = filterInputs.selectorFilterInputs?.find((filter) => filter?.filterID === id);
    if (!selectFilter?.filterValue) return [];
    return [selectFilter?.filterValue];
  }

  const getRenderValue = (filterConfig: Content, multiple: boolean) => {
    if (multiple) {
      const selectValues = filterInputs?.multiSelectorFilterInputs?.find(
        (filter) => filter?.filterID === filterConfig.id,
      );
      if (selectValues && selectValues.filterValues && selectValues.filterValues.length > 0)
        return (
          <Typography className={classes.selectText}>
            <img src={filterConfig.icon.value} alt="" className={classes.filterIcon} />
            已选 {selectValues.filterValues.length} 项
          </Typography>
        );
    } else {
      const selectValues = filterInputs?.selectorFilterInputs?.find((filter) => filter?.filterID === filterConfig.id);

      if (selectValues) {
        return (
          <Typography className={classes.selectText}>
            <img src={filterConfig.icon.value} alt="" className={classes.filterIcon} />
            {filterConfig.options.find((option) => option.value === selectValues.filterValue)?.key}
          </Typography>
        );
      }
    }

    return (
      <Typography className={classes.selectText}>
        <img src={filterConfig.icon.value} alt="" className={classes.filterIcon} />
        {filterConfig.name}
      </Typography>
    );
  };

  function onChange(values: any, multiple: boolean, id: string) {
    if (multiple) {
      onMultiSelectFilterChange &&
        onMultiSelectFilterChange({
          filterID: id,
          filterValues: values.map((item: string) => JSON.parse(item)),
        });
      return;
    }

    onSelectFilterChange &&
      onSelectFilterChange({
        filterID: id,
        filterValue: JSON.parse(values),
      });
  }

  function getSelectItemList(options: Option[]) {
    return options.map((option) => {
      return {
        id: option.value,
        name: option.key,
      };
    });
  }

  function getSelectFilter(filterConfig: Content) {
    const multiple = filterConfig.multiple?.value;

    return (
      <ConditionSelect
        key={filterConfig.id}
        values={getValuesFromSelectorFilterInputs(filterConfig.id, multiple)}
        renderValue={getRenderValue(filterConfig, multiple)}
        multiple={multiple}
        selectItemList={getSelectItemList(filterConfig.options)}
        onChange={(selectedOptions) => onChange(selectedOptions, multiple, filterConfig.id)}
      />
    );
  }

  return (
    <Space wrap size="middle">
      {prefix}
      {filterConfigs && filterConfigs.map((filter) => getSelectFilter(filter.content))}
      {suffix}
    </Space>
  );
};

export default FilterInputSelect;
