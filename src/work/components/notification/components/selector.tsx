import { Badge, ListItem, ListItemText, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import NotificationContainer, { FilterType } from "../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    active: {
      backgroundColor: "#F4F7F8",
    },
    selectorText: {
      fontSize: "0.875rem",
      fontWeight: 500,
      color: "#999",
    },
    activeText: {
      fontSize: "0.875rem",
      fontWeight: 500,
      color: theme.palette.primary.main,
    },
    dot: {
      right: -5,
    },
  }),
);

interface SelectorProps {
  value: FilterType;
  onClick?: VoidFunction;
}

const Selector: React.FunctionComponent<SelectorProps> = (props) => {
  const classes = useStyles(props);
  const { messageType, unread } = NotificationContainer.useContainer();

  return (
    <ListItem button dense className={props.value === messageType ? classes.active : ""} onClick={props.onClick}>
      <ListItemText
        primary={
          <Badge invisible={!unread[props.value]} color="primary" variant="dot" classes={{ dot: classes.dot }}>
            <Typography className={props.value === messageType ? classes.activeText : classes.selectorText}>
              {props.children}
            </Typography>
          </Badge>
        }
      />
    </ListItem>
  );
};

export default Selector;
