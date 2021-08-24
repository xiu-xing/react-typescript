import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import PlaceHolderImg from "./placeholder.png";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      objectFit: "contain",
      width: "100%",
    },
  }),
);

const Placeholder: React.FC = () => {
  const classes = useStyles();
  return <img className={classes.root} src={PlaceHolderImg} />;
};

export default Placeholder;
