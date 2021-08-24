import { createStyles, makeStyles, Theme, withStyles } from "@material-ui/core";
import MuiTab, { TabProps as MuiTabProps } from "@material-ui/core/Tab";
import clsx from "clsx";
import React from "react";
import { Tab as TabModal } from "../../../../../generated/graphql";
import TabLabel from "./tab-label";

export const TAB_HEIGHT = 44;
export const TAB_WIDTH = 0;

const StyledTab = withStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "relative",
      minWidth: TAB_WIDTH,
      minHeight: TAB_HEIGHT,
      padding: "10px 4px",
      lineHeight: 1.72,
      textTransform: "none",
      overflow: "visible",
    },
    textColorInherit: {
      color: "#999",
      opacity: 1,
    },
    selected: {
      color: theme.palette.primary.main,
      fontWeight: 500,
    },
  }),
)(MuiTab);

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    isNew: {
      "&:before": {
        content: `""`,
        zIndex: 1,
        right: -18,
        top: 7,
        height: 12,
        width: 22,
        fontSize: 10,
        color: "white",
        position: "absolute",
        background: "#df0303",
        borderRadius: 2,
      },
      "&:after": {
        content: `"NEW"`,
        zIndex: 2,
        right: -21,
        top: 7,
        fontSize: 10,
        color: "white",
        position: "absolute",
        transform: "scale(0.6)",
        lineHeight: 1,
        fontWeight: 600,
      },
    },
    hasNewContent: {
      "&:before": {
        content: `""`,
        top: 10,
        right: -4,
        height: 6,
        width: 6,
        position: "absolute",
        backgroundColor: theme.palette.primary.main,
        borderRadius: "50%",
      },
    },
  }),
);

interface TabProps extends MuiTabProps {
  tab: TabModal;
}

const Tab = (props: TabProps): JSX.Element => {
  const { className, tab, ...rest } = props;
  const classes = useStyles();

  return (
    <StyledTab
      {...rest}
      className={clsx(className, {
        [classes.isNew]: tab?.modifier?.isNew,
        [classes.hasNewContent]: !tab?.modifier?.isNew && tab?.modifier?.hasUpdatedContent,
      })}
      label={<TabLabel tab={tab} />}
    />
  );
};

export default Tab;
