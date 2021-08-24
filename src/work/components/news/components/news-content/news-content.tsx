import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { FunctionComponent, useEffect } from "react";
import { Suggestion } from "../../../../generated/graphql";
import { NewsType } from "../../../../models/news/news";
import Loading from "../../../common/loading/loading";
import NewsContainer from "../../newsContainer";
import AllNewsContent from "./components/all-news";
import Institution from "./components/institution";

const useStyles = makeStyles(() =>
  createStyles({
    newsList: {
      width: "100%",
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
    },
    newsBox: {
      width: "100%",
      maxWidth: 1144,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      marginTop: 16,
    },
    loading: {
      height: 90,
      width: "100%",
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
  }),
);

interface NewsContentWrapperProps {
  newsType: NewsType;
}

const NewsContentWrapper: FunctionComponent<NewsContentWrapperProps> = ({ newsType }) => {
  const classes = useStyles();
  const { fetchingPage } = NewsContainer.useContainer();

  if (fetchingPage) {
    return (
      <div className={classes.loading}>
        <Loading size={36} />
      </div>
    );
  }

  switch (newsType) {
    case NewsType.MyInstitution:
      return <Institution />;
  }

  return <AllNewsContent />;
};

interface NewsContentProps {
  newsType: NewsType;
  suggestion?: Suggestion;
}

const NewsContent: React.FunctionComponent<NewsContentProps> = ({ newsType }) => {
  const classes = useStyles();

  useEffect(() => {
    document.documentElement.scrollTo({ top: 0 });
  }, []);

  return (
    <div>
      <div className={classes.newsBox}>
        <div className={classes.newsList}>
          <NewsContentWrapper newsType={newsType} />
        </div>
      </div>
    </div>
  );
};

export default NewsContent;
