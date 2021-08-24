import { Divider } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import AppContainer, { FixedTopStyleProps } from "../../../../containers/appContainer";
import Chips from "./components/chips";
import NewsTabs from "./components/tabs";
import Tags from "./components/tags";
import NewsTitle from "./components/title";
import ToolbarContainer from "./toolbarContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "sticky",
      zIndex: 1,
      backgroundColor: "#fff",
      top: ({ fixedTopHeight }: FixedTopStyleProps): number => fixedTopHeight,
    },

    hasTab: {
      top: ({ fixedTopHeight }: FixedTopStyleProps): number => fixedTopHeight + 48,
    },
    toolbarBox: {
      width: "100%",
      maxWidth: 1166,
      paddingTop: 24,
    },
    scrollToolBarBox: {
      borderBottom: "none",
      paddingBottom: 1,
    },
  }),
);

interface ToolbarProps {
  title: string;
  showSearch?: boolean;
}

const Toolbar: React.FunctionComponent<ToolbarProps> = (props) => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const { title, showSearch } = props;
  const classes = useStyles({ fixedTopHeight });

  return (
    <ToolbarContainer.Provider>
      <div className={classes.root}>
        <div className={classes.toolbarBox}>
          <NewsTitle title={title} />
          <NewsTabs />
          <Chips />
          {showSearch && <Tags />}
          <Divider />
        </div>
      </div>
    </ToolbarContainer.Provider>
  );
};

export default Toolbar;
