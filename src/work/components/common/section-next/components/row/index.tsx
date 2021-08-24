import { Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import toArray from "rc-util/lib/Children/toArray";
import React, { CSSProperties, ReactNode } from "react";
import Col from "./col";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: (props) => ({
      display: "flex",
      flexWrap: props["wrap"] ? "wrap" : "nowrap",
      [theme.breakpoints.up("lg")]: {
        flexWrap: "nowrap",
      },
      boxSizing: "border-box",
    }),
  }),
);

interface RowProps {
  children: ReactNode;
  wrap?: boolean;
  className?: string;
  style?: CSSProperties;
}

const Row: React.FC<RowProps> = (props) => {
  const classes = useStyles({ wrap: props.wrap ?? true });
  const elements = toArray(props.children);

  return (
    <div className={clsx("row", classes.root, props.className ?? "")} style={props.style}>
      {elements.map((element, index) => (
        <Col key={index} span={element.props["span"] ?? 3}>
          {element}
        </Col>
      ))}
    </div>
  );
};

export default Row;
