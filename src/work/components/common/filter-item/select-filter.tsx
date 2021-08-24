import { Box, MenuItem, Select, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { isArray } from "lodash";
import { Check } from "mdi-material-ui";
import React, { useLayoutEffect, useState } from "react";
import { FilterItemCommonProps } from ".";
import { FilterOption, Maybe, SelectorFilter } from "../../../generated/graphql";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "inline-flex",
      alignItems: "center",
    },
    label: {
      color: "#666",
      fontSize: 14,
      marginRight: "1rem",
      minWidth: "max-content",
    },
    selectRoot: {
      borderRadius: 4,
      height: 36,
      fontSize: 14,
      color: "#333333",
      cursor: "pointer",
      padding: 0,
    },
    startIcon: {
      fontSize: "1rem",
    },
    startIconBox: {
      display: "inline-flex",
      alignItems: "center",
      position: "absolute",
      left: 12,
      top: "50%",
      transform: "translateY(-50%)",
    },
    selectIcon: {
      color: theme.palette.primary.main,
    },
    select: (props) => ({
      paddingRight: "1rem",
      "&:focus": {
        backgroundColor: "transparent",
      },
      height: "100%",
      display: "flex",
      alignItems: "center",
      paddingTop: 0,
      paddingBottom: 0,
      paddingLeft: props["startIcon"] ? 38 : 12,
    }),
    outline: {
      borderColor: "#e3e3e3",
    },
    selectText: {
      fontSize: 14,
      color: "#333",
      fontWeight: theme.typography.fontWeightRegular,
      lineHeight: "24px",
      fontFamily: "Noto Sans SC",
    },
    menuItem: {
      "&[aria-selected='true']": {
        backgroundColor: "white",
      },
    },
  }),
);

const ITEM_HEIGHT = 48;
const ITEM_PADDING_TOP = 8;

const MenuProps = {
  PaperProps: {
    style: {
      maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
    },
  },
};

interface SelectFilterProps extends FilterItemCommonProps {
  filter: SelectorFilter;
}

const SelectFilter: React.FunctionComponent<SelectFilterProps> = (props) => {
  const { filter, disableLabel, onChange } = props;
  const classes = useStyles({ startIcon: filter.icon ? true : false });
  const [value, setValue] = useState<unknown>(filter.multiple === true ? [0] : 0);
  const [options] = useState(filter.options ?? []);

  useLayoutEffect(() => {
    if (onChange) {
      if (filter.multiple !== true) {
        onChange({
          filterID: filter.id,
          filterValue: options[value as number]?.value ?? "",
          operator: filter.operator,
          name: filter.name,
          type: "SelectorFilterInput",
          displayValue: options[value as number]?.key,
        });
      } else {
        const filterValues: string[] = [];
        const displayValue: string[] = [];

        if (isArray(value)) {
          value.forEach((v) => {
            filterValues.push(options[v]?.value ?? "");
            displayValue.push(options[v]?.key ?? "");
          });
        }

        onChange({
          filterID: filter.id,
          operator: filter.operator,
          filterValues: filterValues,
          name: filter.name,
          type: "MultiSelectorFilterInput",
          displayValue: displayValue.join(","),
        });
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [value]);

  const multipleMenuItem = (o: Maybe<FilterOption>, i: number) => {
    return (
      <MenuItem key={o?.key} value={i} className={classes.menuItem}>
        {o?.key} <Box flex={1} />
        {isArray(value) && value.includes(i) && <Check color="primary" />}
      </MenuItem>
    );
  };

  const getDisplayValue = (value: unknown) => {
    if (isArray(value)) {
      const displayValue: string[] = [];
      value.forEach((v) => {
        displayValue.push(options[v]?.key ?? "");
      });
      return displayValue.join("，");
    }
    return options[value as number]?.key ?? "";
  };

  return (
    <div className={classes.root}>
      {!disableLabel && !!filter.name ? (
        <Typography noWrap className={classes.label}>
          {filter.name}
        </Typography>
      ) : null}
      <Select
        variant="outlined"
        multiple={filter.multiple === true}
        value={value}
        displayEmpty
        className={classes.selectRoot}
        onChange={(e) => {
          if (isArray(e.target.value) && e.target.value.length === 0) return;
          setValue(e.target.value);
        }}
        startAdornment={filter.icon ? <div className={classes.startIconBox}>{filter.icon}</div> : undefined}
        classes={{
          outlined: classes.outline,
          select: classes.select,
          icon: classes.selectIcon,
        }}
        renderValue={(v) => {
          let selectText = getDisplayValue(v);
          if (isArray(v) && !filter.split) {
            selectText = "共 " + v.length + " " + filter.name;
          }
          return <Typography className={classes.selectText}>{selectText}</Typography>;
        }}
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
          PaperProps: {
            style: {
              width: 160,
              minWidth: 160,
              maxHeight: 500,
            },
          },
        }}
      >
        {filter.options?.map((o, i) => {
          if (filter.multiple) {
            return multipleMenuItem(o, i);
          }
          return (
            <MenuItem key={o?.key} value={i}>
              {o?.key}
            </MenuItem>
          );
        })}
      </Select>
    </div>
  );
};

export default SelectFilter;
