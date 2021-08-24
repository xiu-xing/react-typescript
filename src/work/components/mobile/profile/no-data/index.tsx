import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { NoDataWEBP } from "../../../institution/assets";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    nodataBox: {
      display: "flex",
      height: "100%",
      flexDirection: "column",
      justifyContent: "center",
      alignItems: "center",
    },
    tipText: {
      fontSize: 14,
      fontWeight: 500,
      color: "#A6A6A6",
    },
    img: {
      width: "40vw",
      height: "40vw",
      pointerEvents: "none",
    },
  }),
);

const NoData: React.FunctionComponent = () => {
  const classes = useStyles();
  return (
    <div className={classes.nodataBox}>
      <img src={NoDataWEBP} className={classes.img} />
      <Typography className={classes.tipText}>暂无数据</Typography>
    </div>
  );
};

export default NoData;
