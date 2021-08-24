import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import { RichTextModel } from "../model";
import Logo from "./logo";
import Text from "./text";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    increase: {
      fontSize: 14,
      color: theme.palette.primary.main,
    },
    decrease: {
      fontSize: 14,
      color: "#E00000",
    },
    tag: {
      whiteSpace: "nowrap",
      borderRadius: 2,
      padding: "2px 4px",
      margin: "2px 2px 0px 2px",
      backgroundColor: "rgba(79, 112, 155, 0.12)",
    },
    tagLabel: {
      fontSize: 10,
      color: theme.palette.primary.main,
      fontWeight: 500,
    },
  }),
);

interface RichTextItemProps {
  model: RichTextModel;
}

const RichTextItem: React.FunctionComponent<RichTextItemProps> = (props) => {
  const classes = useStyles();
  const { model } = props;

  function content(): ReactNode {
    switch (model.pattern) {
      case "plain":
        return <Text model={model} />;
      case "image":
        return <Logo model={model} />;
      case "logo":
        return <Logo model={model} />;
      case "increase":
        return (
          <Typography className={classes.increase} component="span">
            {model.value}
          </Typography>
        );
      case "decrease":
        return (
          <Typography className={classes.decrease} component="span">
            {model.value}
          </Typography>
        );
      case "tag":
        return (
          <div className={classes.tag}>
            <Typography className={classes.tagLabel}>{model.value}</Typography>
          </div>
        );
      default:
        return <div>{model.pattern}</div>;
    }
  }

  return <>{content()}</>;
};

export default RichTextItem;
