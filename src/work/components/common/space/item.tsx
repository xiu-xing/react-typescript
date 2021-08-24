import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useContext } from "react";
import { SpaceContext } from ".";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
  }),
);

interface ItemProps {
  index: number;
  direction?: "horizontal" | "vertical";
  split?: string | React.ReactNode;
  wrap?: boolean;
}

const Item: React.FunctionComponent<ItemProps> = (props) => {
  const classes = useStyles();
  const { index, direction, split, wrap, children } = props;
  const { horizontalSize, verticalSize, latestIndex } = useContext(SpaceContext);

  let style: React.CSSProperties = {};

  if (direction === "vertical") {
    if (index < latestIndex) {
      style = { marginBottom: horizontalSize / (split ? 2 : 1) };
    }
  } else {
    style = {
      ...(index < latestIndex && { marginRight: horizontalSize / (split ? 2 : 1) }),
      ...(wrap && { paddingBottom: verticalSize }),
    };
  }

  if (children === null || children === undefined) {
    return null;
  }

  return (
    <>
      <div className={classes.root} style={style}>
        {children}
      </div>
      {index < latestIndex && split && <span style={style}>{split}</span>}
    </>
  );
};

export default Item;
