import { Backdrop, CircularProgress, Container, createStyles, makeStyles, Paper, Theme } from "@material-ui/core";
import { useRouter } from "next/router";
import React, { useEffect, useMemo } from "react";
import AppContainer from "../../containers/appContainer";
import { useResponsiveLayout } from "../../utils/hooks";
import GlobalMessageDialog from "../common/dialog/global-message-dialog/global-message-dialog";
import { backgroundImage } from "./assets";
import { LogoHorizontal } from "./assets/svg";
import AuthorizationContainer, { LoginMethod } from "./authorizationContainer";
import Protocols from "./components/protocol";
import LoginPanelTitle from "./components/login-panel-title";
import Header from "./components/header";

import EmailSignIn from "./components/sign-in";
import WeChatSignIn from "./components/wechat-sign-in";
import PhoneSignIn from "./components/phone-sign-in";
import OtherLoginMethod from "./components/other-login-method";

export const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    backgroundContainerRoot: {
      height: "100vh",
      width: "100vw",
      minWidth: "520px",
      minHeight: "646px",
      position: "relative",
      backgroundImage: `url(${backgroundImage})`,
      backgroundSize: "cover",
      backgroundRepeat: "no-repeat",
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    paperContainer: {
      alignItems: "center",
      width: "394px",
      minHeight: "490px",
      paddingTop: "48px",
      display: "flex",
      flexDirection: "column",
      position: "relative",
      boxShadow:
        "0px 5px 6px -3px rgba(247, 247, 247, 0.2), 0px 9px 12px 1px rgba(241, 227, 227, 0.14), 0px 16px 22px 15px rgba(96, 96, 96, 0.12)",
    },
    logo: {
      height: 25,
      width: 140,
    },
    description: {
      marginTop: 10,
      fontSize: 20,
      color: "#333333",
    },
    backdrop: {
      zIndex: theme.zIndex.drawer + 1,
      color: "#fff",
    },
    loginPanel: {
      width: "100%",
      alignItems: "center",
      display: "flex",
      flexDirection: "column",
    },
    authDivider: {
      width: "100%",
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
      justifyContent: "center",
    },
    dividerLine: {
      width: "30%",
      height: 3,
      backgroundColor: "#f9f9f9",
    },
    dividerInnerText: {
      width: 30,
      textAlign: "center",
      fontSize: 20,
      color: "#999999FF",
    },
    logoAndDescription: {
      alignItems: "center",
      display: "flex",
      flexDirection: "column",
    },
    archivingBox: {
      width: "100%",
      lineHeight: "38px",
      backgroundColor: "#D0E7FA",
      opacity: 0.68,
      position: "absolute",
      bottom: 0,
      left: 0,
      right: 0,
    },
    archivingText: {
      fontSize: 14,
      fontWeight: 500,
      color: "#333",
      textAlign: "center",
      margin: 0,
    },
    archivingLink: {
      color: theme.palette.primary.main,
      marginLeft: "16px",
      textDecoration: "none",
      cursor: "pointer",
      "&:hover": {
        textDecoration: "underline",
      },
    },
  }),
);

// eslint-disable-next-line @typescript-eslint/no-unused-vars

export const LogoAndDescription: React.FunctionComponent = () => {
  const classes = useStyles();
  const query = useRouter().query;

  return (
    <>
      {/* Logo and Description */}
      <div className={classes.logoAndDescription}>
        <LogoHorizontal />
        <div className={classes.description}>
          {query.invitationCode ? "邀请您加入团队，请先登录" : "全面的一级市场数据平台"}
        </div>
      </div>
    </>
  );
};

const AuthorizationContent: React.FunctionComponent = () => {
  const classes = useStyles();
  const { setShowHeader, setShowDrawer } = AppContainer.useContainer();
  const { fetching, loginMethod } = AuthorizationContainer.useContainer();

  useEffect(() => {
    setShowHeader(false);
    setShowDrawer(false);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useResponsiveLayout();

  function renderLoginPanelContent() {
    if (loginMethod === LoginMethod.WeChat) {
      return <WeChatSignIn />;
    }
    if (loginMethod === LoginMethod.Email) {
      return <EmailSignIn />;
    }
    return <PhoneSignIn />;
  }

  const isWeChatPanel = useMemo(() => loginMethod === LoginMethod.WeChat, [loginMethod]);

  return (
    <>
      <div className={classes.backgroundContainerRoot}>
        <Header />
        <Paper className={classes.paperContainer} style={isWeChatPanel ? { minHeight: "560px" } : {}}>
          <div className={classes.loginPanel}>
            {!isWeChatPanel && <LoginPanelTitle />}
            {renderLoginPanelContent()}
          </div>
          <Protocols />
          <OtherLoginMethod />
        </Paper>
        <Backdrop className={classes.backdrop} open={fetching}>
          <CircularProgress color="inherit" size={30} />
        </Backdrop>
        <GlobalMessageDialog />
        <div className={classes.archivingBox}>
          <p className={classes.archivingText}>
            Copyright @ 2021 by 深圳来觅数据信息科技有限公司{" "}
            <a
              className={classes.archivingLink}
              href={process.env.NEXT_PUBLIC_ARCHIVING_LINK || ""}
              target="_blank"
              rel="noreferrer"
            >
              粤ICP备2020108416号
            </a>
          </p>
        </div>
      </div>
    </>
  );
};

export default AuthorizationContent;
