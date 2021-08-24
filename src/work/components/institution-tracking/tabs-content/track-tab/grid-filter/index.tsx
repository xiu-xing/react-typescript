import { Box, ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import _ from "lodash";
import React, { useEffect, useState } from "react";
import { Filter, Maybe, SelectorFilter } from "../../../../../generated/graphql";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import ConditionSelect from "../../../../common/config-select-filter-area/condition-select";
import InstitutionTrackGridTabContainer from "../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "20px 24px 8px 24px",
      display: "flex",
      flexWrap: "wrap",
      columnGap: "12px",
      rowGap: "6px",
    },
    title: {
      fontSize: "14px",
      color: "#666",
      whiteSpace: "nowrap",
      paddingRight: "12px",
    },
    selectFilter: {
      display: "flex",
      alignItems: "center",
    },
    timeFilters: {
      marginRight: "12px",
      display: "flex",
      flexWrap: "nowrap",
      borderRadius: 4,
      overflow: "hidden",
      border: "1px solid #E6E6E6",
      "& button:nth-child(1n+2)": {
        borderLeft: "1px solid #E6E6E6",
      },
    },
    filterItem: {
      cursor: "pointer",
      "& p": {
        fontSize: "14px",
        color: "#333",
        padding: "6px 12px",
        whiteSpace: "nowrap",
      },
    },
    selectedFilter: {
      backgroundColor: theme.palette.primary.main,
      "& p": {
        color: "white",
      },
    },
    select: {
      position: "relative",
      padding: "0 !important",
      "& .MuiSelect-root": {
        minWidth: "30px",
        paddingTop: "6px",
        paddingBottom: "6px",
        paddingLeft: "12px",
        fontSize: 14,
      },
      "& .MuiSvgIcon-root:not(.MuiSelect-icon)": {
        position: "absolute",
        left: 12,
      },
      "& .MuiSelect-select:focus": {
        backgroundColor: "transparent",
      },
      "& .MuiSelect-icon": {
        color: theme.palette.primary.main,
      },
      "& .MuiOutlinedInput-notchedOutline": {
        borderColor: "#EEE",
      },
    },
    selectText: {
      fontSize: "14px",
      color: "#333",
      fontWeight: theme.typography.fontWeightRegular,
      lineHeight: "24px",
    },
    menuItem: {
      minWidth: "72px",
      display: "flex",
      justifyContent: "space-between",
      "&[aria-selected='true']": {
        backgroundColor: "white",
      },
    },
    menuItemText: {
      textAlign: "center",
      fontSize: "14px",
      color: "#333",
    },
    radius: {
      borderRadius: "4px",
    },
  }),
);

interface GridFilterProps {
  filters: Maybe<Filter>[];
}

const GridFilter: React.FunctionComponent<GridFilterProps> = ({ filters }) => {
  const classes = useStyles();
  const { updateGridSelectorFilters, gridFilterInputs } = InstitutionTrackGridTabContainer.useContainer();

  const { setRowSelections, setUseQueryEndCursor } = CommonGridContainer.useContainer();
  const [selectTime, setSelectTime] = useState("");

  function selectItemList(filter: SelectorFilter) {
    if (!filter || !filter.options) return [];
    return filter.options?.map((option) => ({
      id: option?.value ?? "",
      name: option?.key ?? "",
    }));
  }

  function initDefaultValue(filter: SelectorFilter) {
    if (filter.defaultValue !== null && filter.defaultValue !== undefined) {
      if (filter.spread) setSelectTime(filter.defaultValue);
      updateGridSelectorFilters({
        filterID: filter.id,
        filterValue: filter.defaultValue,
      });
    }
  }

  useEffect(() => {
    filters.forEach((filter) => {
      switch (filter?.__typename) {
        case "SelectorFilter":
          return initDefaultValue(filter);
        default:
          return;
      }
    });
  }, []);

  function onSelectFilterChange(id: string, value: string) {
    const filter = {
      filterID: id,
      filterValue: JSON.parse(value),
    };

    const selected = gridFilterInputs?.selectorFilterInputs?.find((filter) => filter?.filterID === id);
    if (_.isEqual(filter, selected)) return;
    setRowSelections([]);
    setUseQueryEndCursor(null);
    updateGridSelectorFilters(filter);
  }

  function getValue(id?: string | null) {
    if (!id) return [];

    const filters = gridFilterInputs?.selectorFilterInputs?.filter((item) => item && item.filterID === id);
    return filters ? [filters[0]?.filterValue] : [];
  }

  function getFilterComponent(filter: Maybe<Filter>, index: number) {
    if (!filter) return;
    switch (filter.__typename) {
      case "SelectorFilter": {
        if (filter.spread) {
          return (
            <Box className={classes.selectFilter} key={index}>
              <Typography className={classes.title}>{filter.name}</Typography>
              <div className={classes.timeFilters}>
                {filter.options?.map(
                  (option) =>
                    option && (
                      <ButtonBase
                        key={option?.key}
                        onClick={() => {
                          setSelectTime(option.value);
                          onSelectFilterChange(filter.id ?? "", JSON.stringify(option.value));
                        }}
                        className={clsx(classes.filterItem, selectTime === option.value && classes.selectedFilter)}
                      >
                        <Typography>{option.key}</Typography>
                      </ButtonBase>
                    ),
                )}
              </div>
            </Box>
          );
        }

        return (
          <Box className={classes.selectFilter} key={index}>
            <Typography className={classes.title}>{filter.name}</Typography>
            <ConditionSelect
              values={getValue(filter.id)}
              showCheck={false}
              selectItemList={selectItemList(filter)}
              onChange={(value) => onSelectFilterChange(filter.id ?? "", value)}
            />
          </Box>
        );
      }
    }
  }

  return <div className={classes.root}>{filters.map((filter, index) => getFilterComponent(filter, index))}</div>;
};

export default GridFilter;
