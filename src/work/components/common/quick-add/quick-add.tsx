import { Box, CircularProgress, IconButton, InputBase, List, ListItem, Paper } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import useAutocomplete from "@material-ui/lab/useAutocomplete";
import { CloseCircle, Magnify } from "mdi-material-ui";
import React, { ReactNode, useEffect, useRef, useState } from "react";
import { useClient } from "urql";
import UserContainer from "../../../containers/userContainer";
import {
  EntityType,
  QuickSearchEntityNode,
  Role,
  Suggestion,
  SuggestionsDocument,
  SuggestionsQuery,
  SuggestionsQueryVariables,
  SuggestType,
  useQuickSearchTrendingQuery,
} from "../../../generated/graphql";
import { parseError } from "../../../utils/error";
import { isAccessError } from "../../../utils/errorHandler";
import { useIncrementalCounter } from "../../../utils/hooks";
import { nonNullableArray } from "../../../utils/typesNarrow";
import EntityItem from "../entity-item/entity-item";
import SnackbarContainer from "../snackbar/snackbarContainer";
const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "relative",
      width: 260,
      height: 36,
    },
    paper: {
      backgroundColor: "#f8f8f8",
      paddingRight: 4,
      paddingLeft: 4,
      borderRadius: 4,
      display: "flex",
      alignItems: "center",
    },
    popover: {
      width: 260,
      maxHeight: 500,
    },
    iconBox: {
      width: 36,
      height: 36,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    searchIcon: {
      fontSize: 20,
      color: "#a6a6a6",
      opacity: 0.6,
      marginLeft: 4,
      marginRight: 4,
    },
    input: {
      "& ::placeholder": {
        color: "#A6A6A6",
        fontSize: 16,
        fontWeight: 500,
        opacity: 1,
        userSelect: "none",
      },
      fontSize: 16,
      textOverflow: "ellipsis",
    },
    listOutBox: {
      position: "absolute",
      zIndex: 501,
      left: 0,
      top: 44,
      width: "100%",
      maxHeight: 500,
      overflow: "auto",
    },
    listBox: {
      padding: 0,
    },
    helpText: {
      color: "#a6a6a6",
      fontSize: 16,
      padding: 10,
      paddingLeft: 36,
      fontWeight: 500,
    },
    loadingBox: {
      height: 40,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
  }),
);

export type Option = {
  avatar: string;
  id: string;
  title: string;
  description: string;
  entityType: EntityType;
};

function trendsToOption(trends: QuickSearchEntityNode[]): Option[] {
  return trends.map(
    ({ nodeId, title, logoURI, description }): Option => ({
      id: nodeId || "",
      title: title || "",
      avatar: logoURI || "",
      description: description || "",
      entityType: EntityType.Organization,
    }),
  );
}
function suggestionsToOption(suggestions: Suggestion[]): Option[] {
  return suggestions.map(
    ({ id, logo, primaryName, description, entityType }): Option => ({
      id: id,
      avatar: logo,
      title: primaryName,
      description: description ?? "",
      entityType: (entityType || "") as EntityType,
    }),
  );
}

interface QuickAdd {
  onSuccess(): void;
  fetching?: boolean;
  handleItemClick(entityId: string, entityType: EntityType, name?: string): void;
  suggestTypes: Array<SuggestType>;
  clearButtonRef?: React.MutableRefObject<HTMLButtonElement | null>;
}

