import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: (props) => ({
      display: "flex",
      justifyContent: "space-between",
      flexGrow: 0,
      maxWidth: `${props["width"]}%`,
      flexBasis: `${props["width"]}%`,
    }),
  }),
);

interface ColProps {
  span: number;
}

const Col: React.FunctionComponent<ColProps> = (props) => {
  const { span } = props;
  const classes = useStyles({ width: (span * 100) / 3 > 100 ? 100 : (span * 100) / 3 });

  return <div className={clsx("col", classes.root)}>{props.children}</div>;
};

export default Col;
