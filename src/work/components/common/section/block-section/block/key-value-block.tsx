import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { useMemo } from "react";
import { KeyValueBlock as KeyValueBlockModel } from "../../../../../generated/graphql";
import { RichTextModel } from "../../../../../models/richText/index-next";
import RichTextNext from "../../../rich-text-next";
import Space from "../../../space";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "grid",
      gridAutoFlow: "row",
      gridTemplateColumns: "130px 1fr",
      gridColumnGap: 24,
    },
    vertical: {
      display: "flex",
      flexDirection: "column",
      marginBottom: 4,
    },
    fieldLabel: {
      "& p": {
        color: "#666",
        fontSize: 14,
      },
    },
    fieldValue: {
      fontSize: 14,
      color: "#333",
    },
    skeleton: {
      marginBottom: 4,
      maxWidth: 100,
    },
    name: {
      fontSize: 16,
      color: "#333",
    },
  }),
);

interface BlockProp {
  model: KeyValueBlockModel;
  modal?: boolean;
}

const KeyValueBlock: React.FunctionComponent<BlockProp> = (props) => {
  const classes = useStyles();
  const { model, modal } = props;

  const content = useMemo(
    () =>
      model.fields.map((f, i) => (
        <div className={clsx(model?.isVerticalDirection ? classes.vertical : classes.root)} key={i}>
          {f?.name && (
            <div className={classes.fieldLabel}>
              <Typography>{f.name}</Typography>
            </div>
          )}
          {f?.value && (
            <div>
              <RichTextNext models={JSON.parse(f.value) as RichTextModel[]} />
            </div>
          )}
        </div>
      )),
    [model],
  );

  return (
    <Space size={modal ? "small" : 6} direction={"vertical"} align={"start"}>
      {content}
    </Space>
  );
};

export default KeyValueBlock;
