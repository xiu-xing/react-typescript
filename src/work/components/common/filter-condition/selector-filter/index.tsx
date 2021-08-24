import { Box, MenuItem, Select, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { Check } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import { FilterConditionItemCommonProps } from "..";
import { FilterOption, SelectorFilter as SelectorFilterModel } from "../../../../generated/graphql";
import FilterIcon, { FilterIconTypes } from "../../filter-icon";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    select: {
      position: "relative",
      padding: "0 !important",
      "& .MuiSelect-root": {
        paddingTop: 6,
        paddingBottom: 6,
        paddingLeft: 12,
      },
      // start icon box
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
    selectHasIcon: {
      "& .MuiSelect-root": {
        paddingLeft: 32,
      },
    },
    selectText: {
      fontSize: 14,
      color: "#333",
      fontWeight: theme.typography.fontWeightRegular,
      lineHeight: "24px",
    },
    menuItem: {
      "&[aria-selected='true']": {
        backgroundColor: "white",
      },
    },
    startIconBox: {
      display: "inline-flex",
      alignItems: "center",
      position: "absolute",
      left: 12,
      top: "50%",
      transform: "translateY(-50%)",
    },
    checkIcon: {
      marginLeft: 4,
    },
  }),
);

export const ITEM_HEIGHT = 48;
export const ITEM_PADDING_TOP = 8;

export const MenuProps = {
  PaperProps: {
    style: {
      maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
    },
  },
};

export interface SelectorFilterOwnerProps {
  selectedValues?: Array<string>;
}

interface SelectorFilterProps extends FilterConditionItemCommonProps, SelectorFilterOwnerProps {
  filter: SelectorFilterModel;
}

const SelectorFilter: React.FunctionComponent<SelectorFilterProps> = (props) => {
  const classes = useStyles();

  const { filter, selectedValues: controllerValues, onChange } = props;

  const [selectedValues, setSelectedValues] = useState<Array<string>>([]);

  useEffect(() => {
    setSelectedValues(controllerValues ?? []);
  }, [controllerValues]);

  function onMenuItemClick(o: FilterOption): void {
    if (selectedValues.includes(o.value)) {
      if (!filter.multiple) {
        onChange &&
          onChange({
            filterID: filter.id ?? "",
            filterValue: undefined,
            filterName: filter.name ?? "",
            operator: filter.operator ?? undefined,
            type: "Selector",
          });
      } else {
        onChange &&
          onChange({
            filterID: filter.id ?? "",
            filterValues: (filter.options ?? []).filter(
              (v) => selectedValues.includes(v?.value ?? "") && v?.value != o.value,
            ) as FilterOption[],
            filterName: filter.name ?? "",
            operator: filter.operator ?? undefined,
            type: "MultiSelector",
          });
      }
    } else {
      if (!filter.multiple) {
        onChange &&
          onChange({
            filterID: filter.id ?? "",
            filterValue: o,
            filterName: filter.name ?? "",
            operator: filter.operator ?? undefined,
            type: "Selector",
          });
      } else {
        onChange &&
          onChange({
            filterID: filter.id ?? "",
            filterValues: (filter.options ?? []).filter(
              (v) => selectedValues.includes(v?.value ?? "") || v?.value == o.value,
            ) as FilterOption[],
            filterName: filter.name ?? "",
            operator: filter.operator ?? undefined,
            type: "MultiSelector",
          });
      }
    }
  }

  return (
    <Select
      variant="outlined"
      multiple
      displayEmpty
      value={selectedValues}
      className={clsx(classes.select, { [classes.selectHasIcon]: !!filter.icon })}
      startAdornment={filter.icon ? <FilterIcon type={filter.icon as FilterIconTypes} /> : undefined}
      renderValue={() => <Typography className={classes.selectText}>{filter.name}</Typography>}
      MenuProps={{
        ...MenuProps,
        anchorOrigin: {
          vertical: "bottom",
          horizontal: "center",
        },
        transformOrigin: {
          vertical: "top",
          horizontal: "center",
        },
        getContentAnchorEl: undefined,
      }}
    >
      {filter.options && filter.options.length > 0 ? (
        filter.options.map((o, i) =>
          o ? (
            <MenuItem
              key={i}
              value={o?.value}
              className={classes.menuItem}
              onClick={() => {
                onMenuItemClick(o);
              }}
            >
              {o?.key}
              <Box flex={1} />
              {selectedValues.includes(o?.value) ? (
                <Check color="primary" className={classes.checkIcon} />
              ) : (
                <div style={{ width: 28 }} />
              )}
            </MenuItem>
          ) : null,
        )
      ) : (
        <Box paddingY="12px">
          <Typography align="center">暂无选项</Typography>
        </Box>
      )}
    </Select>
  );
};

export default SelectorFilter;
