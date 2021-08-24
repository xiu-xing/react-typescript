import { Divider, List, ListItem, Paper, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import router from "next/router";
import React from "react";
import DrawerItem, { DrawerItemProps } from "./drawer-item";
import DrawerContainer from "./drawerContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      backgroundColor: "#fff",
      padding: "4px 0",
    },
    drawerModalList: {
      display: "grid",
      gridRowGap: "4px",
    },
    listItem: {
      padding: "8px 16px",
      minWidth: 120,
    },
    titleBox: {
      minWidth: 120,
      padding: 0,
      margin: 0,
    },
    title: {
      fontSize: 14,
      fontWeight: 500,
      color: "#333",
      padding: "10px 16px",
    },
    active: {
      color: theme.palette.primary.main + " !important",
      background: "none",
    },
    itemtitle: {
      fontSize: 14,
      fontWeight: 400,
      color: "#666",
    },
    hidden: {
      display: "none",
    },
  }),
);

interface DrawerModalProps {
  title: string;
  href?: string;
  items: DrawerItemProps[];
}

const DrawerModal: React.FunctionComponent<DrawerModalProps> = (props) => {
  const classes = useStyles();
  const { items, title, href } = props;
  const { drawerOpen } = DrawerContainer.useContainer();

  function onTitleClick() {
    const url = href || (items && items.length > 0 && items[0].href) || "";

    router.push(url);
  }

  function onDrawerItemClick(href: string | undefined) {
    router.push(href ?? "");
  }

  return (
    <Paper className={classes.root}>
      <List component="div" disablePadding className={classes.drawerModalList}>
        <ListItem button onClick={onTitleClick} className={clsx(classes.titleBox, drawerOpen && classes.hidden)}>
          <Typography className={clsx(classes.title, drawerOpen && classes.hidden)} onClick={onTitleClick}>
            {title}
          </Typography>
        </ListItem>
        {items.length > 0 && (
          <>
            {!drawerOpen && <Divider />}
            {items.map((item) => {
              return (
                <ListItem
                  button
                  className={classes.listItem}
                  key={item.title}
                  onClick={() => onDrawerItemClick(item.href)}
                >
                  <DrawerItem title={item.title} href={item.href} onClick={item.onClick} />
                </ListItem>
              );
            })}
          </>
        )}
      </List>
    </Paper>
  );
};

export default DrawerModal;
