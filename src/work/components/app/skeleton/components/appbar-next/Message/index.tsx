import { IconButton, Typography } from "@material-ui/core";
import Drawer from "@material-ui/core/Drawer";
import { makeStyles } from "@material-ui/core/styles";
import { motion } from "framer-motion";
import React, { useCallback, useEffect, useState } from "react";
import "simplebar/dist/simplebar.min.css";
import {
  useMarkAllSystemMessagesAsReadMutation,
  useUnreadSystemMessagesCountQuery,
} from "../../../../../../generated/graphql";
import { Fire } from "../assets";
import MessageList from "./MessageList";

const useStyles = makeStyles({
  openMessageBotton: {
    color: "#FFF",
    padding: 12,
    position: "relative",
  },
  messageCountBox: {
    width: 18,
    height: 18,
    borderRadius: 8,
    backgroundColor: "red",
    position: "absolute",
    top: 5,
    right: 7,
  },
  fire: {
    width: 24,
    height: 24,
  },
  unreadMessageCountText: {
    lineHeight: "16px",
    fontSize: 12,
    fontWeight: 600,
  },
  drawer: {
    "& .MuiDrawer-paperAnchorRight": {
      overflowY: "hidden",
    },
  },
});

const Message: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const [drawerOpen, setDrawerOpen] = useState(false);
  const [unreadMessageCount, setUnreadMessageCount] = useState<number>(0);

  const [unreadSystemMessageCountResult] = useUnreadSystemMessagesCountQuery();
  const [, markAllSystemMessagesAsRead] = useMarkAllSystemMessagesAsReadMutation();

  useEffect(() => {
    if (unreadSystemMessageCountResult) {
      let count = unreadSystemMessageCountResult.data?.unreadSystemMessagesCount?.count;

      if (count === undefined || count === null) count = 0;
      setUnreadMessageCount(count);
    }
  }, [unreadSystemMessageCountResult]);

  const handleFireButtonClick = useCallback(() => {
    setDrawerOpen(true);
    if (unreadMessageCount) markAllSystemMessagesAsRead();
    setUnreadMessageCount(0);
  }, [setDrawerOpen, unreadMessageCount, markAllSystemMessagesAsRead]);

  const handleCloseDrawer = useCallback(() => {
    setDrawerOpen(false);
  }, [setDrawerOpen]);

  return (
    <>
      <IconButton size="small" className={classes.openMessageBotton} onClick={handleFireButtonClick}>
        <Fire />
        {unreadMessageCount !== 0 && (
          <motion.div
            animate={{
              x: [12, 12, 12],
              y: [-22, -26, -24, -22],
            }}
            transition={{
              duration: 0.6,
              ease: "easeInOut",
              times: [0, 0.2, 0.4, 0.6],
              loop: Infinity,
              repeatDelay: 1,
            }}
          >
            <div className={classes.messageCountBox}>
              <Typography className={classes.unreadMessageCountText}>{unreadMessageCount}</Typography>
            </div>
          </motion.div>
        )}
      </IconButton>
      <Drawer anchor={"right"} open={drawerOpen} onClick={handleCloseDrawer} className={classes.drawer}>
        <MessageList toggleDrawer={handleCloseDrawer} />
      </Drawer>
    </>
  );
};

export default Message;
