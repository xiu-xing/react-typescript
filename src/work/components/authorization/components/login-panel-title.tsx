import { createStyles, makeStyles } from "@material-ui/core/styles";
import AuthorizationContainer from "../authorizationContainer";

import React, { HTMLAttributes } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
    },
    title: {
      fontSize: "22px",
      color: "#333",
      fontWeight: 500,
      margin: 0,
    },
    tips: {
      fontSize: "18px",
      color: "#737373",
      fontWeight: 400,
      margin: "12px 0 26px 0",
    },
  }),
);

type LoginPanelTitleProps = HTMLAttributes<HTMLDivElement>;

const LoginPanelTitle: React.FunctionComponent<LoginPanelTitleProps> = () => {
  const classes = useStyles();
  const { loginMethod } = AuthorizationContainer.useContainer();

  const titles = {
    "EMAIL": {
      title: "邮箱登录",
      tips: "请填写邮箱账号进行登录",
    },
    "WECHAT": {
      title: "微信登录",
      tips: "请使用微信扫描二维码登录/注册",
    },
    "PHONE": {
      title: "手机登录",
      tips: "请填写手机号进行登录/注册",
    },
  };

  return (
    <div className={classes.root}>
      <h5 className={classes.title}>{titles[loginMethod].title}</h5>
      <div className={classes.tips}>{titles[loginMethod].tips}</div>
    </div>
  );
};

export default LoginPanelTitle;
