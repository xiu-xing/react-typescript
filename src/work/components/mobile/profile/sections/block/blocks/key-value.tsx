import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { KeyValueBlock as KeyValueBlockModel } from "../../../../../../generated/graphql";
import { getRichTextComponent } from "../action";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "grid",
      gridRowGap: 12,
    },
    keyValueBox: {
      display: "flex",
      flexDirection: "column",
    },
    fieldLabel: {
      color: "#999",
      fontSize: 12,
      lineHeight: 16,
    },
    fieldValue: {
      "& span": {
        lineHeight: "24px",
      },
      "& p": {
        color: "#333",
        fontSize: 14,
        lineHeight: "24px",
      },
    },
  }),
);

interface KeyValueProps {
  block: KeyValueBlockModel;
}

const KeyValueBlock: React.FunctionComponent<KeyValueProps> = (props) => {
  const classes = useStyles();
  const { block } = props;

  const content = () =>
    block.fields.map((field, i) => (
      <div key={i} className={classes.keyValueBox}>
        {field?.name && <Typography className={classes.fieldLabel}>{field.name}</Typography>}
        <div className={classes.fieldValue}>{field?.value && getRichTextComponent(field.value)}</div>
      </div>
    ));

  return <div className={classes.root}>{content()}</div>;
};

export default KeyValueBlock;
