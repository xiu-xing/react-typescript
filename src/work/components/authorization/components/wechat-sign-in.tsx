import { createStyles, makeStyles, Theme } from "@material-ui/core";
import React, { useEffect } from "react";
import { AlertCircle } from "mdi-material-ui";
import AuthorizationContainer from "../authorizationContainer";

export const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    box: {
      display: "flex",
      flexDirection: "column",
      justifyContent: "space-between",
      alignItems: "center",
      position: "relative",
    },
    tipsWrapper: {
      minWidth: "250px",
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      color: "#333",
      fontSize: "20px",
      fontWeight: 500,
      position: "absolute",
      top: "50%",
      left: "50%",
      transform: "translate(-50%, -50%)",
    },
    downloadUrlbtn: {
      color: theme.palette.primary.main,
      textDecoration: "none",
    },
  }),
);

const CHROME_DOWNLOAD_URL = "https://www.google.com/chrome";

function WeChatSignIn(): JSX.Element {
  const classes = useStyles();
  const { getWechatLoginQrCode, isInIe } = AuthorizationContainer.useContainer();

  useEffect(() => {
    getWechatLoginQrCode();
  }, []);

  function renderInIeTips(): JSX.Element {
    return (
      <div className={classes.tipsWrapper}>
        <AlertCircle style={{ color: "red", marginBottom: "5px" }} />
        <div>IE浏览器兼容性较低</div>
        <div>建议使用</div>
        <a href={CHROME_DOWNLOAD_URL} target="_blank" className={classes.downloadUrlbtn}>
          火狐 Chrome Safari 360
        </a>
      </div>
    );
  }

  return (
    <div className={classes.box}>
      <div id="wechatCodeContainer" style={isInIe ? { opacity: 0.05 } : {}} />
      {isInIe && renderInIeTips()}
    </div>
  );
}

export default WeChatSignIn;
