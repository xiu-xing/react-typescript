import { InputAdornment, TextField } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Search } from "@material-ui/icons";
import { Autocomplete } from "@material-ui/lab";
import clsx from "clsx";
import _ from "lodash";
import React, { ReactNode, useEffect, useState } from "react";
import { FilterConditionItemCommonProps } from "..";
import {
  RealmSuggestion,
  SuggestionFilter as SuggestionFilterModel,
  useRealmSuggestionsQuery,
} from "../../../../generated/graphql";
import OptionComponent from "./components/option";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      minWidth: 160,
    },
    notchedOutline: {
      borderColor: "#eee",
    },
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

export interface SuggestionFilterOwnerProps {
  solo?: boolean;
  showSearchIcon?: boolean;
  searchIcon?: ReactNode;
  placeholder?: string;
  hideLogo?: boolean;
  className?: string;
  selectedValues?: RealmSuggestion[];
  controller?: boolean;
}

interface SuggestionFilterProps extends FilterConditionItemCommonProps, SuggestionFilterOwnerProps {
  filter: SuggestionFilterModel;
}

const SuggestionFilter: React.FunctionComponent<SuggestionFilterProps> = (props) => {
  const classes = useStyles();
  const {
    filter,
    selectedValues,
    controller,
    solo,
    placeholder,
    showSearchIcon,
    searchIcon,
    hideLogo,
    className,
    onChange,
  } = props;

  const [open, setOpen] = useState(false);
  const [values, setValues] = useState<RealmSuggestion[]>([]);
  const [suggestKeyword, setSuggestKeyword] = useState("");
  const [suggestOptions, setSuggestOptions] = useState<RealmSuggestion[]>([]);
  const [{ data, error }, executeRealmSuggestionsQuery] = useRealmSuggestionsQuery({
    requestPolicy: "network-only",
    pause: true,
    variables: {
      query: suggestKeyword,
      first: 10,
      suggestionId: filter.suggestionID || "",
    },
  });

  function handleInputValueChange(value: RealmSuggestion[]): void {
    const newValues = _.uniqWith(value, (a, b) => a.id === b.id);
    if (values === newValues) {
      return;
    }
    if (!controller) {
      setValues(newValues);
    }

    onChange &&
      onChange({
        filterID: filter.id ?? "",
        filterName: filter.name ?? "",
        type: "Suggestion",
        filterValues: value,
      });
  }

  useEffect(() => {
    if (suggestKeyword === "") {
      setSuggestOptions([]);
      return;
    }
    executeRealmSuggestionsQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [suggestKeyword]);

  useEffect(() => {
    if (controller) {
      setValues(selectedValues ?? []);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedValues]);

  useEffect(() => {
    if (data) {
      const suggestions = _.get(data, "realmSuggestions.nodes", []) || [];
      const newSuggestOptions: RealmSuggestion[] = [];
      if (solo) {
        newSuggestOptions.push({
          __typename: "RealmSuggestion",
          id: suggestKeyword,
          primaryName: suggestKeyword,
          description: "关键字",
        });
      }
      suggestions.forEach((suggestion: unknown) => {
        const id: string = _.get(suggestion, "id");
        const primaryName: string = _.get(suggestion, "primaryName");
        const description: string = _.get(suggestion, "description");
        const logo: string = _.get(suggestion, "logo");
        newSuggestOptions.push({
          id: id,
          primaryName: primaryName,
          description: description,
          logo: logo,
          __typename: "RealmSuggestion",
        });
      });
      setSuggestOptions(newSuggestOptions);
      return;
    }
    setSuggestOptions([]);
  }, [data, error]);

  return (
    <Autocomplete
      className={clsx(classes.root, className)}
      classes={{
        option: classes.option,
      }}
      open={open && suggestOptions.length > 0}
      onOpen={(event) => {
        if (event.type !== "mousedown" && event.type !== "focus") {
          setOpen(true);
        }
      }}
      onClose={() => {
        setOpen(false);
      }}
      value={values}
      disableClearable
      filterOptions={(): RealmSuggestion[] => suggestOptions}
      noOptionsText="暂无数据"
      multiple
      options={suggestOptions}
      popupIcon={null}
      openOnFocus
      forcePopupIcon={false}
      getOptionSelected={(option: RealmSuggestion, value: RealmSuggestion): boolean => {
        const findValue = values.find((child) => child.primaryName === option.primaryName);
        if (findValue && findValue.id === value.id) {
          return true;
        }
        return false;
      }}
      renderInput={(params): ReactNode => (
        <TextField
          {...params}
          size="small"
          fullWidth
          variant="outlined"
          InputProps={{
            ...params.InputProps,
            startAdornment: showSearchIcon ? (
              <InputAdornment position="start" classes={{ positionStart: classes.searchIcon }}>
                {searchIcon ?? <Search htmlColor="#999999" />}
              </InputAdornment>
            ) : undefined,
            className: clsx(params.InputProps.className),
            classes: {
              notchedOutline: classes.notchedOutline,
            },
          }}
          placeholder={placeholder ?? ""}
        />
      )}
      renderOption={(option: RealmSuggestion, { selected }): ReactNode => {
        return <OptionComponent option={option} selected={selected} hideLogo={hideLogo} />;
      }}
      renderTags={(): ReactNode => {
        return null;
      }}
      onInputChange={(_, value): void => {
        setSuggestKeyword(value);
      }}
      onChange={(_, value): void => {
        handleInputValueChange(value);
      }}
      onFocus={(event) => {
        event.preventDefault();
      }}
    />
  );
};

export default SuggestionFilter;
