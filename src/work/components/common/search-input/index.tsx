import { Chip, InputAdornment, StyledComponentProps, TextField } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Autocomplete } from "@material-ui/lab";
import { useDebounceFn } from "ahooks";
import React, { ReactNode, useEffect, useState } from "react";
import UserContainer from "../../../containers/userContainer";
import { RealmSuggestion, Role, useRealmSuggestionsQuery } from "../../../generated/graphql";
import { parseError } from "../../../utils/error";
import { isAccessError } from "../../../utils/errorHandler";
import SnackbarContainer from "../snackbar/snackbarContainer";
import OptionComponent from "./components/option-component-next";

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
    input: {},
  }),
);

interface SearchInputProps extends StyledComponentProps {
  suggestionId: string;
  // 选择之后的回调
  onSelected?: (suggestion: RealmSuggestion) => void;
  placeholder?: string;
  disablePopupIcon?: boolean;

  // option 的自定义渲染函数
  // renderOption?: (option: Suggestion, optionState: RenderOptionState) => ReactNode;
  searchIcon?: ReactNode;
}

/**
 * 搜索输入框
 */
const SearchInput: React.FunctionComponent<SearchInputProps> = (props) => {
  const classes = useStyles();
  const { placeholder, suggestionId, onSelected, searchIcon, disablePopupIcon = false } = props;
  const { openSnackbar } = SnackbarContainer.useContainer();
  const { user, setTrailServiceDialogOpen, setInstitutionAuthenticationDialog, setActiveServiceDialogOpen } =
    UserContainer.useContainer();
  const [suggestKeyword, setSuggestKeyword] = useState("");
  const [{ data, error }, executeSuggestionQuery] = useRealmSuggestionsQuery({
    requestPolicy: "network-only",
    pause: true,
    variables: {
      query: suggestKeyword,
      first: 10,
      suggestionId: suggestionId,
    },
  });
  const executeSuggestionQueryWithDebounce = useDebounceFn(executeSuggestionQuery, { wait: 200 });

  const [suggestOptions, setSuggestOptions] = useState<RealmSuggestion[]>([]);

  function handleInputValueChange(values: RealmSuggestion[]): void {
    if (values.length) {
      onSelected && onSelected(values[values.length - 1]);
    }
  }

  function defaultRenderOption(option: RealmSuggestion): ReactNode {
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
    if (data?.realmSuggestions.nodes) {
      setSuggestOptions(data?.realmSuggestions.nodes as RealmSuggestion[]);
      return;
    }
    setSuggestOptions([]);
  }, [data, error]);

  return (
    <Autocomplete
      classes={{
        option: classes.option,
      }}
      disableClearable
      filterOptions={(): RealmSuggestion[] => suggestOptions}
      noOptionsText="无建议"
      multiple
      options={suggestOptions}
      getOptionLabel={(option: RealmSuggestion): string => {
        return option.primaryName;
      }}
      renderInput={(params): ReactNode => (
        <TextField
          {...params}
          size="small"
          fullWidth
          variant="outlined"
          InputProps={{
            ...params.InputProps,
            className: params.InputProps.className,
            startAdornment: searchIcon && (
              <InputAdornment position="start" classes={{ positionStart: classes.searchIcon }}>
                {searchIcon}
              </InputAdornment>
            ),
            classes: { root: props.classes?.inputRoot, input: props.classes?.input },
          }}
          placeholder={placeholder ?? ""}
        />
      )}
      renderOption={defaultRenderOption}
      renderTags={(tagValues, getTagProps) =>
        tagValues.map((option, index) => <Chip label={option.primaryName} {...getTagProps({ index })} key={index} />)
      }
      onInputChange={(_, value): void => {
        setSuggestKeyword(value);
      }}
      onChange={(_, value): void => {
        handleInputValueChange(value);
      }}
    />
  );
};

export default SearchInput;
