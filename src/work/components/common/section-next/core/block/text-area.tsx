import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { isArray } from "lodash";
import React, { useMemo } from "react";
import { TextAreaBlock as TextAreaBlockModel } from "../../../../../generated/graphql";
import { RichTextModel } from "../../../../../models/richText/index-next";
import { isJson } from "../../../../../utils/tools";
import RichTextNext from "../../../rich-text-next";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    content: {
      fontSize: "14px",
      color: "#333",
    },
  }),
);

interface TextAreaBlockProp {
  model?: TextAreaBlockModel;
}

const TextAreaBlock: React.FunctionComponent<TextAreaBlockProp> = (props) => {
  const classes = useStyles();

  const content = useMemo(() => {
    if (props.model?.content && isJson(props.model?.content) && isArray(JSON.parse(props.model?.content))) {
      return (
        <RichTextNext models={JSON.parse(props.model?.content).map((c: unknown) => RichTextModel.fromJSON(c)) ?? []} />
      );
    }
  }, [props.model]);

  return (
    <div className={classes.root}>
      <Typography>{props.model?.name}</Typography>
      {content}
    </div>
  );
};

export default TextAreaBlock;
