import { createStyles, makeStyles, Theme, Typography } from "@material-ui/core";
import { Search } from "@material-ui/icons";
import clsx from "clsx";
import React, { useEffect, useState } from "react";
import AppContainer, { FixedTopStyleProps } from "../../../../../containers/appContainer";
import { NewsType } from "../../../../../models/news/news";
import NewsContainer from "../../../newsContainer";
import ToolbarContainer from "../toolbarContainer";
import Dialog from "./dialog";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "sticky",
      zIndex: 1,
      top: ({ fixedTopHeight }: FixedTopStyleProps): number => fixedTopHeight,
      backgroundColor: "#fff",
    },
    chipRoot: {
      margin: 5,
      padding: "0 8px",
      fontSize: 14,
      border: "none",
      color: "#333",
      background: "rgba(102, 140, 157, 0.14)",
    },
    chipDeleteIcon: {
      color: theme.palette.primary.main,
    },
    buttonContainerBox: {
      height: "100%",
      position: "relative",
    },
    buttonBox: {
      position: "absolute",
      bottom: 0,
    },
    expandedContainer: {
      display: "grid",
      gridTemplateColumns: "1fr 64px",
      gridTemplateRows: "auto",
      paddingTop: 6,
    },

    newsContentTitleBar: {
      boxSizing: "border-box",
      height: 36,
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      marginBottom: 12,
    },
    newsContentTitle: {
      fontSize: 20,
    },
    newsContentTitlePaddingLeft: {
      paddingLeft: 18,
    },
    searchDiv: {
      width: 337,
      height: 36,
      color: "#999999",
      border: "1px solid #EEE",
      borderRadius: 4,
      display: "flex",
      alignItems: "center",
    },
    searchIcon: {
      marginRight: 8,
      marginLeft: 12,
      color: "#999",
    },
  }),
);

interface TitleProps {
  title: string;
}

const NewsTitle: React.FunctionComponent<TitleProps> = ({ title }) => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const classes = useStyles({ fixedTopHeight });
  const { newsType } = NewsContainer.useContainer();
  const { setSearch } = ToolbarContainer.useContainer();
  const [show, setShow] = useState(false);

  useEffect(() => {
    if (newsType === NewsType.All) {
      setShow(true);
      return;
    }
    setShow(false);
  }, [newsType]);

  return (
    <div className={classes.newsContentTitleBar}>
      <Typography
        className={clsx(
          classes.newsContentTitle,
          newsType === NewsType.All ? classes.newsContentTitlePaddingLeft : undefined,
        )}
      >
        {title}
      </Typography>
      {show ? (
        <>
          <div className={classes.searchDiv} onClick={(): void => setSearch(true)}>
            <Search className={classes.searchIcon} />
            关键词搜索
          </div>
          <Dialog />
        </>
      ) : null}
    </div>
  );
};

export default NewsTitle;
