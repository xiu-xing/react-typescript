import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { HTMLProps, ReactNode } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
      padding: "12px 0px",
    },
    header: {
      height: 43,
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
    },
    image: {
      borderStyle: "solid",
      borderWidth: 0.5,
      borderColor: "#eee",
      marginLeft: 16,
      height: 32,
      width: 32,
      maxHeight: 32,
      maxWidth: 32,
      overflow: "hidden",
      borderRadius: 4,
      marginRight: 8,
      objectFit: "contain",
    },
    heading: {
      flex: 1,
      fontSize: 18,
      fontWeight: 500,
      color: "#333",
    },
    actionArea: {},
    list: {},
  }),
);

interface CellGroupProps extends HTMLProps<HTMLDivElement> {
  image?: ReactNode;
  heading?: ReactNode;
  actionArea?: ReactNode;
}

const CellGroup: React.FunctionComponent<CellGroupProps> = (props) => {
  const classes = useStyles();
  const { image, heading, actionArea, children } = props;

  return (
    <div className={classes.root}>
      <div className={classes.header}>
        <div className={classes.image}>{image}</div>
        <div className={classes.heading}>{heading}</div>
        <div className={classes.actionArea}>{actionArea}</div>
      </div>
      <div className={classes.list}>{children}</div>
    </div>
  );
};

export default CellGroup;
