import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { ListItem as MuiListItem, Divider, ListItemProps as MuiListItemProps } from "@material-ui/core";
import { EXTRA_HORIZONTAL_PADDING } from "../list";
import clsx from "clsx";

const useListItemStyles = makeStyles(() =>
  createStyles({
    root: {
      userSelect: "text",
      borderRadius: EXTRA_HORIZONTAL_PADDING,
      paddingLeft: EXTRA_HORIZONTAL_PADDING,
    },
    highlight: {
      backgroundColor: "rgba(102, 140, 157, .3)!important",
      userSelect: "none",
    },
  }),
);

interface InsetProps {
  insetLeft: number;
  insetRight: number;
}

const useDividerStyles = makeStyles(() =>
  createStyles({
    root: {
      marginLeft: ({ insetLeft }: InsetProps): number => insetLeft + EXTRA_HORIZONTAL_PADDING,
      marginRight: ({ insetRight }: InsetProps): number => insetRight + EXTRA_HORIZONTAL_PADDING,
    },
  }),
);

type ListItemProps = {
  showDivider: boolean;
  dividerInsetLeft?: number;
  dividerInsetRight?: number;
  ripple: boolean
} & {
  onClick?(): void;
  highlight: boolean;
};

const ListItem: React.FunctionComponent<ListItemProps> = ({ children, onClick, highlight, ripple, ...props }) => {
  const isClick = !!onClick;
  const classes = useListItemStyles();
  const dividerClasses = useDividerStyles({
    insetLeft: props.showDivider ? (props.dividerInsetLeft ?? 0) : 0,
    insetRight: props.showDivider ? (props.dividerInsetRight ?? 0) : 0,
  });

  return (
    <>
      {props.showDivider && <Divider classes={dividerClasses} />}
      {isClick ? (
        <MuiListItem
          className={clsx(classes.root, highlight ? classes.highlight : "")}
          button
          onClick={onClick}
          classes={{ root: classes.root }}
          dense
          disableTouchRipple={!ripple}
        >
          {children}
        </MuiListItem>
      ) : (
        <MuiListItem
          className={clsx(classes.root, highlight ? classes.highlight : "")}
          classes={{ root: classes.root }}
          dense
        >
          {children}
        </MuiListItem>
      )}
    </>
  );
};

const PureListItem: React.FunctionComponent<ListItemProps> = React.memo((props) => <ListItem {...props} />);

export default PureListItem;
