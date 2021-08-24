import { Box, List, ListItem, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles, useTheme } from "@material-ui/core/styles";
import Tippy from "@tippyjs/react";
import clsx from "clsx";
import { useRouter } from "next/router";
import React, { ElementType, ReactNode, useEffect, useRef, useState } from "react";
import DrawerItem from "./drawer-item";
import DrawerModal from "./drawer-modal";
import DrawerContainer from "./drawerContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: 36,
      paddingLeft: 16,
      paddingRight: 0,
      paddingTop: 6,
      paddingBottom: 6,
      display: "flex",
      alignItems: "center",
      whiteSpace: "nowrap",
      fontSize: "14px",
      color: "#333333",
    },
    title: {
      fontSize: "14px",
      opacity: 1,
      transition: "opacity 200ms ease-out",
      transitionDelay: "200ms",
      marginLeft: 4,
      flex: 1,
      fontWeight: 500,
    },
    subtitle: {
      color: "#666",
    },
    titleFade: {
      opacity: 0,
      transition: "opacity 200ms ease-out",
    },
    active: {
      color: theme.palette.primary.main,
      background: "none",
    },
    tooltip: {
      backgroundColor: "#fff",
      color: "#333",
    },
    tippy: {
      "&:focus": {
        outline: 0,
      },
    },
    fade: {
      transition: "all 250ms ease-out",
      transitionDelay: "250ms",
      display: "flex",
      justifyContent: "flex-end",
    },
    fadeIn: {
      opacity: 1,
      visibility: "visible",
      maxHeight: 1000,
    },
    fadeOut: {
      opacity: 0,
      visibility: "hidden",
      maxHeight: 0,
      transition: "all 200ms ease-out",
    },
    hidden: {
      display: "none",
    },
    toggleIcon: {
      marginTop: 2,
    },
    listItem: {
      paddingLeft: 45,
    },
    disableClick: {
      cursor: "default",
    },
  }),
);

export interface DrawerItemProps {
  title: string;
  icon?: ElementType;
  href?: string;
  onClick?: () => void;
}

export interface DrawerGroupProps {
  type: "drawerGroup";
  title: string;
  icon?: ElementType;
  href?: string;
  match?: string;
  items?: DrawerItemProps[];
  onClick?: () => void;
}

const DrawerGroup: React.FunctionComponent<DrawerGroupProps> = (props) => {
  const classes = useStyles();
  const [isActive, setIsActive] = useState(true);

  const router = useRouter();
  const theme = useTheme();
  const { href, title, icon: Icon, items, match, onClick } = props;
  const { drawerOpen } = DrawerContainer.useContainer();
  const iconRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (items && items.length > 0) {
      const hrefs = items.map((item) => item.href);
      const active = hrefs.some((href) => router.asPath === href);
      setIsActive(active);
      return;
    }

    const active = match ? router.pathname.includes(match ?? "") : router.asPath === href;
    setIsActive(active);
  }, [href, items, match, router.asPath, router.pathname]);

  function onDrawerGroupClick(e: React.MouseEvent<HTMLDivElement, MouseEvent>, disableClick: boolean) {
    if (disableClick) {
      onClick && onClick();
      e.stopPropagation();
      return;
    }

    const url = href || (items && items[0].href) || "";

    onClick && onClick();
    router.push(url);
  }

  function onDrawerItemClick(href: string | undefined) {
    router.push(href ?? "");
  }

  function drawerItemsComponent(items: DrawerItemProps[]): ReactNode {
    return (
      <Box className={clsx(classes.fade, drawerOpen ? classes.fadeIn : classes.fadeOut)}>
        <List component="div" disablePadding style={{ width: "100%" }}>
          {items.map((itemProps, index) => (
            <ListItem key={index} button className={classes.listItem} onClick={() => onDrawerItemClick(itemProps.href)}>
              <DrawerItem {...itemProps} />
            </ListItem>
          ))}
        </List>
      </Box>
    );
  }

  function drawerGroupComponent(): JSX.Element {
    const disableClick = (drawerOpen && items && items.length > 0) ?? false;

    return (
      <ListItem
        classes={{
          root: clsx(
            classes.root,
            isActive ? classes.active : undefined,
            disableClick ? classes.disableClick : undefined,
          ),
        }}
        button
        onClick={(e) => onDrawerGroupClick(e, disableClick)}
      >
        <div style={{ display: "flex", alignItems: "center", width: "100%" }}>
          <div style={{ lineHeight: 0, minWidth: 24 }} ref={iconRef}>
            {Icon && <Icon style={{ color: isActive ? theme.palette.primary.main : "#666", fontSize: "24px" }} />}
          </div>
          <Typography
            className={clsx(
              classes.title,
              drawerOpen ? null : classes.titleFade,
              isActive ? classes.active : undefined,
            )}
          >
            {title}
          </Typography>
        </div>
      </ListItem>
    );
  }

  return (
    <>
      <Tippy
        className={classes.tippy}
        duration={0}
        interactive
        maxWidth="none"
        appendTo={iconRef.current ?? undefined}
        content={<DrawerModal items={items ?? []} title={title} href={href} />}
        placement="right-start"
        popperOptions={{
          strategy: "fixed",
        }}
        hideOnClick={false}
      >
        {drawerGroupComponent()}
      </Tippy>
      {/* {items && isActive && drawerItemsComponent(items)} */}
    </>
  );
};

export default DrawerGroup;
