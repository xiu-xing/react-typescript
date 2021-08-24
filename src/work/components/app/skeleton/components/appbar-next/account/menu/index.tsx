import { List, ListItem, ListItemAvatar, ListItemIcon, ListItemText, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { SquareEditOutline } from "mdi-material-ui";
import { useRouter } from "next/router";
import { destroyCookie } from "nookies";
import React, { ComponentType, SVGProps, useState } from "react";
import AppContainer from "../../../../../../../containers/appContainer";
import UserContainer from "../../../../../../../containers/userContainer";
import { Role } from "../../../../../../../generated/graphql";
import { getResourceUrl } from "../../../../../../../utils/url";
import ContactUsDialog from "../../../../../../common/dialog/contact-us-dialog/contact-us-dialog";
import EntityAvatar from "../../../../../../common/entity-avatar-next/entity-avatar";
import FeedbackContent from "../../../../../../common/feedback-content";
import { ContactUsSVG, Exit } from "../assets";

interface MenuItemModel {
  href?: string;
  title: string;
  icon: ComponentType<SVGProps<SVGSVGElement>>;
}

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    item: {
      padding: "16px 32px",
    },
    itemIcon: {
      minWidth: 40,
      pointerEvents: "none",
    },
    paddingTop16: {
      paddingTop: "20px",
      borderTop: "1px solid #eee",
    },
    listItemText: {
      margin: 0,
    },
    title: {
      fontSize: "14px",
      color: "#666",
      marginInlineStart: "32px",
    },
    listItem: {
      padding: "12px 32px",
    },
    avatar: {
      width: 32,
      height: 32,
    },
    listItemAvatar: {
      minWidth: 48,
    },
  }),
);

const menuItems: Array<MenuItemModel> = [
  // {
  //   href: "/institution",
  //   title: "机构全貌",
  //   icon: Mechanism,
  // },
  // {
  //   href: "/team-members",
  //   title: "成员管理",
  //   icon: Team,
  // },
  // {
  //   href: "/exporter",
  //   title: "我的下载",
  //   icon: Exporter,
  // },
  // {
  //   href: "/",
  //   title: "订单管理",
  //   icon: Payment,
  // },
];

const Menu: React.FunctionComponent = () => {
  const classes = useStyles();
  const { showDialog } = AppContainer.useContainer();
  const { user, defaultTeam } = UserContainer.useContainer();
  const router = useRouter();

  const [contactUsDialogOpen, setContactUsDialogOpen] = useState(false);

  return (
    <>
      <List disablePadding className={clsx(classes.root, { [classes.paddingTop16]: defaultTeam })}>
        {defaultTeam && (
          <>
            <Typography className={classes.title}>我的机构</Typography>
            <ListItem className={classes.listItem}>
              <ListItemAvatar className={classes.listItemAvatar}>
                <EntityAvatar
                  className={classes.avatar}
                  src={defaultTeam?.portraitUri ? getResourceUrl(defaultTeam?.portraitUri) : ""}
                />
              </ListItemAvatar>
              <ListItemText className={classes.listItemText} primary={<Typography>{defaultTeam?.name}</Typography>} />
            </ListItem>
          </>
        )}
        {defaultTeam &&
          menuItems.map((item) => (
            <ListItem
              key={item.title}
              button
              className={classes.item}
              onClick={(): void => {
                item.href && router.push(item.href);
              }}
            >
              <ListItemIcon className={classes.itemIcon}>
                <item.icon />
              </ListItemIcon>
              <ListItemText className={classes.listItemText} primary={<Typography>{item.title}</Typography>} />
            </ListItem>
          ))}
        <ListItem
          button
          className={classes.item}
          onClick={(): void => {
            setContactUsDialogOpen(true);
          }}
        >
          <ListItemIcon className={classes.itemIcon}>
            <ContactUsSVG />
          </ListItemIcon>
          <ListItemText className={classes.listItemText} primary={<Typography>联系我们</Typography>} />
        </ListItem>
        <ListItem
          button
          className={classes.item}
          onClick={(): void => {
            showDialog({
              fullWidth: true,
              maxWidth: "xs",
              children: <FeedbackContent />,
            });
          }}
        >
          <ListItemIcon className={classes.itemIcon}>
            <SquareEditOutline style={{ fontSize: "22px", marginLeft: "-3px" }} />
          </ListItemIcon>
          <ListItemText className={classes.listItemText} primary={<Typography noWrap>意见反馈</Typography>} />
        </ListItem>
        <ListItem
          button
          className={classes.item}
          onClick={(): void => {
            destroyCookie(null, "access_token", {
              path: "/",
            });
            window.location.href = "/login";
          }}
        >
          <ListItemIcon className={classes.itemIcon}>
            <Exit />
          </ListItemIcon>
          <ListItemText className={classes.listItemText} primary={<Typography>退出登录</Typography>} />
        </ListItem>
      </List>
      <ContactUsDialog
        open={contactUsDialogOpen}
        onClose={(): void => {
          setContactUsDialogOpen(false);
        }}
      />
    </>
  );
};

export default Menu;
