import { Button, DialogContent, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode, useEffect, useState } from "react";
import { MessageItem, useGlobalMessagesQuery } from "../../../../generated/graphql";
import RimeDialog from "../rime-dialog";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    dialogTitle: {
      height: 50,
      padding: "10px 24px 8px",
    },
    title: {
      textAlign: "center",
      fontSize: 18,
      fontWeight: 500,
      marginTop: 12,
    },
    message: {
      fontSize: 16,
      marginTop: 8,
      color: "#737373",
      textAlign: "justify",
    },
    detail: {
      fontSize: 16,
      color: theme.palette.primary.main,
      cursor: "pointer",
      userSelect: "none",
    },
    buttonBox: {
      textAlign: "center",
    },
    button: {
      marginTop: 24,
      marginBottom: 32,
      width: 156,
      height: 38,
      lineHeight: "38px",
      boxShadow: "none",
    },
  }),
);

export interface GlobalMessageBody {
  title: string;
  message: string;
  link?: string;
  linkType?: string;
  parameter?: string;
}

const MESSAGE_KEY = "global_message";

const GlobalMessageDialog: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const [open, setOpen] = useState(false);

  const [message, setMessage] = useState<MessageItem>();
  const [globalMessagesQueryResult, executeGlobalMessagesQuery] = useGlobalMessagesQuery({
    pause: true,
  });

  function onClose(): void {
    setOpen(false);
  }

  useEffect(() => {
    if (message) {
      setOpen(true);
    }
  }, [message]);

  useEffect(() => {
    if (process.browser) {
      executeGlobalMessagesQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    if (globalMessagesQueryResult.data) {
      const messageItem = globalMessagesQueryResult.data.globalMessage;
      if (!messageItem) {
        return;
      }
      setMessage(messageItem as MessageItem);
    }
  }, [globalMessagesQueryResult]);

  function detailComponent(link: string): ReactNode {
    if (!link) {
      return null;
    }
    return (
      <a href={link} style={{ textDecoration: "none" }}>
        <span className={classes.detail}>点击查看</span>
      </a>
    );
  }

  function contentComponent(): ReactNode {
    if (!message) {
      return null;
    }

    const cacheOfMessageId = localStorage.getItem(MESSAGE_KEY);
    if (cacheOfMessageId && cacheOfMessageId === message.messageId) {
      return null;
    }

    const messageBodyString = message.body;
    if (messageBodyString) {
      try {
        const messageBody = JSON.parse(messageBodyString);
        if (!messageBody.message) {
          return null;
        }
        return (
          <RimeDialog open={open} onClose={onClose} classes={{ title: classes.dialogTitle }}>
            <DialogContent>
              {messageBody?.title && <Typography className={classes.title}>{messageBody?.title}</Typography>}
              <Typography className={classes.message}>
                {messageBody?.message}
                {detailComponent(messageBody.link)}
              </Typography>
              <div className={classes.buttonBox}>
                <Button
                  className={classes.button}
                  variant="contained"
                  color="primary"
                  onClick={(): void => {
                    localStorage.setItem(MESSAGE_KEY, message.messageId as string);
                    onClose();
                  }}
                >
                  我已知晓
                </Button>
              </div>
            </DialogContent>
          </RimeDialog>
        );
      } catch (error) {
        return null;
      }
    }
  }

  return <>{contentComponent()}</>;
};

export default GlobalMessageDialog;
