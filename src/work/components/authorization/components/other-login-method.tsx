import { Button } from "@material-ui/core";

import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Email, Wechat, Cellphone } from "mdi-material-ui";
import React, { HTMLAttributes } from "react";
import AuthorizationContainer, { LoginMethod } from "../authorizationContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      lineHeight: "56px",
      padding: "0 25px",
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      position: "absolute",
      bottom: 0,
      "&::before": {
        content: `""`,
        display: "block",
        position: "absolute",
        left: "50%",
        top: 0,
        width: `calc(100% - 66px)`,
        height: "1px",
        transform: "translateX(-50%)",
        borderTop: "1px solid #eee",
        boxSizing: "border-box",
      },
    },
    btnGroup: {
      display: "flex",
    },
    link: {
      color: theme.palette.primary.main,
      textDecoration: "none",
      fontSize: 14,
    },
    icon: {
      width: 20,
      marginTop: 2,
      marginRight: 4,
    },
    otherTips: {
      color: "#666",
      fontSize: "14px",
    },
  }),
);

type OtherLoginMethodProps = HTMLAttributes<HTMLDivElement>;

const OtherLoginMethod: React.FunctionComponent<OtherLoginMethodProps> = () => {
  const classes = useStyles();
  const { loginMethod, setLoginMethod, isInIe } = AuthorizationContainer.useContainer();

  const EmailLoginBtn = () => (
    <Button
      onClick={(): void => {
        setLoginMethod(LoginMethod.Email);
      }}
    >
      <Email color="primary" className={classes.icon} />
      <span className={classes.link}>邮箱登录</span>
    </Button>
  );

  const WechatLoginBtn = () => (
    <Button
      onClick={(): void => {
        setLoginMethod(LoginMethod.WeChat);
      }}
    >
      <Wechat color="primary" className={classes.icon} style={{ color: "#62b900" }} />
      <span className={classes.link}>微信登录</span>
    </Button>
  );

  const PhoneLoginBtn = () => (
    <Button
      onClick={(): void => {
        setLoginMethod(LoginMethod.Phone);
      }}
    >
      <Cellphone color="primary" className={classes.icon} />
      <span className={classes.link}>手机登录</span>
    </Button>
  );

  const loginBtnGroup = {
    "EMAIL": (
      <>
        {/* <PhoneLoginBtn /> */}
        <WechatLoginBtn />
      </>
    ),
    "WECHAT": (
      <>
        {/* <PhoneLoginBtn /> */}
        <EmailLoginBtn />
      </>
    ),
    "PHONE": (
      <>
        <EmailLoginBtn /> <WechatLoginBtn />
      </>
    ),
  };

  if (isInIe) {
    return null;
  }

  return (
    <div className={classes.root}>
      <div className={classes.otherTips}>其他登录方式</div>
      <div className={classes.btnGroup}>{loginBtnGroup[loginMethod]}</div>
    </div>
  );
};

export default OtherLoginMethod;
