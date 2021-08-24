import {
  Box,
  Chip,
  CircularProgress,
  FormControlLabel,
  InputBase,
  MenuItem,
  Paper,
  Radio,
  RadioGroup,
  Select,
  Typography,
  useMediaQuery,
} from "@material-ui/core";
import { grey } from "@material-ui/core/colors";
import { createStyles, darken, makeStyles, Theme, useTheme } from "@material-ui/core/styles";
import Tippy from "@tippyjs/react";
import { useDebounceFn } from "ahooks";
import clsx from "clsx";
import { Check, Magnify, Plus } from "mdi-material-ui";
import React, { useEffect, useMemo, useRef, useState } from "react";
import SimpleBar from "simplebar-react";
import { LifecycleHooks, Plugin, Props } from "tippy.js";
import { MenuProps, SearchConditionInputCommonProps } from "..";
import {
  NextOperator,
  RealmSuggestion,
  SearchConditionOptionInput,
  useRealmSuggestionsQuery,
} from "../../../../../generated/graphql";
import { first } from "../../../../../utils/tools";
import EntityAvatar from "../../../../common/entity-avatar-next/entity-avatar";
import SearchConditionInputIcon from "../../../../realm/search-condition-input-icon";

interface ResizeObservedProps {
  resizeObserved: boolean;
}

type FilteredProps = ResizeObservedProps & Omit<Props, keyof ResizeObservedProps | keyof LifecycleHooks>;

type ExtendedProps = FilteredProps & LifecycleHooks<FilteredProps>;

export const resizeObserved: Plugin<ExtendedProps> = {
  name: "resizeObserved",
  defaultValue: true,
  fn(instance) {
    const { popper, popperInstance } = instance;

    function onResize() {
      popperInstance?.update();
    }

    return {
      onMount(): void {
        popper.addEventListener("resize", onResize);
      },
      onDestroy(): void {
        popper.removeEventListener("resize", onResize);
      },
    };
  },
};

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "relative",
      display: "inline-flex",
      flexWrap: "wrap",
      alignItems: "center",
      borderRadius: "4px",
      padding: "4px 12px",
      cursor: "text",
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
      "& >:not(:first-child)": {
        paddingLeft: 12,
      },
    },
    tip: {
      fontSize: 16,
      color: "#999",
      fontWeight: theme.typography.fontWeightMedium,
    },
    chip: {
      color: "#333",
      fontSize: 14,
      borderRadius: 20,
      lineHeight: "24px",
      backgroundColor: "#E9EDF3",
      margin: "3px",
      "& .MuiChip-label": {
        paddingRight: 0,
      },
      "& .MuiChip-deleteIcon": {
        width: 20,
        height: 20,
        margin: "0 12px 0 2px",
        color: theme.palette.primary.main,
      },
      "& .MuiChip-deleteIcon:hover": {
        color: darken(theme.palette.primary.main, 0.2),
      },
      "&:focus": {
        backgroundColor: darken("#E9EDF3", 0.2),
      },
    },
    input: {
      fontSize: 14,
      minWidth: 200,
    },
    title: {
      fontSize: "0.875rem",
      color: "#333",
      fontWeight: theme.typography.fontWeightRegular,
      lineHeight: "24px",
    },
    subTitle: {
      fontSize: "0.75rem",
      color: "#666",
      lineHeight: "16px",
    },
    logo: {
      width: 24,
      height: 24,
      marginInlineEnd: "6px",
    },
    option: {
      cursor: "pointer",
      "&:hover": {
        backgroundColor: grey[100],
      },
    },
    focused: {
      "& > fieldset": {
        borderWidth: 2,
        borderColor: theme.palette.primary.main,
      },
    },
    fieldset: {
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      margin: 0,
      padding: "0 8px",
      overflow: "hidden",
      position: "absolute",
      borderStyle: "solid",
      borderWidth: "1px",
      borderRadius: "inherit",
      pointerEvents: "none",
      paddingLeft: "8px",
      borderColor: "#EEE",
    },
  }),
);

// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface SearchInputProps extends SearchConditionInputCommonProps {}

const SearchInput: React.FunctionComponent<SearchInputProps> = (props) => {
  const classes = useStyles();
  const { config, variant = "input", value, onChange, onMoreOptionClick } = props;
  const operators = useMemo(() => config.input.operators, [config]);

  const theme = useTheme();
  const down = useMediaQuery(theme.breakpoints.down("sm"));
  const defaultOperator = useMemo(() => first(operators.filter((o) => !o.is_locked)), [operators]);
  const activatedOperator = useMemo(() => value?.operator, [value]);
  const presetOptions = useMemo(() => config.input.preset_input_config?.options ?? [], [config]);
  const suggestionId = useMemo(() => config.input.input_type_config.suggestion_id, [config]);
  const origin = useMemo(() => config.input.input_type_config.suggestion_origin, [config]);

  const [suggestKeyword, setSuggestKeyword] = useState<string>("");
  const [realmSuggestOptions, setRealmSuggestOptions] = useState<RealmSuggestion[]>([]);
  const [openSuggestion, setOpenSuggestion] = useState(false);
  const show = () => setOpenSuggestion(true);
  const hide = () => setOpenSuggestion(false);
  const rootRef = useRef<HTMLDivElement | null>(null);
  const inputRef = useRef<HTMLInputElement | null>(null);
  const [focused, setFocused] = useState(false);
  const [popperWidth, setPopperWidth] = useState<number>();

  const selectedKeys = useMemo(() => {
    if (variant === "preset_input") {
      return (
        value?.options?.filter((o) => !!~presetOptions.findIndex((p) => p.id === o?.id)).map((o) => o?.id ?? "") ?? []
      );
    }

    return value?.options?.map((o) => o?.id ?? "") ?? [];
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [value, variant]);

  const selectedOptions = useMemo(() => {
    if (variant === "preset_input") {
      return value?.options?.filter((o) => !!~presetOptions.findIndex((p) => p.id === o?.id)) ?? [];
    }

    return value?.options ?? [];
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [value, variant]);

  const [{ data, fetching }, executeSuggestionQuery] = useRealmSuggestionsQuery({
    requestPolicy: "network-only",
    pause: true,
    variables: {
      origin: origin,
      query: suggestKeyword ?? "",
      first: 20,
      suggestionId: suggestionId ?? "",
    },
  });

  const suggestionQuery = useDebounceFn(executeSuggestionQuery, { wait: 200 });

  useEffect(() => {
    if (!!suggestKeyword && !!suggestionId) {
      show();
      suggestionQuery.run();
    } else {
      hide();
      setRealmSuggestOptions([]);
    }

    return () => {
      suggestionQuery.cancel();
    };
    //eslint-disable-next-line react-hooks/exhaustive-deps
  }, [suggestKeyword, suggestionId]);

  useEffect(() => {
    setRealmSuggestOptions((data?.realmSuggestions?.nodes as RealmSuggestion[]) ?? []);
  }, [data]);

  const handleInputClick = () => {
    inputRef.current?.focus();
    setFocused(true);
  };

  // eslint-disable-next-line react-hooks/exhaustive-deps
  useEffect(() => {
    setPopperWidth(rootRef.current?.clientWidth);

    return () => {
      setPopperWidth(0);
    };
  });

  const content = () => {
    switch (variant) {
      case "preset_input": {
        if (config.input.preset_input_config && operators.filter((o) => !o.is_locked).length < 2) {
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
                presetOptions.map((o) => (
                  <MenuItem
                    key={o.id}
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
                    {o.name} <Box flex={1} />
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
          <Box
            display="grid"
            gridTemplateColumns={down || !(selectedKeys.length > 1 && operators.length > 1) ? "" : "1fr max-content"}
            gridGap="24px"
            alignItems="center"
          >
            <Tippy
              offset={[0, 2]}
              duration={0}
              maxWidth="none"
              visible={openSuggestion}
              interactive
              placement="auto-start"
              appendTo={document.body}
              popperOptions={{
                strategy: "fixed",
                modifiers: [
                  {
                    name: "preventOverflow",
                    enabled: true,
                  },
                ],
              }}
              content={
                <Box>
                  <Paper style={{ width: popperWidth }}>
                    <SimpleBar style={{ maxHeight: 300, padding: "8px 0" }}>
                      {fetching ? (
                        <Box display="flex" justifyContent="center">
                          <CircularProgress color="primary" disableShrink size={30} thickness={2.8} />
                        </Box>
                      ) : realmSuggestOptions.length > 0 ? (
                        realmSuggestOptions.map((r) => (
                          <Box
                            key={r.id}
                            className={classes.option}
                            display="grid"
                            alignItems="center"
                            padding="8px 12px"
                            gridTemplateColumns="max-content 1fr max-content"
                            width="100%"
                            onClick={() => {
                              if (selectedKeys.includes(r.id)) {
                                onChange?.({
                                  id: config.id,
                                  name: config.name,
                                  type: config.input.input_type,
                                  operator: {
                                    name: activatedOperator?.name ?? defaultOperator.name,
                                    operator: activatedOperator?.operator ?? defaultOperator.operator,
                                  },
                                  options: [...selectedOptions.filter((s) => s?.id !== r.id)],
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
                                    ...selectedOptions,
                                    {
                                      id: r.id,
                                      name: r.primaryName,
                                      values: [r.id],
                                      operator: NextOperator.IncludesAny,
                                    },
                                  ],
                                });
                              }
                            }}
                          >
                            <EntityAvatar src={r.logo as string} className={classes.logo} />
                            <Box overflow="hidden">
                              <Typography noWrap className={classes.title}>
                                {r.primaryName}
                              </Typography>
                              {r.description && (
                                <Typography noWrap className={classes.subTitle}>
                                  {r.description}
                                </Typography>
                              )}
                            </Box>
                            {selectedKeys.includes(r.id) ? (
                              <Check color="primary" fontSize="small" />
                            ) : (
                              <Plus color="primary" fontSize="small" />
                            )}
                          </Box>
                        ))
                      ) : (
                        <Box display="flex" justifyContent="center">
                          <Typography className={classes.tip}>无建议</Typography>
                        </Box>
                      )}
                    </SimpleBar>
                  </Paper>
                </Box>
              }
              onShow={show}
              onHide={hide}
              onClickOutside={() => {
                hide();
                setSuggestKeyword("");
              }}
            >
              <div
                className={clsx(classes.root, "MuiOutlinedInput-root", { ["Mui-focused"]: focused })}
                ref={rootRef}
                onClick={handleInputClick}
              >
                {selectedOptions.map((s) => (
                  <Chip
                    className={classes.chip}
                    key={s?.id as string}
                    label={s?.name}
                    onDelete={() => {
                      onChange?.({
                        id: config.id,
                        name: config.name,
                        type: config.input.input_type,
                        operator: {
                          name: activatedOperator?.name ?? defaultOperator.name,
                          operator: activatedOperator?.operator ?? defaultOperator.operator,
                        },
                        options: [...selectedOptions.filter((f) => f?.id !== s?.id)],
                      });
                    }}
                  />
                ))}
                <InputBase
                  inputRef={inputRef}
                  className={classes.input}
                  value={suggestKeyword}
                  onBlur={() => {
                    setFocused(false);
                  }}
                  onChange={(e) => {
                    const value = e.target.value;
                    setSuggestKeyword(value.trim());
                  }}
                  placeholder={config.input.input_type_config.placeholder ?? ""}
                  startAdornment={<Magnify style={{ color: "#999", fontSize: "18px", marginInlineEnd: "4px" }} />}
                />
                <fieldset className={clsx(classes.fieldset, "MuiOutlinedInput-notchedOutline")} />
              </div>
            </Tippy>
            {selectedKeys.length > 1 && operators.length > 1 ? (
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
            ) : null}
          </Box>
        );
      }
    }
  };

  return content();
};

export default SearchInput;
