import { Tooltip, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "2px 10px",
      backgroundColor: theme.palette.primary.main,
      color: "#fff",
      display: "inline-block",
      flexDirection: "row",
      alignContent: "center",
      borderRadius: 30,
      maxWidth: "fit-content",
      verticalAlign: "middle",
      margin: "4px 4px",
    },
    p: {
      maxWidth: 73,
      overflow: "hidden",
      textOverflow: "ellipsis",
    },
    text: {
      fontSize: 12,
      whiteSpace: "nowrap",
    },
  }),
);

interface ChipProps {
  text: string;
}

const Chip: React.FunctionComponent<ChipProps> = ({ text }) => {
  const classes = useStyles();

  function getLength(text: string) {
    return text.replace(/[\u0391-\uFFE5]/g, "aa").length;
  }

  function getTag() {
    if (getLength(text) > 12)
      return (
        <Tooltip enterDelay={0} title={<Typography className={classes.text}>{text}</Typography>}>
          <Typography className={clsx(classes.p, classes.text)}>{text}</Typography>
        </Tooltip>
      );

    return <Typography className={clsx(classes.p, classes.text)}>{text}</Typography>;
  }

  return <div className={classes.root}>{getTag()}</div>;
};

export default Chip;
