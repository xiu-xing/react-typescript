import { Box, ListItem, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import _ from "lodash";
import { ChevronDown } from "mdi-material-ui";
import React, { ReactNode, useEffect, useState } from "react";
import UserContainer from "../../../../containers/userContainer";
import { Role, Suggestion, useSuggestionsQuery } from "../../../../generated/graphql";
import { parseError } from "../../../../utils/error";
import { isAccessError } from "../../../../utils/errorHandler";
import EntityAvatar from "../../entity-avatar-next/entity-avatar";
import SnackbarContainer from "../../snackbar/snackbarContainer";
import { SearchConfig } from "../search-dialog";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      overflow: "hidden",
    },
    groupName: {
      marginTop: 16,
      marginBottom: 8,
      fontSize: 14,
      color: "#666",
    },
    listBox: {
      display: "grid",
      maxWidth: "100%",
      gridTemplateColumns: "100%",
      gridRowGap: 16,
    },
    listItem: {
      display: "flex",
      alignItems: "center",
      cursor: "pointer",
      padding: 0,
    },
    entityLogo: {
      width: 30,
      minWidth: 30,
      height: 30,
      backgroundColor: "transparent",
    },
    contentBox: {
      flex: 1,
      marginLeft: 8,
      overflow: "hidden",
    },
    entityName: {
      fontSize: 14,
      lineHeight: "24px",
    },
    entityLabel: {
      fontSize: 14,
      color: "#666",
    },
    showMoreBox: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      marginTop: 16,
    },
    showMoreSubBox: {
      display: "flex",
      cursor: "pointer",
    },
    showMore: {
      color: theme.palette.primary.main,
      fontSize: 12,
    },
    textEllipsis: {
      maxWidth: "100%",
      overflow: "hidden",
      wordBreak: "break-all",
      whiteSpace: "nowrap",
      textOverflow: "ellipsis",
    },
  }),
);

export interface SearchGroupProps {
  searchConfig: SearchConfig;
  keyword: string;
  onSelected?: (suggestion: Suggestion) => void;
  pageSize?: number;
  expanded?: boolean;
}

const DEFAULT_COUNT = 3;

const SearchGroup: React.FunctionComponent<SearchGroupProps> = (props) => {
  const classes = useStyles();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const {
    user,
    setTrailServiceDialogOpen,
    setInstitutionAuthenticationDialog,
    setActiveServiceDialogOpen,
  } = UserContainer.useContainer();

  const { searchConfig, keyword, onSelected, pageSize, expanded } = props;

  const [{ data, error }, executeSuggestionQuery] = useSuggestionsQuery({
    requestPolicy: "network-only",
    pause: true,
    variables: {
      query: keyword,
      first: pageSize || 30,
      suggestTypes: searchConfig.suggestTypes,
    },
  });

  const [suggestOptions, setSuggestOptions] = useState<Suggestion[]>([]);
  const [showAll, setShowAll] = useState(false);

  useEffect(() => {
    if (keyword === "") {
      setSuggestOptions([]);
      return;
    }
    executeSuggestionQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [keyword]);

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

  const isCollapsed = !expanded && !showAll && suggestOptions.length > DEFAULT_COUNT;
  const renderList = !isCollapsed ? suggestOptions : suggestOptions.slice(0, DEFAULT_COUNT);

  function contentComponent(): ReactNode {
    if (!suggestOptions.length) {
      return null;
    }
    return (
      <div className={classes.root}>
        {searchConfig.name ? <Typography className={classes.groupName}>{searchConfig.name}</Typography> : null}
        <div className={classes.listBox}>
          {renderList.map((entity) => {
            return (
              <ListItem
                key={entity.id}
                className={classes.listItem}
                onClick={(): void => {
                  onSelected?.(entity);
                }}
              >
                <EntityAvatar className={classes.entityLogo} src={entity.logo} />
                <Box className={classes.contentBox}>
                  <Typography className={clsx(classes.entityName, classes.textEllipsis)}>
                    {entity.primaryName}
                  </Typography>
                  <Typography className={clsx(classes.entityLabel, classes.textEllipsis)}>
                    {entity.label || entity.miniLabel}
                  </Typography>
                </Box>
              </ListItem>
            );
          })}
        </div>
        {isCollapsed ? (
          <div className={classes.showMoreBox}>
            <div
              className={classes.showMoreSubBox}
              onClick={(): void => {
                setShowAll(true);
              }}
            >
              <span className={classes.showMore}>展开</span>
              <ChevronDown color="primary" fontSize="small" />
            </div>
          </div>
        ) : null}
      </div>
    );
  }

  return <>{contentComponent()}</>;
};

export default SearchGroup;
