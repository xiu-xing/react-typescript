import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import toArray from "rc-util/lib/Children/toArray";
import React, { createContext } from "react";
import Item from "./item";

export const SpaceContext = createContext({
  latestIndex: 0,
  horizontalSize: 0,
  verticalSize: 0,
});

export type SizeType = "small" | "middle" | "large";

const spaceSize = {
  small: 8,
  middle: 16,
  large: 24,
};

export type SpaceSize = SizeType | number;

function getNumberSize(size: SpaceSize) {
  return typeof size === "string" ? spaceSize[size] : size || 0;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "inline-flex",
      alignItems: "center",
    },
    spaceVertical: {
      flexDirection: "column",
    },
  }),
);

interface SpaceProps {
  className?: string;
  style?: React.CSSProperties;
  wrap?: boolean;
  size?: SpaceSize | [SpaceSize, SpaceSize];
  split?: React.ReactNode;
  direction?: "horizontal" | "vertical";
  align?: "start" | "end" | "center" | "baseline";
}

const Space: React.FunctionComponent<SpaceProps> = (props) => {
  const classes = useStyles();
  const { className, style, size = "small", wrap = false, split, direction = "horizontal", align, children } = props;

  const [horizontalSize, verticalSize] = React.useMemo(
    () => ((Array.isArray(size) ? size : [size, size]) as [SpaceSize, SpaceSize]).map((item) => getNumberSize(item)),
    [size],
  );

  const childNodes = toArray(children);

  if (childNodes.length === 0) return null;

  const mergedAlign = align === undefined && direction === "horizontal" ? "center" : align;

  let latestIndex = 0;

  const nodes = childNodes.map((child, i) => {
    if (child !== null && child !== undefined) {
      latestIndex = i;
    }

    if (child) {
      return (
        <Item key={i} index={i} wrap={wrap} split={split} direction={direction}>
          {child}
        </Item>
      );
    }
  });

  return (
    <div
      className={clsx(classes.root, className, { [classes.spaceVertical]: direction === "vertical" })}
      style={{
        ...(wrap && { flexWrap: "wrap", marginBottom: -verticalSize }),
        ...{ alignItems: mergedAlign },
        ...style,
      }}
    >
      <SpaceContext.Provider value={{ horizontalSize, verticalSize, latestIndex }}>{nodes}</SpaceContext.Provider>
    </div>
  );
};

export default Space;
