import { useState, useEffect, useMemo } from "react";
import { createContainer } from "unstated-next";
import {
  useMessagesQuery,
  PageInfo,
  MessageItem,
  CommunicationType,
  useAckMessageMutation,
  MessageType,
} from "../../generated/graphql";
import _ from "lodash";

export type FilterType = "all" | "unread" | "broadcast" | "group" | "personal";

export const convertMessageTypeToString = (type: FilterType): string => {
  switch (type) {
    case "all":
      return "全部消息";
    case "broadcast":
      return "广播消息";
    case "group":
      return "分组消息";
    case "personal":
      return "个人消息";
    case "unread":
      return "未读消息";
    default:
      return "";
  }
};

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useNotification() {
  const [hasNextPage, setHasNextPage] = useState<boolean>(true);
  const [fetching, setFetching] = useState<boolean>(false);
  const [endCursor, setEndCursor] = useState<string>();
  const [count, setCount] = useState<number>(0);
  const [messageType, setMessageType] = useState<FilterType>("all");

  const [allMessage, setAllMessage] = useState<MessageItem[]>([]);
  const [allMessageHasUnread, setAllMessageHasUnread] = useState<boolean>(false);
  const [unreadMessage, setUnreadMessage] = useState<MessageItem[]>([]);
  const [unreadMessageHasUnread, setUnreadMessageHasUnread] = useState<boolean>(false);

  const [broadcastMessage, setBroadcastMessage] = useState<MessageItem[]>([]);
  const [broadcastMessageHasUnread, setBroadcastMessageHasUnread] = useState<boolean>(false);

  const [groupMessage, setGroupMessage] = useState<MessageItem[]>([]);
  const [groupMessageHasUnread, setGroupMessageHasUnread] = useState<boolean>(false);

  const [personalMessage, setPersonalMessage] = useState<MessageItem[]>([]);
  const [personalMessageHasUnread, setPersonalMessageHasUnread] = useState<boolean>(false);

  const message: MessageItem[] = useMemo(() => {
    switch (messageType) {
      case "all":
        return allMessage;
      case "broadcast":
        return broadcastMessage;
      case "group":
        return groupMessage;
      case "personal":
        return personalMessage;
      case "unread":
        return unreadMessage;
      default:
        return [];
    }
  }, [allMessage, broadcastMessage, groupMessage, messageType, personalMessage, unreadMessage]);

  const [messagesQueryResult, executeMessageQuery] = useMessagesQuery({
    variables: {
      first: 30,
      after: endCursor,
    },
    pause: true,
    requestPolicy: "network-only",
  });

  const [ackMessageResult, executeAckMessage] = useAckMessageMutation();

  useEffect(() => {
    if (hasNextPage) {
      executeMessageQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [count]);

  useEffect(() => {
    if (messagesQueryResult.fetching) {
      setFetching(true);
    }
    const data = _.get(messagesQueryResult, ["data", "messages", "nodes"]);
    const pageInfo: PageInfo = _.get(messagesQueryResult, ["data", "messages", "pageInfo"]);
    if (data) {
      const uniData = _.unionWith(allMessage, data);
      setAllMessage(uniData.filter((message) => message.messageType === MessageType.Simple));
    }
    if (pageInfo) {
      setHasNextPage(pageInfo.hasNextPage);
      setEndCursor(pageInfo.endCursor as string);
    }

    return (): void => {
      setFetching(false);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [messagesQueryResult]);

  useEffect(() => {
    if (allMessage.length > 0) {
      if (allMessage.some((message) => !message.readTime)) {
        setAllMessageHasUnread(true);
      } else {
        setAllMessageHasUnread(false);
      }
      const unread = allMessage.filter((message) => !message.readTime);
      setUnreadMessage(unread);

      if (unread.length > 0) {
        setUnreadMessageHasUnread(true);
      } else {
        setUnreadMessageHasUnread(false);
      }
      const broadcast = allMessage.filter((message) => message.comType === CommunicationType.Broadcast);
      setBroadcastMessage(broadcast);

      if (broadcast.some((message) => !message.readTime)) {
        setBroadcastMessageHasUnread(true);
      } else {
        setBroadcastMessageHasUnread(false);
      }
      const group = allMessage.filter((message) => message.comType === CommunicationType.Multicast);
      setGroupMessage(group);

      if (group.some((message) => !message.readTime)) {
        setGroupMessageHasUnread(true);
      } else {
        setGroupMessageHasUnread(false);
      }
      const personal = allMessage.filter((message) => message.comType === CommunicationType.Unicast);
      setPersonalMessage(personal);

      if (personal.some((message) => !message.readTime)) {
        setPersonalMessageHasUnread(true);
      } else {
        setPersonalMessageHasUnread(false);
      }
    }
  }, [allMessage]);

  useEffect(() => {
    if (ackMessageResult.data) {
      executeMessageQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [ackMessageResult]);

  return {
    message,
    messageType,
    hasNextPage,
    fetching,
    unread: {
      "all": allMessageHasUnread,
      "personal": personalMessageHasUnread,
      "broadcast": broadcastMessageHasUnread,
      "unread": unreadMessageHasUnread,
      "group": groupMessageHasUnread,
    },
    executeAckMessage,
    setMessageType,
    loadMore: (): void => setCount((prev) => prev + 1),
    setAllMessageHasUnread,
    setPersonalMessageHasUnread,
    setBroadcastMessageHasUnread,
    setUnreadMessageHasUnread,
  };
}

const NotificationContainer = createContainer(useNotification);
export default NotificationContainer;
