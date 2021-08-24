import { IconButton, Typography } from "@material-ui/core";
import Box from "@material-ui/core/Box";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { HTMLProps, ReactNode, useEffect } from "react";
import SimpleBar from "simplebar-react";
import { DrawerElement } from "../../app/skeleton/components/drawer";
import { SVGExpand } from "./assets";
import DrawerDivider from "./drawer-divider";
import DrawerGroup from "./drawer-group";
import DrawerContainer, { DrawerClosedWidth, DrawerOpenedWidth } from "./drawerContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: DrawerClosedWidth,
      display: "flex",
      flexDirection: "column",
      zIndex: 1200,
      background: "white",
      borderRight: "1px solid #eee",
      transition: "width 200ms ease-out",
    },
    rootExpand: {
      width: DrawerOpenedWidth,
      transition: "width 200ms ease-out",
      transitionDelay: "200ms",
    },
    expandButtonArea: {
      flexShrink: 1,
      paddingLeft: theme.spacing(0.5),
      marginBottom: theme.spacing(1),
      display: "flex",
      alignItems: "center",
    },
    expandButtonAreaRight: {
      paddingLeft: theme.spacing(10),
    },
    svgSize: {
      height: "24px",
      width: "24px",
    },
    expandButtonTurnLeft: {
      transform: "rotate(0turn)",
      transition: "200ms ease-out",
    },
    expandButtonTurnRight: {
      transform: "rotate(0.5turn)",
      transition: "200ms ease-out",
    },
    list: {
      width: "100%",
      height: "100%",
    },
    text: {
      opacity: 1,
      transition: "opacity 200ms ease-out",
      transitionDelay: "200ms",
      fontWeight: 500,
      fontSize: 14,
      color: theme.palette.primary.main,
      cursor: "default",
      whiteSpace: "nowrap",
      userSelect: "none",
    },
    subtitle: {
      color: "#666",
    },
    textFade: {
      opacity: 0,
      transition: "opacity 200ms ease-out",
      whiteSpace: "nowrap",
    },
    simpleBar: {
      height: "calc(100% - 48px)",
      overflowX: "hidden",
    },
  }),
);

interface DrawerProps extends HTMLProps<HTMLElement> {
  drawerElement: Array<DrawerElement>;
}

export const Drawer: React.FunctionComponent<DrawerProps> = (props) => {
  const drawerContainer = DrawerContainer.useContainer();
  const classes = useStyles();

  function handleResizing(): void {
    if (document.body.clientWidth < 800 && !!drawerContainer.drawerOpen) {
      drawerContainer.setDrawerOpen(false);
    }
  }

  useEffect(() => {
    window.addEventListener("resize", handleResizing);

    return (): void => window.removeEventListener("resize", handleResizing);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  function rootExpandClass(): string | null {
    if (drawerContainer.drawerOpen) {
      return classes.rootExpand;
    }

    return null;
  }

  function expandButtonIcon(): ReactNode {
    return (
      <SVGExpand
        className={clsx(
          classes.svgSize,
          drawerContainer.drawerOpen ? classes.expandButtonTurnRight : classes.expandButtonTurnLeft,
        )}
      />
    );
  }

  function listItemComponent(index: number, props: DrawerElement): ReactNode {
    switch (props.type) {
      case "divider":
        return <DrawerDivider key={index} {...props} />;
      case "drawerGroup":
        return <DrawerGroup key={index} {...props} />;
      default:
        break;
    }
  }

  function listItemComponents(): ReactNode[] {
    return props.drawerElement.map((Props, index) => listItemComponent(index, Props));
  }

  return (
    <Box className={clsx(classes.root, props.className, rootExpandClass())}>
      <SimpleBar className={classes.simpleBar}>{listItemComponents()}</SimpleBar>
      <Box className={classes.expandButtonArea}>
        <IconButton
          onClick={(): void => {
            sessionStorage.setItem("drawerOpen", `${!drawerContainer.drawerOpen}`);
            drawerContainer.setDrawerOpen(!drawerContainer.drawerOpen);
          }}
        >
          {expandButtonIcon()}
        </IconButton>
        <Typography className={clsx(classes.text, drawerContainer.drawerOpen ? null : classes.textFade)}>
          收起
        </Typography>
      </Box>
    </Box>
  );
};
