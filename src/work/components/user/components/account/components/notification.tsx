import {
  createStyles,
  List,
  ListItem,
  ListItemSecondaryAction,
  ListItemText,
  makeStyles,
  Switch,
} from "@material-ui/core";
import { Bell } from "mdi-material-ui";
import React from "react";
import UserContainer from "../../../userContainer";
import Card from "../../card";
import Dialog from "../../dialog";

const useStyles = makeStyles(() =>
  createStyles({
    listItem: {
      padding: 0,
      paddingTop: 10,
      paddingBottom: 10,
    },
    icon: {
      color: "#66778B",
      fontSize: "56px",
    },
  }),
);

const Notification: React.FC = () => {
  const classes = useStyles();
  const { dialogType: dialogIndex, setDialogType: setDialogIndex } = UserContainer.useContainer();

  const items: string[] = ["产品更新时邮件通知我", "收藏列表有更新时", "产品更新时邮件通知我", "收藏列表有更新时"];

  return (
    <>
      <Card
        icon={<Bell className={classes.icon} />}
        title="通知"
        subTitle="新动态推送设置"
        onClick={(): void => setDialogIndex("notification")}
      />
      <Dialog
        title="通知"
        open={dialogIndex === "notification"}
        width="sm"
        onClose={(): void => setDialogIndex("none")}
      >
        <List disablePadding>
          {items.map((item, index) => (
            <ListItem className={classes.listItem} key={index}>
              <ListItemText>{item}</ListItemText>
              <ListItemSecondaryAction>
                <Switch />
              </ListItemSecondaryAction>
            </ListItem>
          ))}
        </List>
      </Dialog>
    </>
  );
};

export default Notification;
