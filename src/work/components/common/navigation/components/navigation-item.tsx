import { ListItem, StyledComponentProps, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { Lock } from "mdi-material-ui";
import React from "react";

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

export type NavigationItemClassKey = "item" | "pseudo";

export interface NavigationItemProps extends StyledComponentProps<NavigationItemClassKey> {
  name: string;
  active?: boolean;
  href?: string;
  disable?: boolean;
  onClick?: () => void;
}

const NavigationItem: React.FunctionComponent<NavigationItemProps> = (props) => {
  const classes = useStyles();
  const { name, href, active, disable, onClick } = props;

  return (
    <>
      {href ? (
        <a href={href} style={{ textDecoration: "none" }}>
          <ListItem
            classes={{ root: clsx(classes.root, props.classes?.item) }}
            className={active ? classes.active : undefined}
            onClick={onClick}
          >
            {active ? <div className={clsx(classes.pseudo, props.classes?.pseudo)} /> : null}
            {name}
            {disable ? <Lock className={classes.svgRime} /> : null}
          </ListItem>
        </a>
      ) : (
        <ListItem
          classes={{ root: clsx(classes.root, props.classes?.item) }}
          className={active ? classes.active : undefined}
          onClick={onClick}
        >
          {active ? <div className={clsx(classes.pseudo, props.classes?.pseudo)} /> : null}
          {name}
          {disable ? <Lock className={classes.svgRime} /> : null}
        </ListItem>
      )}
    </>
  );
};

export default NavigationItem;
