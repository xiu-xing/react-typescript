import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import checking from "./assets/checking.webp";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: 220,
      width: 416,
      backgroundImage: `url(${checking})`,
      backgroundRepeat: "no-repeat",
      backgroundSize: "contain",
    },
    subDescription: {
      margin: "4px 0 16px 0",
      fontSize: 16,
      lineHeight: "24px",
      color: "#737373",
      fontWeight: 400,
    },
  }),
);

const CheckBusinessCard: React.FunctionComponent = () => {
  const classes = useStyles();
  return (
    <>
      <Typography className={classes.subDescription}>我们正在审核您的信息，请耐心等待</Typography>
      <Box className={classes.root} />
      <Box height={32} />
    </>
  );
};

export default CheckBusinessCard;
