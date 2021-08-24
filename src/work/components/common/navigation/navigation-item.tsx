import { ListItem, StyledComponentProps, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { Lock } from "mdi-material-ui";
import React from "react";
import UserContainer from "../../../containers/userContainer";

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
  type: "item";
  name: string;
  id?: string;
  active?: boolean;
  switch?: boolean;
  href?: string;
  onClick?: () => void;
  data?: unknown;
  disable?: boolean;
}

/**
 * 可点击的 Item
 */
const NavigationItem: React.FunctionComponent<NavigationItemProps> = (props) => {
  const classes = useStyles();

  const { name, href, active, disable } = props;
  const { setInstitutionAuthenticationDialog } = UserContainer.useContainer();

  return (
    <>
      {href ? (
        <a href={href} style={{ textDecoration: "none" }}>
          <ListItem
            classes={{ root: clsx(classes.root, props.classes?.item) }}
            className={active ? classes.active : undefined}
            onClick={(): void => {
              if (disable) {
                setInstitutionAuthenticationDialog(true);
              } else {
                props.onClick?.();
              }
            }}
          >
            {active ? <div className={clsx(classes.pseudo, props.classes?.pseudo)} /> : null}
            {active? <div>{name}</div> : name}
            {disable ? <Lock className={classes.svgRime} /> : null}
          </ListItem>
        </a>
      ) : (
        <ListItem
          classes={{ root: clsx(classes.root, props.classes?.item) }}
          className={active ? classes.active : undefined}
          onClick={(): void => {
            if (disable) {
              setInstitutionAuthenticationDialog(true);
            } else {
              props.onClick?.();
            }
          }}
        >
          {active ? <div className={clsx(classes.pseudo, props.classes?.pseudo)} /> : null}
          {active? <div className={classes.active}>{name}</div> : name}
          {disable ? <Lock className={classes.svgRime} /> : null}
        </ListItem>
      )}
    </>
  );
};

export default NavigationItem;
