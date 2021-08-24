import { Box, Button, Dialog, Typography } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import SearchIcon from "@material-ui/icons/Search";
import { motion } from "framer-motion";
import { useRouter } from "next/router";
import React, { ReactNode } from "react";
import theme from "../../../../../theme";
import Account from "./account";
import AppDownload from "./app-download";
import { Logo } from "./assets";
import { useFocused } from "./atom";
import Message from "./Message/index";
import QuickSearch from "./quick-search";

export const APPBAR_HEIGHT = 48;

const useStyles = makeStyles({
  appBarPlaceholder: {
    height: APPBAR_HEIGHT,
  },
  appbar: {
    position: "fixed",
    width: "100%",
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    backgroundColor: theme.palette.primary.main,
    // boxShadow: "0px 1px 8px 0px rgba(0,0,0,0.2),0px 3px 3px -2px rgba(0,0,0,0.12),0px 3px 4px 0px rgba(0,0,0,0.14)",
    paddingRight: 28,
    zIndex: 1300,
    fontWeight: 500,
    minWidth: 554,
    height: APPBAR_HEIGHT,
  },
  appbarcontentRight: {
    minWidth: 144,
  },
  searchFieldBox: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    marginLeft: 13,
    width: "70%",
    maxWidth: 720,
    minWidth: 410,
  },
  rootContainer: {
    position: "relative",
    backgroundColor: "#F8F8F8",
  },
  logo: {
    height: 18,
    width: 140,
    "& #logo": {
      fill: "#ffffff",
    },
    cursor: "default",
  },
  logoButton: {
    marginRight: 40,
  },
  logoArea: {
    position: "relative",
  },
  paper: {
    flex: 1,
    display: "flex",
    padding: "2px 13px",
    minWidth: 180,
    alignItems: "center",
    height: 34,
    backgroundColor: "#fff",
    borderRadius: 4,
    cursor: "text",
  },
  input: {
    fontSize: 16,
    color: "#A6A6A6",
    margin: "0px 0px 4px 8px",
    userSelect: "none",
  },
  searchIcon: {
    color: "#CCCCCC",
  },
  dialog: {
    animationName: "fadeInDown",
    animationDuration: "2s",
  },
  "@keyframes fadeInDown": {
    from: {
      opacity: 0,
      transform: "translate(0,-1000)",
    },
    to: {
      opacity: 1,
      transform: "translate(0,10)",
    },
  },
});

const AppBar: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const router = useRouter();

  const [focused, setFocused] = useFocused();

  function onLogoButtonClick(): void {
    if (!router.pathname.includes("dashboard")) {
      router.push("/dashboard");
    }
  }

  function logoArea(): ReactNode {
    return (
      <div className={classes.logoArea}>
        <Button onClick={onLogoButtonClick} className={classes.logoButton} size="large">
          <Logo className={classes.logo} pointerEvents="none" />
        </Button>
      </div>
    );
  }

  function searchInput(): ReactNode {
    return (
      <Box
        className={classes.paper}
        onClick={(): void => {
          setFocused(true);
        }}
      >
        <SearchIcon className={classes.searchIcon} />
        <Typography className={classes.input}>搜索</Typography>
      </Box>
    );
  }

  return (
    <>
      <div className={classes.rootContainer}>
        <div className={classes.appbar}>
          <div className={classes.searchFieldBox}>
            {logoArea()}
            {searchInput()}
          </div>
          <div className={classes.appbarcontentRight}>
            <Message />
            <AppDownload />
            <Account />
          </div>
        </div>
      </div>
      <motion.div layoutId={"quick_search"} />
      <div className={classes.appBarPlaceholder} />
      <Dialog
        fullScreen
        open={focused}
        onClose={() => {
          setFocused(false);
        }}
      >
        <QuickSearch />
      </Dialog>
    </>
  );
};

export default AppBar;
