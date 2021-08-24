import { Box, FormControlLabel, MenuItem, Radio, RadioGroup, Select, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { isEmpty } from "lodash";
import { Check } from "mdi-material-ui";
import React, { useMemo } from "react";
import { MenuProps, SearchConditionInputCommonProps } from "..";
import { first } from "../../../../../utils/tools";
import SearchConditionInputIcon from "../../../../realm/search-condition-input-icon";
import RangeInput from "./range-input";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    formControlLabel: {
      margin: 0,
      marginLeft: -2,
      "& .MuiRadio-root": {
        padding: 0,
      },
      "& .MuiSvgIcon-root": {
        fontSize: 17,
      },
      "& .MuiFormControlLabel-label": {
        marginLeft: 4,
        fontSize: 14,
        lineHeight: 1.71,
        color: "#333",
        fontWeight: theme.typography.fontWeightRegular,
      },
    },
    radioGroup: {
      marginBottom: -12,
    },
    input: {
      width: 160,
      "& .MuiInputBase-root": {
        fontSize: 14,
        lineHeight: "24px",
      },
      "& .MuiOutlinedInput-notchedOutline": {
        borderColor: "#EEE",
      },
    },
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
  }),
);

// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface RangeProps extends SearchConditionInputCommonProps {}

const Range: React.FC<RangeProps> = (props) => {
  const classes = useStyles();
  const { variant = "input", config, onChange, value, onMoreOptionClick } = props;
  const options = useMemo(() => config.input.input_type_config.options ?? [], [config]);
  const presetOptions = useMemo(() => config.input.preset_input_config?.options ?? [], [config]);
  const defaultOperator = useMemo(() => first(config.input.operators), [config]);
  const selectedKey = useMemo(() => {
    if (variant === "input") {
      return value?.options?.filter((o) => !!~options.findIndex((p) => p.id === o?.id))?.[0]?.id ?? "";
    }

    if (variant === "preset_input") {
      return value?.options?.filter((o) => !!~presetOptions.findIndex((p) => p.id === o?.id))?.[0]?.id ?? "";
    }

    return "";
  }, [value, variant, presetOptions, options]);

  const selectedOption = useMemo(() => {
    if (variant === "input") {
      return value?.options[value?.options.findIndex((o) => o?.id === selectedKey)];
    }

    if (variant === "preset_input") {
      return value?.options[value?.options.findIndex((o) => o?.id === selectedKey)];
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedKey, variant]);

  const selectedOriginalOption = useMemo(() => {
    if (variant === "input") {
      return options[options.findIndex((o) => o.id === selectedKey)];
    }

    if (variant === "preset_input") {
      return options[presetOptions.findIndex((o) => o.id === selectedKey)];
    }
  }, [selectedKey, variant, presetOptions, options]);

  const handleChange = (key: string) => {
    let option;
    if (variant === "input") {
      option = options[options.findIndex((o) => o.id === key)];
    }

    if (variant === "preset_input") {
      option = presetOptions[presetOptions.findIndex((o) => o.id === key)];
    }

    if (option && !option.is_customized) {
      delete option.is_customized;
      onChange?.({
        id: config.id,
        type: config.input.input_type,
        name: config.name ?? "",
        operator: {
          name: defaultOperator.name,
          operator: defaultOperator.operator,
        },
        options: [option],
      });
    }

    if (option && option.is_customized) {
      onChange?.({
        id: config.id,
        type: config.input.input_type,
        name: config.name ?? "",
        operator: {
          name: defaultOperator.name,
          operator: defaultOperator.operator,
        },
        options: [
          {
            id: option.id,
            name: option.name,
            operator: option.operator,
            values: [],
          },
        ],
      });
    }
  };

  const content = () => {
    switch (variant) {
      case "preset_input": {
        if (!isEmpty(config.input.preset_input_config)) {
          const icon = config.input.preset_input_config?.icon;

          return (
            <Select
              variant="outlined"
              value={selectedKey}
              className={clsx(classes.select, { [classes.selectHasIcon]: !!icon })}
              displayEmpty
              onChange={(e) => handleChange(e.target.value as string)}
              startAdornment={<SearchConditionInputIcon type={icon} />}
              renderValue={() => <Typography className={classes.selectText}>{config.name}</Typography>}
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
              {presetOptions.length > 0 ? (
                presetOptions.map((o) => (
                  <MenuItem key={o.id} value={o.id} className={classes.menuItem}>
                    {o.name} <Box flex={1} />
                    {selectedKey === o.id && <Check color="primary" />}
                  </MenuItem>
                ))
              ) : (
                <Box paddingY="12px">
                  <Typography align="center">暂无选项</Typography>
                </Box>
              )}
              <MenuItem className={classes.menuItem} key="more" onClick={onMoreOptionClick}>
                更多选项
              </MenuItem>
            </Select>
          );
        }
        return (
          <Typography color="error" style={{ fontSize: 12 }}>
            此 SearchConditionInput 暂不支持 Preset
          </Typography>
        );
      }
      case "input": {
        return (
          <RadioGroup
            className={classes.radioGroup}
            row
            onChange={(_: React.ChangeEvent<HTMLInputElement>, value: string) => handleChange(value)}
            value={selectedKey}
          >
            {options.map((o, i) => (
              <Box key={i} minWidth={206} paddingBottom="12px">
                {!o.is_customized ? (
                  <FormControlLabel
                    className={classes.formControlLabel}
                    value={o.id}
                    control={<Radio color="primary" />}
                    label={o.name}
                  />
                ) : (
                  <FormControlLabel
                    className={classes.formControlLabel}
                    value={o.id}
                    control={<Radio color="primary" />}
                    label={
                      <Box display="flex" alignItems="center">
                        <Typography noWrap variant="inherit">
                          {o.name}
                        </Typography>
                        {selectedOriginalOption?.is_customized && (
                          <Box marginLeft="12px" display="flex" alignItems="center">
                            <RangeInput
                              inputType={config.input.source_type}
                              unit={config.input.source_type_config.unit?.name}
                              datePickerView={config.input.source_type_config.date_picker_type}
                              initialValue={{
                                start: selectedOption?.values?.[0] ?? "",
                                end: selectedOption?.values?.[1] ?? "",
                              }}
                              onChange={(value, label) => {
                                onChange?.({
                                  id: config.id,
                                  name: config.name ?? "",
                                  type: config.input.input_type,
                                  options: [
                                    {
                                      id: o.id,
                                      name: label ?? "",
                                      operator: o.operator,
                                      values: [value.start ?? "", value.end ?? ""],
                                    },
                                  ],
                                  operator: {
                                    name: defaultOperator.name,
                                    operator: defaultOperator.operator,
                                  },
                                });
                              }}
                            />
                          </Box>
                        )}
                      </Box>
                    }
                  />
                )}
              </Box>
            ))}
          </RadioGroup>
        );
      }
    }
  };

  return <Box className={classes.root}>{content()}</Box>;
};

export default Range;
