import { IconButton, InputBase, Paper, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import SearchIcon from "@material-ui/icons/Search";
import { motion } from "framer-motion";
import { Close } from "mdi-material-ui";
import { useRouter } from "next/router";
import React, { ReactNode, useEffect, useRef, useState } from "react";
import AppContainer from "../../../../../../containers/appContainer";
import { Logo } from "../../appbar-next/assets";
import { useAnimationEnd, useFocused, useKeyword } from "../atom";
import DefaultDisplay from "./default-display";
import SearchDisplay from "./search-display";

export const QUICK_SEARCH_APPBAR_HEIGHT = 75;

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "100%",
      width: "100%",
      zIndex: 1400,
      position: "absolute",
    },
    appbar: {
      position: "fixed",
      width: "100%",
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      backgroundColor: theme.palette.primary.main,
      zIndex: 1300,
      fontWeight: 500,
      minWidth: 200,
      height: QUICK_SEARCH_APPBAR_HEIGHT,
    },
    iconButton: {
      margin: "0px 32px",
      color: "#fff",
    },
    container: {
      width: "100%",
      height: "calc(100vh - 75px)",
      backgroundColor: "#FFF",
      position: "fixed",
      top: QUICK_SEARCH_APPBAR_HEIGHT,
      bottom: 0,
      zIndex: 1299,
    },
    paper: {
      flex: 1,
      display: "flex",
      padding: "10px 0px",
      minWidth: 100,
      height: 46,
      alignItems: "center",
      [theme.breakpoints.down("xs")]: {
        marginLeft: 24,
      },
    },
    input: {
      marginLeft: 12,
      flex: 1,
    },
    logoArea: {
      margin: "0px 4.2% 0px 3.8%",
      cursor: "pointer",
    },
    logo: {
      height: 22,
      width: 140,
      minWidth: 110,
      "& #logo": {
        fill: "#ffffff",
      },
      cursor: "pointer",
      [theme.breakpoints.down("xs")]: {
        display: "none",
      },
    },
    searchIcon: {
      color: "#666",
      fontSize: 32,
      marginLeft: 24,
    },
  }),
);

const INPUT_MAX_LENGTH = 50;

const QuickSearch: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const [currentInput, setCurrentInput] = useState<string>("");
  const [, setFocused] = useFocused();
  const { setShowBody } = AppContainer.useContainer();
  const [keyword, setKeyword] = useKeyword();
  const [, setAnimationEnd] = useAnimationEnd();
  const timer = useRef();
  const [count, setCount] = useState(0);
  const router = useRouter();

  useEffect(() => {
    setKeyword(() => currentInput.trim());
  }, [count]);

  function onGoBackButtonClick(): void {
    setFocused(false);
    setShowBody(true);
    setKeyword("");
  }

  function onLogoButtonClick(): void {
    setFocused(false);
    setShowBody(true);
    setKeyword("");
    if (!router.pathname.includes("dashboard")) {
      router.push("/dashboard");
    }
  }

  function searchInput(): ReactNode {
    return (
      <Paper elevation={0} component="div" className={classes.paper}>
        <SearchIcon className={classes.searchIcon} />
        <InputBase
          value={currentInput}
          inputProps={{ "aria-label": "搜索", maxLength: INPUT_MAX_LENGTH }}
          className={classes.input}
          placeholder={"输入关键词后请按回车键进行搜索"}
          style={{ fontSize: 20 }}
          onChange={(event): void => {
            clearTimeout(timer.current);
            timer.current = setTimeout(() => {
              setCount((pre) => pre + 1);
            }, 1000) as any;
            setCurrentInput(event.target.value);
          }}
          onKeyDown={(event): void => {
            if (event.keyCode === 13 && currentInput) {
              clearTimeout(timer.current);
              setKeyword(currentInput.trim());
            }
          }}
          autoFocus
        />
      </Paper>
    );
  }

  return (
    <motion.div
      layoutId={"quick_search"}
      className={classes.root}
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0, transition: { duration: 0.15 } }}
      transition={{ duration: 0.2 }}
      onAnimationEnd={(): void => {
        setAnimationEnd(true);
      }}
    >
      <div className={classes.appbar}>
        <div className={classes.logoArea} onClick={onLogoButtonClick}>
          <Logo className={classes.logo} pointerEvents="none" />
        </div>
        {searchInput()}
        <div>
          <IconButton onClick={onGoBackButtonClick} className={classes.iconButton}>
            <Close />
          </IconButton>
        </div>
      </div>
      <div className={classes.container}>{keyword === "" ? <DefaultDisplay /> : <SearchDisplay />}</div>
    </motion.div>
  );
};

export default QuickSearch;
