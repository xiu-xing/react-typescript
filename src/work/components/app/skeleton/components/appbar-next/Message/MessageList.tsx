import { Button, CircularProgress, List, ListItem, ListItemIcon, makeStyles, Typography } from "@material-ui/core";
import { fromUnixTime } from "date-fns";
import format from "date-fns/format";
import _ from "lodash";
import { ChevronRight, Close, PartyPopper } from "mdi-material-ui";
import { useRouter } from "next/router";
import React, { ReactNode, useEffect, useRef, useState } from "react";
import SimpleBar from "simplebar-react";
import { APPBAR_HEIGHT } from "../../../../../../containers/appContainer";
import { MessageEdge, MessageType, useSystemMessagesQuery } from "../../../../../../generated/graphql";
import theme from "../../../../../../theme";
import CommonAccordionPlaceholder from "../../../../../common/accordion/components/placeholder";

const useStyles = makeStyles({
  root: {
    width: 370,
    height: "100vh",
    position: "relative",
  },
  listBox: {
    display: "flex",
    backgroundColor: theme.palette.primary.main,
    justifyContent: "space-between",
    padding: "12px 24px",
    color: "#FFF",
    position: "fixed",
    width: "inherit",
    height: APPBAR_HEIGHT,
    zIndex: 1,
  },
  listTitle: {
    color: "#FFF",
    fontSize: 14,
    fontWeight: 500,
    verticalAlign: "middle",
    justifyContent: "center",
  },
  closeIcon: {
    fontSize: 20,
    cursor: "pointer",
    zIndex: 1000,
  },
  messageList: {
    padding: 24,
    marginTop: 45,
  },
  messageItem: {
    border: "1px solid #EEEEEE",
    width: "100%",
    padding: 13,
    marginBottom: 13,
    display: "flex",
    flexWrap: "wrap",
    alignItems: "flex-start",
    flexDirection: "column",
    cursor: "auto",
  },
  itemTitleBox: {
    display: "flex",
    justifyContent: "space-between",
    width: "100%",
    padding: "4px 0",
  },
  itemTitleIconBox: {
    minWidth: "fit-content",
    paddingRight: 5,
    verticalAlign: "middle",
    display: "table-cell",
  },
  itemTitle: {
    color: "#666",
    display: "inline-block",
    paddingLeft: 6,
    fontSize: 14,
  },
  itemSubTitle: {
    fontSize: 16,
    color: "#333",
    fontWeight: 500,
    padding: "4px 0",
  },
  content: {
    fontSize: 14,
    color: "#666",
    padding: "4px 0",
  },
  navigationText: {
    color: theme.palette.primary.main,
    fontWeight: 500,
    cursor: "pointer",
  },
  img: {
    width: "100%",
    height: "100%",
    borderRadius: 4,
    marginTop: 10,
  },
  bottomText: {
    textAlign: "center",
    paddingTop: 12,
    color: "#666",
    height: 50,
    display: "flex",
    justifyContent: "center",
  },
  boxEmpty: {
    verticalAlign: "middle",
    width: "100%",
    height: "100%",
    paddingTop: APPBAR_HEIGHT + 24,
  },
});

interface MessageListProps {
  toggleDrawer: VoidFunction;
}

