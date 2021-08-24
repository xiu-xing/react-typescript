import { makeStyles } from "@material-ui/core/styles";
import React from "react";
import AppContainer from "../../../../containers/appContainer";
import DrawerContainer from "../../../common/drawer/drawerContainer";
import Router from "./router";

export interface DrawerStyleProps {
  drawerWidth: number;
}

const useStyles = makeStyles({
  root: {
    transition: "padding-left 200ms ease-out",
  },
  loadingProgress: {
    zIndex: 1002,
    width: "100%",
    position: "fixed",
  },
});

const Body: React.FunctionComponent<{}> = () => {
  const { drawerWidth } = DrawerContainer.useContainer();
  const { showDrawer, showBody } = AppContainer.useContainer();

  const classes = useStyles({ drawerWidth });

  return (
    <>
      <Router
        className={showDrawer ? classes.root : undefined}
        style={{
          paddingLeft: showDrawer ? drawerWidth : 0,
          display: showBody ? "block" : "none",
          position: "relative",
        }}
      />
    </>
  );
};

export default Body;
