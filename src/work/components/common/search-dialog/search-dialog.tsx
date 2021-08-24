import { Dialog, DialogContent, DialogTitle, IconButton, InputAdornment, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Search } from "@material-ui/icons";
import _ from "lodash";
import { Close } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import { Suggestion, SuggestType } from "../../../generated/graphql";
import InputBase from "../input-base/input-base";
import SearchGroup from "./components/search-group";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    paperRoot: {
      minWidth: 500,
      maxWidth: 500,
    },
    dialogTitleRoot: {
      padding: "8px 16px 8px 24px",
      fontSize: 16,

      display: "flex",
      flexDirection: "row",
      alignItems: "center",
    },
    title: {
      fontSize: 16,
      fontWeight: 500,
      flexGrow: 1,
    },
    closeBtn: {
      padding: theme.spacing(1),
      color: theme.palette.text.primary,
    },
    dialogContentRoot: {
      padding: "0px 24px 16px",
      height: 600,
    },
    searchInput: {
      width: "100%",
      backgroundColor: "#F8F8F8",
      borderRadius: 4,
      marginBottom: 16,
    },
    searchIcon: {
      margin: "2px 8px 0 12px",
    },
    keywordGroup: {
      width: "100%",
      overflow: "hidden",
    },
    groupName: {
      marginBottom: 8,
      fontSize: 14,
      color: "#666",
    },
    keyword: {
      fontSize: 14,
      lineHeight: "24px",
      cursor: "pointer",
    },
  }),
);

export interface SearchConfig {
  name?: string;
  suggestTypes: SuggestType[];
}

interface SearchDialogProps {
  open: boolean;
  setOpen: (open: boolean) => void;
  showKeyword?: boolean;
  searchGroups: SearchConfig[];
  onSelected?: (suggestion?: Suggestion, keyword?: string) => void;
  disableCloseButton?: boolean;
  pageSize?: number;
}

const SearchDialog: React.FunctionComponent<SearchDialogProps> = (props) => {
  const classes = useStyles();
  const { showKeyword, searchGroups, open, setOpen, disableCloseButton, pageSize } = props;

  const [keyword, setKeyword] = useState("");

  const onInputChange = _.throttle((value: string): void => {
    setKeyword(value.trim());
  }, 100);

  function onSelected(suggestion?: Suggestion): void {
    props.onSelected?.(suggestion, keyword);
    setOpen(false);
  }

  useEffect(() => {
    if (!open) {
      setKeyword("");
    }
  }, [open]);

  return (
    <Dialog open={open} classes={{ paper: classes.paperRoot }}>
      <DialogTitle classes={{ root: classes.dialogTitleRoot }} disableTypography>
        <Typography className={classes.title}>搜索</Typography>
        {!disableCloseButton && (
          <IconButton
            size="medium"
            className={classes.closeBtn}
            onClick={(): void => {
              setOpen(false);
            }}
          >
            <Close htmlColor="#666" />
          </IconButton>
        )}
      </DialogTitle>
      <DialogContent classes={{ root: classes.dialogContentRoot }}>
        <InputBase
          className={classes.searchInput}
          startAdornment={
            <InputAdornment position="start" classes={{ positionStart: classes.searchIcon }}>
              <Search fontSize="small" htmlColor="rgba(0,0,0,0.11)" />
            </InputAdornment>
          }
          placeholder="搜索"
          onChange={onInputChange}
          autoFocus
        />
        {showKeyword && keyword ? (
          <div className={classes.keywordGroup}>
            <Typography className={classes.groupName}>关键词</Typography>
            <Typography
              className={classes.keyword}
              onClick={(): void => {
                onSelected();
              }}
            >
              {keyword}
            </Typography>
          </div>
        ) : null}
        {keyword
          ? searchGroups.map((group, index) => {
              return (
                <SearchGroup
                  key={index}
                  keyword={keyword}
                  searchConfig={group}
                  onSelected={onSelected}
                  pageSize={pageSize}
                  expanded={searchGroups.length === 1}
                />
              );
            })
          : null}
      </DialogContent>
    </Dialog>
  );
};

export default SearchDialog;
