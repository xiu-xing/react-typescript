import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
  }),
);

interface NavigatorItem {
  name: string;
  id: string;
  childrenProps?: NavigatorItem[];
}

interface NavigatorProps {
  items: NavigatorItem[];
}

const Navigator: React.FunctionComponent<NavigatorProps> = (props) => {
  const classes = useStyles();
  return <div className={classes.root}></div>;
};

export default Navigator;
