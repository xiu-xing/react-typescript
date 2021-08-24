import { MenuItem } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import { SqlOperator } from "../../../../../generated/graphql";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
  }),
);

export type ChartFilterItemValueType = { name: string; operator: SqlOperator; value: string[] };

interface ChartFilterItemProps {
  value: ChartFilterItemValueType;
  selected?: boolean;
  onClick?: (value: ChartFilterItemValueType) => void;
}

const ChartFilterItem: React.FunctionComponent<ChartFilterItemProps> = ({ value, selected, onClick }) => {
  const classes = useStyles();
  return (
    <MenuItem
      className={classes.root}
      button
      selected={selected}
      onClick={(): void => {
        onClick && onClick(value);
      }}
    >
      {value.name}
    </MenuItem>
  );
};

export default ChartFilterItem;
