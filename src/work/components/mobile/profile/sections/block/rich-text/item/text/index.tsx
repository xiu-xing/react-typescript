import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import { ActionModel, getActionHandler } from "../../../action";
import { RichTextModel } from "../../model";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    text: {
      color: "#333",
      fontSize: 14,
      lineHeight: "24px",
      wordBreak: "break-all",
      whiteSpace: "pre-wrap",
    },
    actionText: {
      color: theme.palette.primary.main + " !important",
      fontWeight: 500,
    },
  }),
);

interface TextProps {
  model: RichTextModel;
}

const Text: React.FunctionComponent<TextProps> = (props) => {
  const classes = useStyles();
  const { model } = props;
  const { value, action } = model;

  return (
    <Box
      onClick={action ? getActionHandler(ActionModel.fromJSON(action)) : undefined}
    >

    <Typography
      className={clsx(classes.text, action && classes.actionText)}
      // onPanResponderTerminatinRequest={()=>true}
    >
      {value}
    </Typography>
    </Box>
  );
};

export default Text;
