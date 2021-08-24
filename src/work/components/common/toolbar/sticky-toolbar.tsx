import { Divider, StyledComponentProps, Typography } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import _ from "lodash";
import React, { HTMLProps, useEffect, useState } from "react";
import AppContainer from "../../../containers/appContainer";

const DEFAULT_HEIGHT = 68;

const useStyles = makeStyles({
  toolbar: (props) => ({
    position: "sticky",
    zIndex: 1000,
    backgroundColor: "#fff",
    top: props["top"],
    minWidth: props["contentWidth"] || "auto",
  }),
  shadow: {
    boxShadow: "4px 1px 4px 0px rgba(0, 0, 0, 0.2)",
  },
  toolbarContent: (props) => ({
    height: props["height"],
    maxWidth: props["contentWidth"] || "auto",
    margin: "auto",
    display: "flex",
    alignItems: "center",
  }),
  title: {
    marginLeft: 8,
    flex: 1,
    fontSize: 20,
    color: "#5F6368",

    overflow: "hidden",
    wordBreak: "break-all",
    whiteSpace: "nowrap",
    textOverflow: "ellipsis",
  },
});

type StickyToolbarClassKey = "title" | "divider" | "action";

interface StickyToolbarProps extends HTMLProps<HTMLDivElement>, StyledComponentProps<StickyToolbarClassKey> {
  title: string;
  height?: number;
  contentWidth?: number;
  // 是否包含在 skeleton 里边
  hasAppbar?: boolean;
}

/**
 * 工具栏
 * @param props StickyToolbarProps
 */
const StickyToolbar: React.FunctionComponent<StickyToolbarProps> = (props) => {
  const { title, height, contentWidth, hasAppbar, className, classes: externalClasses, ...restProps } = props;
  const { fixedTopHeight } = AppContainer.useContainer();

  const classes = useStyles({
    top: hasAppbar ? fixedTopHeight : 0,
    height: height || DEFAULT_HEIGHT,
    contentWidth: contentWidth,
  });

  const [showShadow, setShowShadow] = useState(false);

  const onScrollHandler = _.throttle(() => {
    if (document.documentElement.scrollTop == 0) {
      setShowShadow(false);
    } else {
      setShowShadow(true);
    }
  }, 100);

  useEffect(() => {
    window.addEventListener("scroll", onScrollHandler);
    return (): void => {
      window.removeEventListener("scroll", onScrollHandler);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <>
      <div {...restProps} className={clsx(classes.toolbar, className)}>
        <div className={classes.toolbarContent}>
          <Typography className={clsx(classes.title, externalClasses?.title)}>{title}</Typography>
          <div className={externalClasses?.action}>{props.children}</div>
        </div>
        {showShadow ? <Divider className={clsx(classes.shadow, externalClasses?.divider)} /> : undefined}
      </div>
    </>
  );
};

export default StickyToolbar;
