import { ListItem, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { Lock } from "mdi-material-ui";
import React from "react";
import { NavigationItemProps } from "./navigation-item";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "4px 0 4px 8px",
      fontSize: 16,
      color: "#A6A6A6",
      cursor: "pointer",
    },
    active: {
      position: "relative",
      color: theme.palette.primary.main,
    },
    pseudo: {
      width: 3,
      height: 14,
      backgroundColor: theme.palette.primary.main,
      position: "absolute",
      left: 0,
      top: "50%",
      marginTop: -7,
    },
    svgRime: {
      marginTop: "2px",
      cursor: "pointer",
      color: "#CCC",
    },
  }),
);

interface NavigationCollapseItemProps extends NavigationItemProps {
  open?: boolean;
}

const NavigationCollapseItem: React.FunctionComponent<NavigationCollapseItemProps> = (props) => {
  const classes = useStyles();
  const { name, href, active, disable, onClick } = props;

  return (
    <ListItem
      classes={{ root: clsx(classes.root, props.classes?.item) }}
      className={active ? classes.active : undefined}
      onClick={onClick}
    >
      {active ? <div className={clsx(classes.pseudo, props.classes?.pseudo)} /> : null}
      {name}
      {disable ? <Lock className={classes.svgRime} /> : null}
    </ListItem>
  );
};

export default NavigationCollapseItem;
