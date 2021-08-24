import { makeStyles, Theme } from "@material-ui/core";
import clsx from "clsx";
import { CalendarMonth, Earth } from "mdi-material-ui";
import React from "react";
import { TrendSVG } from "./assets";
import FilterSelector from "./filter-selector";
import FilterContainer from "./filterContainer";

const useStyles = makeStyles((theme: Theme) => ({
  menuBox: {
    display: "flex",
    marginBottom: "1rem",
  },
  icon: {
    color: theme.palette.primary.main,
  },
  filterIcon: {
    marginRight: "0.5rem",
    fontSize: "1rem",
    maxHeight: 16,
    minWidth: 16,
  },
}));

interface SelectorProps {
  filterID: string;
}

function getYears(): string[] {
  const currentYear = new Date().getFullYear();
  const options: string[] = [];

  for (let i = 0; i < 10; i++) {
    options.push((currentYear - i).toString());
  }
  options.push("0");

  return options;
}

function getFinancingRounds(): string[] {
  return ["种子 - A 轮", "B - C 轮", "D 轮 - Pre-IPO", "IPO", "M&A"];
}

function getRegions(): string[] {
  return ["国内/海外", "国内", "海外"];
}

interface FilterIconProps {
  filterID: string;
}

const FilterIcon: React.FunctionComponent<FilterIconProps> = ({ filterID }) => {
  const classes = useStyles();

  switch (filterID) {
    case "filter_id_year":
      return <CalendarMonth className={clsx(classes.icon, classes.filterIcon)} />;
    case "filter_id_region":
      return <Earth className={clsx(classes.icon, classes.filterIcon)} />;
    case "filter_id_deal_type":
      return <TrendSVG className={clsx(classes.icon, classes.filterIcon)} />;
    default:
      return <Earth className={clsx(classes.icon, classes.filterIcon)} />;
  }
};

const FilterSelectors: React.FunctionComponent = () => {
  const classes = useStyles();
  const { filterIDs } = FilterContainer.useContainer();

  return (
    <div className={classes.menuBox}>
      {filterIDs.map((id) => {
        return <FilterSelector key={id} filterID={id} icon={<FilterIcon filterID={id} />} />;
      })}
    </div>
  );
};

export default FilterSelectors;
