import { ListItem, StyledComponentProps } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      fontSize: 14,
      padding: "4px 0 4px 8px",
      pointerEvents: "none",
      marginTop: 8,
    },
  }),
);

export interface NavigationSectionProps extends StyledComponentProps<"subtitle"> {
  type: "title";
  name: string;
}

/**
 * 子标题，不可点击
 * @param props
 */
const NavigationSubtitle: React.FunctionComponent<NavigationSectionProps> = (props) => {
  const classes = useStyles();
  return <ListItem classes={{ root: clsx(classes.root, props.classes?.subtitle) }}>{props.name}</ListItem>;
};

export default NavigationSubtitle;
