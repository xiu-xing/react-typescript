import { StyledComponentProps, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { useRouter } from "next/router";
import React, { ReactNode, useEffect } from "react";
import NavigationCollapseItem, { NavigationCollapseItemProps } from "./navigation-collapse-item";
import NavigationItem, { NavigationItemClassKey, NavigationItemProps } from "./navigation-item";
import NavigationSubtitle, { NavigationSectionProps } from "./navigation-subtitle";
import NavigationContainer from "./navigationContainer";
const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    title: {
      fontSize: 22,
      fontWeight: 500,
      paddingLeft: 8,
      marginBottom: 12,
    },
  }),
);

type NavigationClassKey = "root" | "title" | "subtitle" | NavigationItemClassKey;

interface NavigationProps extends StyledComponentProps<NavigationClassKey> {
  title?: string;
  items: Array<NavigationItemProps | NavigationSectionProps | NavigationCollapseItemProps>;
  // 切换选项的回调，将列表的 index 和 data 作为入参
  onChange?: (index: number, data?: unknown) => void;
  isRouter?: boolean;
  defaultActive?: number;
  activeRoute?: string;
}

/**
 * 侧边导航栏
 * @param props
 */
const NavigationDisplay: React.FunctionComponent<NavigationProps> = (props) => {
  const classes = useStyles();

  const { title, items, onChange, isRouter, defaultActive, activeRoute } = props;
  const router = useRouter();
  const { activeValue, setActiveValue, setActiveCollapseValue } = NavigationContainer.useContainer();

  useEffect(() => {
    const defaultItem = items[defaultActive || 0];
    setActiveValue(defaultItem.name);
    if (defaultItem.type === "collapse") {
      setActiveCollapseValue(defaultItem.name);
    }

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  function listComponent(): ReactNode {
    if (items.length) {
      return items.map((item, index) => {
        switch (item.type) {
          case "item":
            return (
              <NavigationItem
                key={index}
                {...item}
                onClick={(): void => {
                  if (item.name !== activeValue && !isRouter) {
                    setActiveValue(item.name);
                    setActiveCollapseValue(undefined);
                    onChange?.(index, item.data);
                    return;
                  }

                  if (activeRoute !== item.data) {
                    onChange?.(index, item.data);
                  }
                }}
                active={
                  !isRouter
                    ? activeValue === item.name
                    : activeRoute
                    ? activeRoute === item.data
                    : Boolean(item.href && router.asPath.includes(item.href))
                }
                classes={{ item: props.classes?.item }}
              />
            );
          case "title":
            return <NavigationSubtitle key={index} {...item} classes={{ subtitle: props.classes?.subtitle }} />;
          case "collapse":
            return (
              <NavigationCollapseItem
                key={index}
                {...item}
                onClick={(): void => {
                  if (item.name !== activeValue && !isRouter) {
                    setActiveValue(item.name);
                    setActiveCollapseValue(item.name);
                    onChange?.(index, item.data);
                    return;
                  }

                  if (activeRoute !== item.data) {
                    onChange?.(index, item.data);
                  }
                }}
                active={
                  !isRouter
                    ? activeValue === item.name
                    : activeRoute
                    ? activeRoute === item.data
                    : Boolean(item.href && router.asPath.includes(item.href))
                }
                classes={{ item: props.classes?.item, pseudo: props.classes?.pseudo }}
              />
            );
          default:
            return null;
        }
      });
    }
    return null;
  }

  return (
    <div className={clsx(classes.root, props.classes?.root)}>
      {title ? <Typography className={clsx(classes.title, props.classes?.title)}>{title}</Typography> : null}
      {listComponent()}
    </div>
  );
};

const Navigation: React.FunctionComponent<NavigationProps> = (props) => {
  return (
    <NavigationContainer.Provider>
      <NavigationDisplay {...props} />
    </NavigationContainer.Provider>
  );
};

export default Navigation;
