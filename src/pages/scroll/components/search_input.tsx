import { createStyles, makeStyles } from "@material-ui/core";
import { InputBase, Paper, Theme } from "@material-ui/core";
import React from "react";
import SearchIcon from "@material-ui/icons/Search";
import { useEffect, useRef, useState } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    paper: {
      display: "flex",
      marginLeft: "16px",
      maxWidth: "336px",
      height: 36,
      alignItems: "center",
      border: "1px solid #EEEEEE",
      "&:hover": {
        border: "1px solid #4F709B",
      },
    },
    searchIcon: {
      color: "#666",
      fontSize: 20,
      marginLeft: 12,
    },
    input: {
      marginLeft: 8,
      flex: 1,
    },
  }),
);

interface SearchInputProps {
  getCurrentInput: Function;
}

const SearchInput: React.FunctionComponent<SearchInputProps> = (props) => {
  const classes = useStyles();
  const [currentInput, setCurrentInput] = useState<string>("");
  const [keyDown, setKeyDown] = useState<string>();
  const timer = useRef();

  useEffect(() => {
    if (keyDown == undefined) return;
    props.getCurrentInput(keyDown);
  }, [keyDown]);

  return (
    <Paper elevation={0} component="div" className={classes.paper}>
      <SearchIcon className={classes.searchIcon} />
      <InputBase
        value={currentInput}
        inputProps={{ "aria-label": "搜索" }}
        className={classes.input}
        placeholder={"输入关键词"}
        style={{ fontSize: 14 }}
        onChange={(event): void => {
          clearTimeout(timer.current);
          timer.current = setTimeout(() => {
            setKeyDown(event.target.value);
          }, 2000) as any;
          setCurrentInput(event.target.value);
        }}
        onKeyDown={(event): void => {
          if (event.keyCode === 13 && currentInput) {
            clearTimeout(timer.current);
            setKeyDown(currentInput);
          }
        }}
      />
    </Paper>
  );
};

export default SearchInput;