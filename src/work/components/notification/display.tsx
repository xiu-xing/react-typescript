import { Box, Button, Hidden, List, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { getUnixTime } from "date-fns";
import _ from "lodash";
import { FileEyeOutline } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import { uid } from "react-uid";
import AppContainer from "../../containers/appContainer";
import UserContainer from "../../containers/userContainer";
import { Message, MessageItem } from "../../generated/graphql";
import { handleMessageComponentClick } from "../../models/message/message";
import { useReachPageBottom } from "../../utils/hooks";
import DrawerContainer from "../common/drawer/drawerContainer";
import Toolbar, { TOOLBAR_HEIGHT } from "../common/toolbar/toolbar";
import MessageComponent from "./components/message";
import Selector from "./components/selector";
import NotificationContainer, { convertMessageTypeToString, FilterType } from "./container";

interface StyleProps {
  fixedTopHeight: number;
  drawerWidth: number;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    toolBarHolder: {
      height: TOOLBAR_HEIGHT,
    },
    toolBar: {
      boxShadow: "none",
      borderBottom: "1px solid #EEE",
    },
    root: {
      overflowX: "hidden",
    },
    left: {
      position: "fixed",
      width: 170,
      top: ({ fixedTopHeight }: StyleProps): number => fixedTopHeight + TOOLBAR_HEIGHT,
      left: ({ drawerWidth }: StyleProps): number => drawerWidth,
      bottom: 0,
      borderRight: "1px solid #EEE",
    },
    selectors: {
      padding: "24px 0",
    },
    right: {
      flex: 1,
      padding: "16px",
      paddingLeft: 186,
      [theme.breakpoints.down("sm")]: {
        paddingLeft: 16,
      },
    },
    titleArea: {},
    title: {
      fontSize: "1rem",
      fontWeight: 500,
    },
    tip: {
      color: "#666",
      fontSize: "0.85rem",
    },
  }),
);

const selectors: FilterType[] = ["all", "unread", "broadcast", "group", "personal"];

const NotificationDisplay: React.FunctionComponent = () => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const { drawerWidth } = DrawerContainer.useContainer();
  const classes = useStyles({ drawerWidth, fixedTopHeight });

  const {
    message,
    loadMore,
    fetching,
    messageType,
    setMessageType,
    executeAckMessage,
  } = NotificationContainer.useContainer();

  const [displayMessage, setDisplayMessage] = useState<MessageItem[]>([]);
  const [hasUnread, setHasUnread] = useState<boolean>(false);

  useReachPageBottom({
    pause: fetching,
    callBack: loadMore,
  });

  useEffect(() => {
    setHasUnread(message.some((message) => !message.readTime));
    setDisplayMessage(message);
  }, [message]);

  const readAll = (): boolean => {
    const readMessage = displayMessage.map((message) => {
      message.readTime = getUnixTime(Date.now());
      return message;
    });
    setDisplayMessage(readMessage);

    const toRead: Message[] = displayMessage.map((message) => {
      return {
        messageId: message.messageId,
        messageType: message.messageType,
        comType: message.comType,
      };
    });

    executeAckMessage({
      messages: toRead,
    })
      .then((response) => {
        const isSuccess: boolean = _.get(response, ["data", "ackMessage", "success"]);

        if (!isSuccess) {
          return false;
        }
      })
      .catch((e) => {
        console.error(e);
        return false;
      });

    return true;
  };

  return (
    <>
      <Toolbar title="通知" className={classes.toolBar}>
        <Button color="primary" variant="text" startIcon={<FileEyeOutline />} disabled={!hasUnread} onClick={readAll}>
          标记为已读
        </Button>
      </Toolbar>
      <Box className={classes.toolBarHolder} />
      <Box className={classes.root}>
        <Hidden smDown>
          <Box className={classes.left}>
            <List className={classes.selectors}>
              {selectors.map((item, index) => (
                <Selector
                  key={uid(item, index)}
                  value={item}
                  onClick={(): void => {
                    setMessageType(item);
                  }}
                >
                  {convertMessageTypeToString(item)}
                </Selector>
              ))}
            </List>
          </Box>
        </Hidden>
        <Box className={classes.right}>
          <Box className={classes.titleArea}>
            <Typography className={classes.title}>{convertMessageTypeToString(messageType)}</Typography>
          </Box>
          {message.length > 0 ? (
            <List disablePadding>
              {message.map((message, index) => (
                <MessageComponent
                  key={uid(message, index)}
                  value={message}
                  onClick={() => handleMessageComponentClick(message)}
                />
              ))}
            </List>
          ) : (
            <Typography className={classes.tip}>暂无</Typography>
          )}
        </Box>
      </Box>
    </>
  );
};

export default NotificationDisplay;
