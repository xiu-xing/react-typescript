import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { get } from "lodash";
import React, { useMemo } from "react";
import { RichTextModel } from "../../../../models/richText/index-next";
import RichTextNext from "../../rich-text-next";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: 16,
    },
    title: {
      marginBottom: 10,
      fontSize: 14,
      color: "#333",
    },
    data: {
      fontSize: 14,
      lineHeight: "24px",
      wordBreak: "keep-all",
    },
  }),
);

interface DirectLayoutProps {
  title?: string;
  data?: string;
  arg: Map<string, string>;
}

export const DirectLayout: React.FunctionComponent<DirectLayoutProps> = (props) => {
  const classes = useStyles();
  const { arg } = props;

  const component = useMemo(() => {
    if (!arg["direct_data"]) {
      return null;
    }

    const jsonValue = JSON.parse(arg["direct_data"]);
    const data = get(jsonValue, "data");
    const title = get(jsonValue, "title");

    if (!data) return null;
    const dataJsonValue = JSON.parse(data);
    return (
      <div className={classes.root}>
        <Typography className={classes.title}>{title ?? ""}</Typography>
        <RichTextNext models={[RichTextModel.fromJSON(dataJsonValue[0])]} />
      </div>
    );
  }, [arg]);

  return component;
};