const MessageList: React.FunctionComponent<MessageListProps> = (props) => {
  const { toggleDrawer } = props;
  const classes = useStyles();
  const router = useRouter();
  const [hasNextPage, setHasNextPage] = useState<boolean>(true);
  const [messageList, setMessageList] = useState<MessageEdge[]>([]);
  const messageListRef = useRef<MessageEdge[]>([]);
  const scrollElementRef = useRef<SimpleBar | null>(null);

  const [endCursor, setEndCursor] = useState<string>();
  const [showNoDataPlaceholder, setShowNoDataPlaceholder] = useState(false);

  const [systemMessagesResult] = useSystemMessagesQuery({
    variables: {
      first: 5,
      after: endCursor,
    },
    requestPolicy: "network-only",
  });

  useEffect(() => {
    messageListRef.current = messageList;
  }, [messageList]);

  useEffect(() => {
    if (
      !systemMessagesResult.fetching &&
      systemMessagesResult &&
      systemMessagesResult.data &&
      systemMessagesResult.data.systemMessages
    ) {
      const systemMessages = systemMessagesResult.data.systemMessages;
      setHasNextPage(systemMessages.pageInfo.hasNextPage);

      const edges = (systemMessages.edges ?? []).map((edge) => edge!);

      if (endCursor === undefined && edges.length === 0) {
        setShowNoDataPlaceholder(true);
      }

      setMessageList((oldValue) => {
        const newValue = Array.from(oldValue);
        newValue.push(...edges);
        return newValue;
      });
    }
  }, [systemMessagesResult]);

  const scrollHandler = () => {
    if (
      //@ts-ignore
      scrollElementRef!.current.getScrollElement().scrollTop +
        //@ts-ignore
        scrollElementRef!.current!.getScrollElement().clientHeight ===
        //@ts-ignore
        scrollElementRef!.current!.getScrollElement().scrollHeight &&
      hasNextPage
    ) {
      setEndCursor(_.last(messageListRef.current)?.cursor);
    }
  };

  useEffect(() => {
    if (scrollElementRef.current) {
      //@ts-ignore
      scrollElementRef.current.getScrollElement().addEventListener("scroll", scrollHandler);
    }
    return () => {
      //@ts-ignore
      scrollElementRef.current.getScrollElement().removeEventListener("scroll", scrollHandler);
    };
  }, []);

  function contentBottom(): ReactNode {
    if (!hasNextPage) return <div className={classes.bottomText}>滑到底啦！</div>;
    return (
      <div style={{ justifyContent: "center", textAlign: "center", height: 40 }}>
        <CircularProgress size={30} />
      </div>
    );
  }

  function typeofTitle(type: MessageType) {
    switch (type) {
      case "Update":
        return (
          <ListItemIcon className={classes.itemTitleIconBox}>
            <PartyPopper fontSize="inherit" color="primary" />
            <Typography style={{ color: "#666", display: "inline-block", paddingLeft: 6 }}>新功能上线啦!</Typography>
          </ListItemIcon>
        );
      default:
        return <></>;
    }
  }

  function contentComponent() {
    if (showNoDataPlaceholder)
      return (
        <div className={classes.boxEmpty}>
          <CommonAccordionPlaceholder />
        </div>
      );

    return (
      <List className={classes.messageList}>
        {messageList.map((messageItem, index) => messageItemComponent(index, messageItem))}
        {contentBottom()}
      </List>
    );
  }

  function messageItemComponent(key: number, data: MessageEdge) {
    const messageBody = JSON.parse(data.node.body ?? "");

    return (
      <ListItem className={classes.messageItem} key={key}>
        <div className={classes.itemTitleBox}>
          {data.node.messageType && typeofTitle(data.node.messageType)}
          {data.node.createTime && (
            <Typography style={{ color: "#999" }}>
              {format(fromUnixTime(data.node.createTime ?? 0), "yyyy-MM-dd")}
            </Typography>
          )}
        </div>
        {messageBody.title && <Typography className={classes.itemSubTitle}>{messageBody.title}</Typography>}
        {messageBody.content && <Typography className={classes.content}>{messageBody.content}</Typography>}
        {messageBody.image && (
          <img
            src={messageBody.image}
            alt=""
            className={classes.img}
            onError={(e) => {
              //@ts-ignore
              e.target.style.display = "none";
            }}
          />
        )}
        {messageBody.url && (
          <Button
            onClick={() => {
              router.push(messageBody.url);
            }}
            style={{ padding: "0 2px", marginTop: 16 }}
          >
            <Typography className={classes.navigationText}>体验新功能</Typography>
            <ChevronRight color="primary" />
          </Button>
        )}
      </ListItem>
    );
  }

  return (
    <div
      className={classes.root}
      role="presentation"
      onClick={(e) => {
        e.stopPropagation();
      }}
    >
      <div className={classes.listBox}>
        <Typography className={classes.listTitle}>系统消息</Typography>
        <Close className={classes.closeIcon} onClick={toggleDrawer} />
      </div>
      <SimpleBar style={{ height: "100vh" }} ref={scrollElementRef}>
        {contentComponent()}
      </SimpleBar>
    </div>
  );
};

export default MessageList;
