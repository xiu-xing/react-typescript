import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import { RichTextModel } from "../../../../models/richText/index-next";
import Chart from "./chart";
import Chip from "./chip";
import Image from "./image";
import Logo from "./logo";
import Text from "./text";
import TextArea from "./text-area";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    breakLine: {
      flexBasis: "100%",
    },
    sup: {
      height: 30,
      color: "rgba(102, 102, 102, 1)",
    },
    image: {
      width: 16,
      height: 16,
      objectFit: "contain",
      pointerEvents: "none",
      // margin: "0px 3px",
    },
    increase: {
      fontSize: 14,
      color: theme.palette.primary.main,
    },
    decrease: {
      fontSize: 14,
      color: "#E00000",
    },
    tag: {
      display: "inline-flex",
      whiteSpace: "nowrap",
      borderRadius: 2,
      padding: "2px 4px",
      margin: "2px 2px 0px 2px",
      backgroundColor: "rgba(79, 112, 155, 0.12)",
      verticalAlign: "middle",
    },
    tagLabel: {
      fontSize: 10,
      color: theme.palette.primary.main,
      fontWeight: 500,
    },
  }),
);

interface CommonTableCellItemProps {
  model: RichTextModel;
}

const RichTextFutureItem: React.FunctionComponent<CommonTableCellItemProps> = ({ model }) => {
  const classes = useStyles();

  function item(): ReactNode {
    switch (model.pattern) {
      case "plain":
        return <Text model={model} />;
      case "textarea":
        return <TextArea model={model} />;
      case "image":
        return <Image model={model} />;
      case "logo":
        return <Logo model={model} />;
      case "break_line":
        return <span className={classes.breakLine} />;
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
            <Typography component="span" className={classes.tagLabel}>
              {model.value}
            </Typography>
          </div>
        );
      case "chart":
        return <Chart model={model} />;
      case "capsule_tag":
        return <Chip text={model.value} />;
      default:
        break;
    }
    return null;
  }

  return <>{item()}</>;
};

export default RichTextFutureItem;
