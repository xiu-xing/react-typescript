import { Typography } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { HTMLProps, ReactNode } from "react";
import AppContainer from "../../../containers/appContainer";
import DrawerContainer from "../drawer/drawerContainer";

export const TOOLBAR_HEIGHT = 46;

const useStyles = makeStyles({
  root: (props) => ({
    right: 0,
    height: TOOLBAR_HEIGHT,
    maxHeight: TOOLBAR_HEIGHT,
    zIndex: 1000,
    display: "flex",
    padding: "0px 16px",
    position: "fixed",
    alignItems: "center",
    backgroundColor: "#fff",
    left: props["left"],
    boxShadow: "0px 1px 3px 0px rgba(0,0,0,0.2), 0px 2px 1px -1px rgba(0,0,0,0.12), 0px 1px 1px 0px rgba(0,0,0,0.14)",
    minWidth: props["minWidth"],
  }),
  content: {
    width: "100%",
    height: "100%",
    display: "flex",
    alignItems: "center",
    justifyContent: "space-between",
  },
  title: {
    flex: 1,
    color: "#737373",
    fontSize: 16,
    fontWeight: 500,
    lineHeight: "24px",
    whiteSpace: "pre",
  },
});

interface ToolbarProps extends HTMLProps<HTMLDivElement> {
  title?: string;
  avatar?: ReactNode;
  minWidth?: number;
  left?: number;
}

const Toolbar: React.FunctionComponent<ToolbarProps> = (props) => {
  const { drawerWidth } = DrawerContainer.useContainer();
  const { showDrawer } = AppContainer.useContainer();
  const classes = useStyles({
    left: props.left !== undefined ? props.left : showDrawer ? drawerWidth : 0,
    minWidth: props.minWidth,
  });
  return (
    <div className={clsx(classes.root, props.className)}>
      {props.avatar}
      <div className={classes.content}>
        <Typography noWrap className={classes.title}>
          {props.title}
        </Typography>
        {props.children}
      </div>
    </div>
  );
};

export default Toolbar;
