import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import { RichTextModel } from "../../../../models/richText/index-next";
import Text from "./text";

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
      margin: "2px 2px",
      whiteSpace: "nowrap",
      borderRadius: 2,
      padding: "2px 4px",
      backgroundColor: "rgba(79, 112, 155, 0.12)",
    },
    tagLabel: {
      fontSize: 10,
      color: theme.palette.primary.main,
    },
  }),
);

interface CommonTableCellItemProps {
  model: RichTextModel;
}

const CommonTableCellItem: React.FunctionComponent<CommonTableCellItemProps> = ({ model }) => {
  const classes = useStyles();

  function item(): ReactNode {
    switch (model.pattern) {
      case "plain":
        return <Text model={model} />;
      case "image":
        return <img className={classes.image} src={model.value} />;
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
            <Typography className={classes.tagLabel}>{model.value}</Typography>
          </div>
        );
      default:
        break;
    }
    return "-";
  }

  return <>{item()}</>;
};

export default CommonTableCellItem;
