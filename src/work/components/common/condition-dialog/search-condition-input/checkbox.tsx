import { Box, Checkbox, FormControlLabel, MenuItem, Radio, RadioGroup, Select, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { Check } from "mdi-material-ui";
import React, { ChangeEvent, useCallback, useMemo } from "react";
import { MenuProps, SearchConditionInputCommonProps } from ".";
import { SearchConditionOptionInput } from "../../../../generated/graphql";
import { first } from "../../../../utils/tools";
import SearchConditionInputIcon from "../../../realm/search-condition-input-icon";
import Space from "../../space";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    formControlLabel: {
      margin: 0,
      marginLeft: -2,
      "& .MuiRadio-root": {
        padding: 0,
      },
      "& .MuiCheckbox-root": {
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
    radioGroup: {
      "& >:not(:first-child)": {
        paddingLeft: 12,
      },
    },
    menuItem: {
      "&[aria-selected='true']": {
        backgroundColor: "white",
      },
    },
  }),
);

// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface CheckBoxProps extends SearchConditionInputCommonProps {}

const CheckBox: React.FunctionComponent<CheckBoxProps> = (props) => {
  const classes = useStyles();
  const { variant = "input", config, onChange, value, onMoreOptionClick } = props;
  const options = useMemo(() => config.input.input_type_config.options ?? [], [config]);
  const presetOptions = useMemo(() => config.input.preset_input_config?.options ?? [], [config]);
  const defaultOperator = useMemo(() => first(config.input.operators), [config]);
  const activatedOperator = useMemo(() => value?.operator, [value]);
  const operators = useMemo(() => config.input.operators, [config]);
  const selectedKeys = useMemo(() => {
    if (variant === "input") {
      return value?.options?.filter((o) => !!~options.findIndex((p) => p.id === o?.id)).map((o) => o?.id ?? "") ?? [];
    }
    if (variant === "preset_input") {
      return (
        value?.options?.filter((o) => !!~presetOptions.findIndex((p) => p.id === o?.id)).map((o) => o?.id ?? "") ?? []
      );
    }

    return [];
  }, [value, variant, options, presetOptions]);

  const handleChange = useCallback(
    (keys: string[]) => {
      if (variant === "input") {
        const conditionValues = options
          .filter((o) => keys.includes(o.id))
          .map(({ id, name, values, operator }) => ({ id, name, values, operator }));

        onChange?.({
          id: config.id,
          name: config.name ?? "",
          type: config.input.input_type,
          operator: {
            name: defaultOperator.name,
            operator: defaultOperator.operator,
          },
          options: conditionValues,
        });
        return;
      }

      if (variant === "preset_input") {
        const presetConditionValues = presetOptions
          .filter((o) => keys.includes(o.id))
          .map(({ id, name, values, operator }) => ({ id, name, values, operator }));

        onChange?.({
          id: config.id,
          name: config.name ?? "",
          type: config.input.input_type,
          operator: {
            name: defaultOperator.name,
            operator: defaultOperator.operator,
          },
          options: presetConditionValues,
        });

        return;
      }
    },
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [variant],
  );

  const content = () => {
    switch (variant) {
      case "preset_input": {
        if (config.input.preset_input_config) {
          const icon = config.input.preset_input_config.icon;
          return (
            <Select
              variant="outlined"
              multiple
              displayEmpty
              value={selectedKeys}
              className={clsx(classes.select, { [classes.selectHasIcon]: !!icon })}
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
                presetOptions.map((o, i) => (
                  <MenuItem
                    key={i}
                    value={o.id}
                    className={classes.menuItem}
                    onClick={() => {
                      if (selectedKeys.includes(o.id)) {
                        onChange?.({
                          id: config.id,
                          name: config.name,
                          type: config.input.input_type,
                          operator: {
                            name: activatedOperator?.name ?? defaultOperator.name,
                            operator: activatedOperator?.operator ?? defaultOperator.operator,
                          },
                          options: [...(value.options ?? []).filter((f) => f?.id !== o.id)],
                        });
                      } else {
                        onChange?.({
                          id: config.id,
                          name: config.name,
                          type: config.input.input_type,
                          operator: {
                            name: activatedOperator?.name ?? defaultOperator.name,
                            operator: activatedOperator?.operator ?? defaultOperator.operator,
                          },
                          options: [
                            ...((value?.options as SearchConditionOptionInput[]) ?? []),
                            {
                              id: o.id,
                              name: o.name,
                              values: o.values,
                              operator: o.operator,
                            },
                          ],
                        });
                      }
                    }}
                  >
                    {o.name}
                    <Box flex={1} />
                    {selectedKeys.includes(o.id) && <Check color="primary" />}
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
          <>
            <Space size={[0, 12]} wrap>
              {options.map((o, i) => (
                <Box key={i} minWidth={206}>
                  <FormControlLabel
                    className={classes.formControlLabel}
                    control={<Checkbox color="primary" />}
                    value={o.id}
                    checked={!!~selectedKeys.findIndex((s) => s === o.id)}
                    label={o.name}
                    onChange={(e: ChangeEvent<{}>, checked: boolean) => {
                      if (checked) {
                        handleChange([...selectedKeys, e.target["value"]]);
                      }
                      if (!checked) {
                        handleChange([...selectedKeys.filter((p) => p !== e.target["value"])]);
                      }
                    }}
                  />
                </Box>
              ))}
            </Space>
            {selectedKeys.length > 1 && operators.length > 1 ? (
              <>
                <Box height={8} />
                <RadioGroup
                  row
                  className={classes.radioGroup}
                  value={activatedOperator.operator}
                  onChange={(_: React.ChangeEvent<HTMLInputElement>, operatorValue: string) => {
                    const operator =
                      config.input.operators[config.input.operators.findIndex((o) => o.operator === operatorValue)];
                    onChange?.({
                      ...value,
                      operator: {
                        name: operator.name,
                        operator: operator.operator,
                      },
                    });
                  }}
                >
                  {operators.map((o) => (
                    <Box key={o.operator}>
                      <FormControlLabel
                        className={classes.formControlLabel}
                        control={<Radio color="primary" />}
                        label={o.name}
                        value={o.operator}
                        disabled={o.is_locked}
                      />
                    </Box>
                  ))}
                </RadioGroup>
              </>
            ) : null}
          </>
        );
      }
      default:
        return null;
    }
  };

  return content();
};

export default CheckBox;
