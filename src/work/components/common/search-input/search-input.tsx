import { InputAdornment, StyledComponentProps, TextField } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Search } from "@material-ui/icons";
import { Autocomplete } from "@material-ui/lab";
import { useDebounceFn } from "ahooks";
import _ from "lodash";
import React, { ReactNode, useEffect, useState } from "react";
import UserContainer from "../../../containers/userContainer";
import { Role, Suggestion, SuggestType, useSuggestionsQuery } from "../../../generated/graphql";
import { parseError } from "../../../utils/error";
import { isAccessError } from "../../../utils/errorHandler";
import SnackbarContainer from "../snackbar/snackbarContainer";
import OptionComponent from "./components/option-component";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    option: {
      minHeight: "auto",
      background: "white",
      width: "100%",
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
    },
    searchIcon: {
      margin: "2px 4px 0 6px",
    },
  }),
);

interface SearchInputProps extends StyledComponentProps {
  // 选择之后的回调
  onSelected?: (suggestion: Suggestion) => void;
  placeholder?: string;
  suggestTypes?: SuggestType[];
  // option 的自定义渲染函数
  // renderOption?: (option: Suggestion, optionState: RenderOptionState) => ReactNode;
  showSearchIcon?: boolean;
  searchIcon?: ReactNode;
  variant?: "filled" | "outlined" | "standard";
}

/**
 * 搜索输入框
 */
const SearchInput: React.FunctionComponent<SearchInputProps> = (props) => {
  const classes = useStyles();
  const { placeholder, suggestTypes, onSelected, showSearchIcon, searchIcon, variant } = props;
  const { openSnackbar } = SnackbarContainer.useContainer();
  const {
    user,
    setTrailServiceDialogOpen,
    setInstitutionAuthenticationDialog,
    setActiveServiceDialogOpen,
  } = UserContainer.useContainer();
  const [suggestKeyword, setSuggestKeyword] = useState("");
  const [{ data, error }, executeSuggestionQuery] = useSuggestionsQuery({
    requestPolicy: "network-only",
    pause: true,
    variables: {
      query: suggestKeyword,
      first: 10,
      suggestTypes: suggestTypes,
    },
  });
  const executeSuggestionQueryWithDebounce = useDebounceFn(executeSuggestionQuery, { wait: 200 });

  const [suggestOptions, setSuggestOptions] = useState<Suggestion[]>([]);

  function handleInputValueChange(values: Suggestion[]): void {
    if (values.length) {
      onSelected && onSelected(values[values.length - 1]);
    }
  }

  function defaultRenderOption(option: Suggestion): ReactNode {
    return <OptionComponent option={option} />;
  }

  useEffect(() => {
    if (suggestKeyword === "") {
      setSuggestOptions([]);
      return;
    }
    executeSuggestionQueryWithDebounce.run();
    return (): void => {
      executeSuggestionQueryWithDebounce.cancel();
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [suggestKeyword]);

  useEffect(() => {
    if (error) {
      const err = parseError(error);
      if (isAccessError(err.code)) {
        openSnackbar(err.message, "error");
        if (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
          setInstitutionAuthenticationDialog(true);
        }
        if (user?.role == Role.Basic) {
          setTrailServiceDialogOpen(true);
        }
        if (user?.role == Role.Expired) {
          setActiveServiceDialogOpen(true);
        }
      }
    }
    if (data) {
      const suggestions = _.get(data, "suggestions.nodes", []) || [];
      setSuggestOptions(suggestions);
      return;
    }
    setSuggestOptions([]);
  }, [data, error]);

  return (
    <div className={classes.root}>
      <Autocomplete
        classes={{
          option: classes.option,
        }}
        disableClearable
        filterOptions={(): Suggestion[] => suggestOptions}
        noOptionsText="无建议"
        multiple
        options={suggestOptions}
        popupIcon={null}
        getOptionLabel={(option: Suggestion): string => {
          return option.primaryName;
        }}
        renderInput={(params): ReactNode => (
          <TextField
            {...params}
            size="small"
            fullWidth
            variant={variant ?? "outlined"}
            InputProps={{
              ...params.InputProps,
              className: params.InputProps.className,
              startAdornment: showSearchIcon ? (
                <InputAdornment position="start" classes={{ positionStart: classes.searchIcon }}>
                  {searchIcon ?? <Search htmlColor="#999999" />}
                </InputAdornment>
              ) : undefined,
              classes: { root: props.classes?.inputRoot, input: props.classes?.input },
            }}
            placeholder={placeholder ?? ""}
          />
        )}
        renderOption={defaultRenderOption}
        renderTags={(): ReactNode => {
          return null;
        }}
        onInputChange={(_, value): void => {
          setSuggestKeyword(value);
        }}
        onChange={(_, value): void => {
          handleInputValueChange(value);
        }}
      />
    </div>
  );
};

export default SearchInput;
