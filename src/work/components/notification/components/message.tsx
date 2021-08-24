import { Box, ListItem, ListItemText, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { formatDistanceToNow, fromUnixTime, getUnixTime } from "date-fns";
import { zhCN } from "date-fns/locale";
import _ from "lodash";
import { Brightness1 } from "mdi-material-ui";
import React, { useState } from "react";
import { MessageItem } from "../../../generated/graphql";
import NotificationContainer from "../container";
import { formatMessageData } from "../../../models/message/message";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "12px 0",
      cursor: "pointer",
    },
    dot: {
      display: (message: MessageItem): string => (message.readTime ? "none" : ""),
      color: theme.palette.primary.main,
      fontSize: "0.5rem",
      marginInlineEnd: "8px",
    },
    title: {
      display: "flex",
      alignItems: "center",
    },
    messageTitle: {
      fontSize: "0.875rem",
      color: "#666",
      lineHeight: 1.72,
    },
    messageSubTitle: {
      fontSize: "0.875rem",
      color: "#999",
      lineHeight: 1.72,
    },
  }),
);

interface MessageProps {
  value: MessageItem;
  onClick?: (value: MessageItem) => void;
}

const Message: React.FunctionComponent<MessageProps> = (props) => {
  const [message, setMessage] = useState<MessageItem>(props.value);
  const { executeAckMessage } = NotificationContainer.useContainer();
  const classes = useStyles(message);

  const readMessage = (): boolean => {
    if (!message.readTime) {
      message.readTime = getUnixTime(Date.now());
      setMessage(message);

      executeAckMessage({
        messages: [
          {
            messageId: message.messageId,
            messageType: message.messageType,
            comType: message.comType,
          },
        ],
      })
        .then((response) => {
          const isSuccess: boolean = _.get(response, ["data", "ackMessage", "success"]);
          if (!isSuccess) {
            return false;
          }
          if (props.onClick) {
            props.onClick(props.value);
          }
        })
        .catch((e) => {
          console.error(e);
          return false;
        });
      return true;
    }
    if (props.onClick) {
      props.onClick(props.value);
    }
    return true;
  };

  return (
    <ListItem divider className={classes.root} onClick={readMessage} button>
      <ListItemText
        primary={
          <Box className={classes.title}>
            <Brightness1 className={classes.dot} />
            <Typography className={classes.messageTitle}>{formatMessageData(message)}</Typography>
          </Box>
        }
        secondary={
          <Typography noWrap className={classes.messageSubTitle}>
            {message.createTime &&
              formatDistanceToNow(fromUnixTime(message.createTime), {
                locale: zhCN,
              })}
          </Typography>
        }
      />
    </ListItem>
  );
};

export default Message;
