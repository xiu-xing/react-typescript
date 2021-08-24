import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useMemo } from "react";
import { FilterInputCommonProps } from ".";
import { FilterOption, SelectorFilter, SelectorFilterInput } from "../../../../generated/graphql";
import { first } from "../../../../utils/tools";
import SelectButtons from "../select-buttons";
import SelectButton from "../select-buttons/select-button";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    buttons: {
      display: "grid",
      gridTemplateColumns: "repeat(auto-fit,minmax(100px,1fr))",
      gridGap: "12px",
    },
    title: {
      fontSize: 14,
      color: "#666",
    },
  }),
);

interface SelectorProps extends FilterInputCommonProps {
  filter: SelectorFilter;
}

const Selector: React.FunctionComponent<SelectorProps> = (props) => {
  const classes = useStyles();
  const { filter, value, onChange } = props;

  const options = useMemo(() => filter?.options as FilterOption[], [filter]);

  const selected = useMemo(
    () =>
      (value as SelectorFilterInput & { type?: "SelectorFilterInput" })?.filterValue ??
      filter.defaultValue ??
      first(options)?.value,
    [value, filter, options],
  );

  return (
    <Box className={classes.root}>
      <SelectButtons
        className={classes.buttons}
        value={selected}
        onChange={(_, v) =>
          onChange?.({
            type: "SelectorFilterInput",
            filterID: filter.id,
            operator: filter.operator,
            filterValue: v as string,
            name: filter.name,
            displayValue: v as string,
          })
        }
      >
        {options.map((o) => (
          <SelectButton key={o.value} label={o.key} value={o.value} />
        ))}
      </SelectButtons>
    </Box>
  );
};

export default Selector;
