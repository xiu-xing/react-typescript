import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { CSSProperties, useMemo } from "react";
import {
  CheckboxFilterInput,
  DateFilterInput,
  DateRangeFilterInput,
  DateRangeSelectorFilterInput,
  Filter,
  MultiSelectorFilterInput,
  SelectorFilterInput,
} from "../../../../generated/graphql";
import DateRangeSelector from "./date-range-selector";
import Selector from "./selector";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    title: {
      fontSize: 14,
      color: "#666",
    },
  }),
);

export type FilterInputType =
  | (SelectorFilterInput & { type?: "SelectorFilterInput" })
  | (DateFilterInput & { type?: "DateFilterInput" })
  | (CheckboxFilterInput & { type?: "CheckboxFilterInput" })
  | (DateRangeFilterInput & { type?: "DateRangeFilterInput" })
  | (MultiSelectorFilterInput & { type?: "MultiSelectorFilterInput" })
  | (DateRangeSelectorFilterInput & { type?: "DateRangeSelectorFilterInput" });
export interface FilterInputCommonProps {
  className?: string;
  style?: CSSProperties;
  value?: FilterInputType;
  onChange?: (value: FilterInputType) => void;
}

interface FilterInputProps extends FilterInputCommonProps {
  filter: Filter;
  disableLabel?: boolean;
}

const FilterInput: React.FC<FilterInputProps> = (props) => {
  const classes = useStyles();
  const { filter, disableLabel = false, className, style, ...restProps } = props;

  const content = useMemo(() => {
    switch (filter.__typename) {
      case "SelectorFilter":
        return <Selector filter={filter} {...restProps} />;
      case "YearFilter":
        return <>YearFilter</>;
      case "CheckboxFilter":
        return <>CheckboxFilter</>;
      case "NestedCheckboxFilter":
        return <>NestedCheckboxFilter</>;
      case "DateRangeFilter":
        return <>DateRangeFilter</>;
      case "DateRangeSelectorFilter":
        return <DateRangeSelector filter={filter} {...restProps} />;
      case "DayFilter":
        return <>DayFilter</>;
      case "MonthFilter":
        return <>MonthFilter</>;
      default:
        break;
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [props]);

  return (
    <Box className={clsx(classes.root, className)} style={style}>
      {!disableLabel && (
        <Typography noWrap className={classes.title}>
          {filter.name}
        </Typography>
      )}
      <Box height={16} />
      {content}
    </Box>
  );
};

export default FilterInput;
