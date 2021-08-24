import { Box, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { APPBAR_HEIGHT } from "../../../app/skeleton/components/appbar-next";
import ContactInformation from "../../../common/contact-information";
import { TOOLBAR_HEIGHT } from "../../toolbar";
import { TAB_HEIGHT } from "../tabs/tab";
import { Logo } from "./assets";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      position: "relative",
      height: `calc(100vh - ${APPBAR_HEIGHT + TOOLBAR_HEIGHT + TAB_HEIGHT + 1}px)`,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    mask: {
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      zIndex: -1,
      position: "absolute",
      filter: "blur(4px)",
      pointerEvents: "none",
      userSelect: "none",
      background: "rgba(255,255,255,.5)",
    },
    content: {
      position: "absolute",
      width: 480,
      boxShadow:
        "0px 1px 8px 0px rgba(0, 0, 0, 0.2), 0px 3px 3px -2px rgba(0, 0, 0, 0.12), 0px 3px 4px 0px rgba(0, 0, 0, 0.14)",
    },
    title: {
      backgroundColor: theme.palette.primary.main,
      color: "white",
      height: 60,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    description: {
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: 500,
      color: theme.palette.grey[800],
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

const LockedTab: React.FunctionComponent = () => {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <div className={classes.mask} />
      <div className={classes.content}>
        <div className={classes.title}>
          <Logo />
        </div>
        <Box paddingX="32px" paddingY="24px">
          <Typography className={classes.description}>添加下方客服微信，购买正式账号</Typography>
          <Typography className={classes.subDescription}>
            Rime Data 拥有丰富的一级市场研究数据，助您全面掌握市场新动态
          </Typography>
          <Typography className={classes.subDescription}></Typography>
          <ContactInformation />
        </Box>
      </div>
    </div>
  );
};

export default LockedTab;
