import { makeStyles, Theme } from "@material-ui/core/styles";
import { SearchOutlined } from "@material-ui/icons";
import * as React from "react";

const useStyles = makeStyles((theme: Theme) => ({
  container: {
    position: "relative",
    height: 36,
    width: 40,
  },
  searchBox: {
    position: "absolute",
    display: "flex",
    background: "#ffffff",
    height: 36,
    border: "1px solid #fff",
    borderRadius: 36,
    padding: 10,
    "&:hover": {
      border: "1px solid #e3e3e3",
    },
    "&:hover input": {
      width: 240,
    },
    "&:hover a": {
      color: theme.palette.primary.main,
      background: "white",
    },
  },
  searchBtn: {
    color: "#666666",
    float: "right",
    width: 16,
    height: 16,
    borderRadius: "50%",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    transition: "0.4s",
    textDecoration: "none",
  },
  searchText: {
    border: "none",
    background: "none",
    outline: "none",
    float: "left",
    padding: 0,
    color: "#666666",
    fontSize: 14,
    transition: "0.4s",
    lineHeight: 1,
    width: 0,
  },
  icon: {
    width: 20,
    height: 20,
  },
}));

const Search: React.FunctionComponent = () => {
  const classes = useStyles();

  return (
    <div className={classes.container}>
      <div className={classes.searchBox}>
        <input className={classes.searchText} type="text" placeholder="搜索投资机构" />
        <div className={classes.searchBtn}>
          <SearchOutlined className={classes.icon} />
        </div>
      </div>
    </div>
  );
};

export default Search;
