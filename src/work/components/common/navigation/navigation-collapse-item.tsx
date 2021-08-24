import { Collapse, List, ListItem, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { Lock } from "mdi-material-ui";
import React from "react";
import UserContainer from "../../../containers/userContainer";
import NavigationItem, { NavigationItemProps } from "./navigation-item";
import NavigationContainer from "./navigationContainer";

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
    collapse: {
      marginTop: -2,
      marginBottom: 2,
    },
    subItem: {
      color: "#999",
      fontSize: 14,
    },
  }),
);

export interface NavigationCollapseItemProps extends Omit<NavigationItemProps, "type"> {
  type: "collapse";
  childrenProps: NavigationItemProps[];
}

const NavigationCollapseItem: React.FunctionComponent<NavigationCollapseItemProps> = (props) => {
  const classes = useStyles();

  const { name, href, active, disable, childrenProps } = props;
  const { setInstitutionAuthenticationDialog } = UserContainer.useContainer();
  const { activeValue, activeCollapseValue, setActiveValue } = NavigationContainer.useContainer();

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
            {name}
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
          {name}
          {disable ? <Lock className={classes.svgRime} /> : null}
        </ListItem>
      )}
      {
        <Collapse in={activeCollapseValue === name} timeout={300} unmountOnExit className={classes.collapse}>
          <List component="div" disablePadding>
            {childrenProps.map((childProps, index) => {
              return (
                <NavigationItem
                  key={index}
                  {...childProps}
                  classes={{ item: classes.subItem, pseudo: props.classes?.pseudo }}
                  onClick={(): void => {
                    if (childProps.name !== activeValue) {
                      setActiveValue(childProps.name);
                      childProps.onClick?.();
                      return;
                    }
                  }}
                  active={activeValue === childProps.name}
                />
              );
            })}
          </List>
        </Collapse>
      }
    </>
  );
};

export default NavigationCollapseItem;
