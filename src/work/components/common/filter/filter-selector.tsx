import { MenuItem, Select } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import { useRouter } from "next/router";
import React, { useEffect, useState } from "react";
import { FilterInput } from "../../../generated/graphql";
import FilterContainer from "./filterContainer";

const useStyles = makeStyles({
  root: {
    borderRadius: 28,
    height: 36,
    fontSize: 14,
    color: "#333333",
    marginRight: "1rem",
    padding: "0 16px",
  },
  select: {
    paddingRight: "1rem",
    "&:focus": {
      backgroundColor: "#FFFFFF",
    },
    height: "100%",
    display: "flex",
    alignItems: "center",
  },
  outline: {
    borderColor: "#e3e3e3",
    padding: "0 16px 0 0 !important",
  },
});

interface FilterSelectorProps {
  filterID: string;
  icon?: JSX.Element;
}
/**
 * According to filter type render corresponding filters selector
 * @param { filterType, icon }
 * @returns corresponding filters selector
 */
const FilterSelector: React.FunctionComponent<FilterSelectorProps> = ({ filterID, icon }) => {
  const classes = useStyles();
  const { filterNames, setFilterInputs, filtersMap, sectionID } = FilterContainer.useContainer();
  const names = filterNames.get(filterID) ?? [];
  const router = useRouter();
  const [value, setValue] = useState(names[0] ?? "");

  const handleChange = (event: React.ChangeEvent<{ value: unknown }>): void => {
    const optionValue = event.target.value as string;
    setValue(optionValue);

    setFilterInputs((prev) => {
      const filterInput = filtersMap.get(filterID)?.get(optionValue) as FilterInput;
      const newFilterInputs = prev.filter((item) => item?.filterID !== filterID);

      if (filterInput) {
        newFilterInputs.push(filterInput);
      }
      return newFilterInputs;
    });
  };

  // Update container filter
  useEffect(() => {
    setFilterInputs((prev) => {
      const filterInput = filtersMap.get(filterID)?.get(value) as FilterInput;
      const newFilterInputs = prev.filter((item) => item?.filterID !== filterID);

      if (filterInput) {
        newFilterInputs.push(filterInput);
      }
      return newFilterInputs;
    });

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [value]);

  return (
    <Select
      value={value}
      variant="outlined"
      onChange={handleChange}
      className={classes.root}
      startAdornment={icon}
      classes={{ outlined: classes.outline, select: classes.select }}
      MenuProps={{
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
      {names?.map((name) => (
        <MenuItem key={filterID + name} value={name}>
          {name}
        </MenuItem>
      ))}
    </Select>
  );
};

export default FilterSelector;
