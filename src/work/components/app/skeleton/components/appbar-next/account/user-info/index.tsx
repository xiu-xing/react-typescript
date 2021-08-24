import {
  Avatar as MuiAvatar,
  IconButton,
  List,
  ListItem,
  ListItemAvatar,
  ListItemText,
  Theme,
  Typography,
} from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { SquareEditOutline } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import { useClient } from "urql";
import { DefaultAvatar2WebP } from "../../../../../../../assets/webp/avatar";
import UserContainer, { getUser } from "../../../../../../../containers/userContainer";
import { Role } from "../../../../../../../generated/graphql";
import { getResourceUrl } from "../../../../../../../utils/url";
import BasicEllipsisText from "../../../../../../common/ellipsis-text/basic-ellipsis-text";
import ChangeNicknameDialog from "./change-nickname-dialog";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "20px 32px",
    },
    avatar: {
      width: 48,
      height: 48,
      background: "white",
      marginInlineEnd: "16px",
    },
    iconItem: {
      pointerEvents: "none",
      color: theme.palette.primary.main,
    },
    title: {
      color: "#333333",
      fontWeight: 500,
      fontSize: "18px",
    },
    paddingBottom8: {
      paddingBottom: "8px",
    },
    nicknameDisplay: {
      flex: "0 1 auto",
      lineHeight: 26,
    },
    email: {
      fontWeight: 400,
      fontSize: 14,
      color: "#666",
    },
    emailDisplay: {
      margin: 0,
      paddingTop: 0,
      flex: "0 1 auto",
      lineHeight: 24,
    },
    list: {
      margin: 0,
      padding: 0,
    },
    nicknameItem: {
      margin: 0,
      padding: 0,
      height: 26,
      overflow: "visible",
      maxWidth: 236,
    },
    emailItem: {
      margin: 0,
      padding: 0,
      overflow: "visible",
      maxWidth: 236,
    },
  }),
);

const UserInfo: React.FunctionComponent = () => {
  const { user, setUser, defaultTeam } = UserContainer.useContainer();
  const classes = useStyles();
  const client = useClient();

  const [changeNicknameDialogOpen, setChangeNicknameDialogOpen] = useState(false);

  async function refreshUser(): Promise<void> {
    const userInfo = await getUser(client);
    if (userInfo) {
      setUser(userInfo);
    }
  }

  // 解决 SSR 静态问题
  useEffect(() => {
    refreshUser();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <>
      <ListItem
        className={clsx(classes.root, {
          [classes.paddingBottom8]: defaultTeam,
        })}
      >
        <ListItemAvatar>
          <MuiAvatar className={classes.avatar} src={user?.avatarURL ? getResourceUrl(user.avatarURL) : ""}>
            <img src={DefaultAvatar2WebP} />
          </MuiAvatar>
        </ListItemAvatar>
        <List className={classes.list}>
          <ListItem className={classes.nicknameItem}>
            <ListItemText
              primary={
                <Typography noWrap className={classes.title}>
                  {user?.userName}
                </Typography>
              }
              className={classes.nicknameDisplay}
            />
            <IconButton
              onClick={(): void => {
                setChangeNicknameDialogOpen(true);
              }}
            >
              <SquareEditOutline fontSize={"small"} className={classes.iconItem} />
            </IconButton>
          </ListItem>
          {user?.email != "" && (
            <ListItem className={classes.emailItem}>
              <BasicEllipsisText lineClamp={2} className={classes.email} showTooltip>
                {user?.email}
              </BasicEllipsisText>
            </ListItem>
          )}
        </List>
        <ChangeNicknameDialog open={changeNicknameDialogOpen} setOpen={setChangeNicknameDialogOpen} />
      </ListItem>
    </>
  );
};

export default UserInfo;
