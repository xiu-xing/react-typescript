import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import { RichTextModel } from "../../../../../models/richText/index-next";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      fontSize: 14,
      color: "#666",
    },
  }),
);

interface TextAreaProps {
  model: RichTextModel;
}

const TextArea: React.FunctionComponent<TextAreaProps> = (props) => {
  const classes = useStyles();
  const dataSource = props.model;

  return (
    <Typography component="div" className={classes.root}>
      {dataSource["value"]}
    </Typography>
  );
};

export default TextArea;
