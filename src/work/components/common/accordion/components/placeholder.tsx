import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { NoDataWEBP } from "../../../../assets/webp/nodata";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      height: "100%",
      flexDirection: "column",
      justifyContent: "center",
      alignItems: "center",
    },
    tipText: {
      fontSize: 16,
      fontWeight: 500,
      color: "#A6A6A6",
    },
    img: {
      width: 203,
      height: 168,
      pointerEvents: "none",
    },
  }),
);

interface CommonAccordionPlaceholderProps {
  tipText?: string;
}

const CommonAccordionPlaceholder: React.FunctionComponent<CommonAccordionPlaceholderProps> = ({
  tipText = "暂无数据",
}) => {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <img src={NoDataWEBP} className={classes.img} />
      <Typography className={classes.tipText}>{tipText}</Typography>
    </div>
  );
};

export default CommonAccordionPlaceholder;
