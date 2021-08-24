import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import { ConditionType, NextSearchConditionInput } from "../../../../generated/graphql";
import { Condition } from "../types";
import CheckBox from "./checkbox";
import Input from "./input";
import NestedCheckbox from "./nested-checkbox";
import Range from "./range";
import SearchInput from "./search-input";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    label: {
      color: "#666",
      fontSize: 14,
      lineHeight: 1.71,
      fontWeight: theme.typography.fontWeightRegular,
    },
    clearText: {
      fontSize: 14,
      cursor: "pointer",
      color: theme.palette.primary.main,
      margin: "0 16px",
    },
  }),
);

export type Variant = "input" | "preset_input";

export const ITEM_HEIGHT = 48;
export const ITEM_PADDING_TOP = 8;

export const MenuProps = {
  PaperProps: {
    style: {
      maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
    },
  },
};

export interface SearchConditionInputCommonProps {
  config: Condition;
  value: NextSearchConditionInput;
  onChange: (value: NextSearchConditionInput) => void;
  variant?: Variant;
  onMoreOptionClick?: VoidFunction;
  onClear?: (id: string) => void;
}

interface SearchConditionInputProps extends SearchConditionInputCommonProps {
  disableLabel?: boolean;
}

const SearchConditionInput: React.FC<SearchConditionInputProps> = ({
  config,
  disableLabel = false,
  value,
  onClear,
  ...restProps
}) => {
  const classes = useStyles();

  const input = () => {
    switch (config.input.input_type) {
      case ConditionType.Checkbox:
        return <CheckBox value={value} config={config} {...restProps} />;
      case ConditionType.SearchField:
        return <SearchInput value={value} config={config} {...restProps} />;
      case ConditionType.DateRange:
      case ConditionType.Range:
        return <Range value={value} config={config} {...restProps} />;
      case ConditionType.Field:
        return <Input value={value} config={config} {...restProps} />;
      case ConditionType.NestedCheckbox:
        return <NestedCheckbox value={value} config={config} {...restProps} />;
      default:
        console.error("unsupported search condition input");
        break;
    }
  };

  return (
    <Box className={classes.root}>
      {!disableLabel && (
        <>
          <Box display="inline-grid" alignItems="center" gridTemplateColumns="1fr max-content">
            <Typography noWrap className={classes.label}>
              {config.name}
            </Typography>
            {!!value && (
              <Typography noWrap className={classes.clearText} onClick={() => onClear?.(config.id)}>
                清除
              </Typography>
            )}
          </Box>
          <Box height={8} />
        </>
      )}
      {input()}
    </Box>
  );
};

export default SearchConditionInput;
