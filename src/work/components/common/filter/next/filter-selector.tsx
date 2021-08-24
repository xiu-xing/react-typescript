import { MenuItem, Select, SelectProps } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      borderRadius: 28,
      height: 36,
      fontSize: 14,
      color: "#333333",
      marginRight: "1rem",
      cursor: "pointer",
      padding: 0,
    },
    startIconBox: {
      position: "absolute",
      left: 14,
      top: "50%",
      transform: "translateY(-50%)",
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
      paddingLeft: props["startIcon"] ? 38 : 16,
    }),
    outline: {
      borderColor: "#e3e3e3",
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

export interface FilterItemModel {
  name: string;
  value: string | number | string[];
}

interface FilterSelectorProps extends SelectProps {
  icon?: JSX.Element;
  filterItems: FilterItemModel[];
}

const FilterSelector: React.FunctionComponent<FilterSelectorProps> = (props) => {
  const { value, onChange, icon, filterItems, className, classes: externalClasses, ...restProps } = props;
  const classes = useStyles({ startIcon: icon ? true : false });

  return (
    <Select
      {...restProps}
      value={value}
      variant="outlined"
      onChange={onChange}
      className={clsx(classes.root, className)}
      startAdornment={icon ? <div className={classes.startIconBox}>{icon}</div> : undefined}
      classes={{
        ...externalClasses,
        outlined: clsx(classes.outline, externalClasses?.outlined),
        select: clsx(classes.select, externalClasses?.select),
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
        ...props.MenuProps,
      }}
    >
      {filterItems?.map((filterItem, index) => (
        <MenuItem key={index} value={filterItem.value}>
          {filterItem.name}
        </MenuItem>
      ))}
    </Select>
  );
};

export default FilterSelector;