const QuickAdd: React.FunctionComponent<QuickAdd> = (props) => {
  const client = useClient();
  const classes = useStyles();
  const [value, setValue] = useState<Option>();
  const [options, setOptions] = useState<Option[]>([]);
  const { getRootProps, getInputProps, getListboxProps, getOptionProps, getClearProps, popupOpen, inputValue } =
    useAutocomplete({
      options,
      getOptionLabel: (option: Option): string => option.title,
      clearOnEscape: true,
      autoHighlight: true,
      blurOnSelect: true,
    });
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [suggestionsFetching, setSuggestionsFetching] = useState(false);
  const { user, setTrailServiceDialogOpen, setActiveServiceDialogOpen, setInstitutionAuthenticationDialog } =
    UserContainer.useContainer();
  const { count: suggestionsQueryCount, increasingCounter: increasingSuggestionsQueryCounter } =
    useIncrementalCounter(200);
  // const clearButtonRef = useRef<HTMLButtonElement | null>(null);
  const popupPaperRef = useRef<HTMLDivElement | null>(null);

  const getSuggestions = async (): Promise<void> => {
    try {
      setSuggestionsFetching(true);
      const suggestionsResult = await client
        .query<SuggestionsQuery, SuggestionsQueryVariables>(
          SuggestionsDocument,
          {
            first: 50,
            suggestTypes: props.suggestTypes,
            query: inputValue,
          },
          {
            requestPolicy: "network-only",
          },
        )
        .toPromise();
      if (suggestionsResult.error) {
        const err = parseError(suggestionsResult.error);
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
      const suggestions = suggestionsResult.data?.suggestions?.nodes;
      if (suggestions) {
        setOptions(() => [...suggestionsToOption(nonNullableArray(suggestions))]);
        return;
      }
    } catch {
      setOptions(() => []);
    } finally {
      setSuggestionsFetching(false);
    }
  };

  const [trendsQueryResult, executeTrendsQuery] = useQuickSearchTrendingQuery({
    variables: {
      first: 10,
    },
    pause: true,
    requestPolicy: "network-only",
  });

  useEffect(() => {
    if (!popupOpen) {
      setOptions([]);
      return;
    }
    if (trendsQueryResult.error) {
      setOptions([]);
      return;
    }
    const trends: QuickSearchEntityNode[] =
      (trendsQueryResult.data?.quickSearchTrending?.nodes as QuickSearchEntityNode[]) ?? [];
    if (trends.length > 0) {
      setOptions(trendsToOption(nonNullableArray(trends.slice(0, 5))));
      return;
    }
  }, [trendsQueryResult, popupOpen]);

  useEffect(() => {
    if (inputValue === "") {
      return;
    }
    setOptions([]);
    getSuggestions();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [suggestionsQueryCount]);

  useEffect(() => {
    if (!popupOpen) {
      setOptions([]);
      return;
    }
    if (inputValue === "") {
      setOptions([]);
      executeTrendsQuery();
      return;
    }
    increasingSuggestionsQueryCounter();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [inputValue, popupOpen]);

  useEffect(() => {
    const entityId = value?.id;
    const entityType = value?.entityType;

    if (entityId && entityType) {
      props.handleItemClick(entityId, entityType, value?.title);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [value]);

  const getFetchingState = (): boolean => {
    if (props.fetching) {
      return true;
    }
    if (!popupOpen) {
      return false;
    }
    if (inputValue.length !== 0) {
      return suggestionsFetching;
    }
    return false;
  };

  const getTips = (): ReactNode => {
    return getFetchingState() ? (
      <ListItem className={classes.helpText}>加载中...</ListItem>
    ) : options.length === 0 ? (
      <ListItem className={classes.helpText}>没有匹配</ListItem>
    ) : null;
  };

  const getListItems = (): ReactNode => {
    if (!getFetchingState() && options.length !== 0) {
      return options.map((option, index) => (
        <Box {...getOptionProps({ option, index })} key={option.id}>
          <Box onClick={(): void => setValue(option)}>
            <EntityItem
              title={option.title}
              subtitle={option.description}
              logoSrc={option.avatar}
              entityType={option.entityType}
            />
          </Box>
        </Box>
      ));
    }
    return null;
  };

  return (
    <Box {...getRootProps()} className={classes.root}>
      <Paper className={classes.paper} elevation={0}>
        <Box className={classes.iconBox}>
          {getFetchingState() ? (
            <CircularProgress size={16} color="primary" disableShrink />
          ) : (
            <Magnify className={classes.searchIcon} />
          )}
        </Box>
        <InputBase
          {...getInputProps()}
          placeholder="快速添加"
          fullWidth
          className={classes.input}
          disabled={props.fetching}
          endAdornment={
            inputValue !== "" ? (
              <IconButton size="small" {...getClearProps()} ref={props.clearButtonRef} disabled={props.fetching}>
                <CloseCircle fontSize="small" />
              </IconButton>
            ) : null
          }
        />
      </Paper>
      {popupOpen && (
        <Paper className={classes.listOutBox} ref={popupPaperRef}>
          <List {...getListboxProps()} className={classes.listBox}>
            {getTips()}
            {getListItems()}
          </List>
        </Paper>
      )}
    </Box>
  );
};

export default QuickAdd;
