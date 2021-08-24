import { ListItem } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "1px",
      paddingLeft: theme.spacing(3),
      paddingRight: theme.spacing(4),
    },
    divider: {
      position: "absolute",
      height: "1px",
      background: "#EEEEEE",
      left: "16px",
      right: "16px",
      opacity: 1,
      transition: "opacity 200ms ease-out",
      margin: "2px 0",
    },
    dividerFade: {
      opacity: 0,
      transition: "opacity 200ms ease-out",
      transitionDelay: "200ms",
    },
  }),
);

export interface DrawerDividerProps {
  type: "divider";
  color?: string;
}

const DrawerDivider: React.FunctionComponent<DrawerDividerProps> = (props) => {
  const classes = useStyles();
  const { color } = props;

  return (
    <ListItem className={classes.root}>
      <div className={classes.divider} style={{ background: color }} />
    </ListItem>
  );
};

export default DrawerDivider;
