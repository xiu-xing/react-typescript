import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ReactNode } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      boxShadow:
        "0px 1px 3px 0px rgba(0, 0, 0, 0.2), 0px 2px 1px -1px rgba(0, 0, 0, 0.12), 0px 1px 1px 0px rgba(0, 0, 0, 0.14)",
    },
  }),
);

interface CardProps {
  children: ReactNode;
}

const Card: React.FunctionComponent<CardProps> = (props) => {
  const classes = useStyles();
  return <div className={classes.root}>{props.children}</div>;
};

export default Card;
