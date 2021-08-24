import "overlayscrollbars/css/OverlayScrollbars.css";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import ArticleTab from "./tab/tab";
import { ArticleModuleId } from "./types";
import { Tab } from "../../generated/graphql";
import ArticleContainer from "./container";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
  }),
);

// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface ArticleProps {
  tabs: Tab[];
  articleModuleId: ArticleModuleId;
}

const Article: React.FunctionComponent<ArticleProps> = (props) => {
  const classes = useStyles();
  const { tabs, articleModuleId } = props;

  function contentComponent(): ReactNode {
    if (tabs.length < 0 || tabs[0].__typename != "ArticleTab") {
      return null;
    }
    return (
      <ArticleContainer.Provider>
        <div className={classes.root}>
          <ArticleTab tab={tabs[0]} articleModuleId={articleModuleId} />
        </div>
      </ArticleContainer.Provider>
    );
  }

  return <>{contentComponent()}</>;
};

export default Article;
