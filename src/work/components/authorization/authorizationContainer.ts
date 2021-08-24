import { useState, useEffect } from "react";
import { createContainer } from "unstated-next";
import { useRouter } from "next/router";
import { setCookie } from "nookies";
import { isIeBrowser } from "../../utils/browser";

import { loadScripts } from "../../utils/loadScripts";

export interface FormData {
  account: string;
  password?: string;
  verificationCode?: string;
}

export enum LoginMethod {
  Email = "EMAIL",
  WeChat = "WECHAT",
  Phone = "PHONE",
}

const INITIAL_LEFT_TIME = 60;

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
const useAuthorization = () => {
  const [open, setOpen] = useState(false);
  // Store identify user login type
  const [fetching, setFetching] = useState(false);
  // Store identify user operation type
  const [loginMethod, setLoginMethod] = useState<LoginMethod>(LoginMethod.WeChat);

  const [isInIe, setIsInIe] = useState(false);

  const [isShowLeftTime, setIsShowLeftTime] = useState(false);
  const [leftTime, setLeftTime] = useState(INITIAL_LEFT_TIME);

  const query = useRouter().query;

  useEffect(() => {
    setIsInIe(!!isIeBrowser());
  }, []);

  if (isShowLeftTime && leftTime === INITIAL_LEFT_TIME) {
    const leftTimer = setInterval(() => {
      setLeftTime((preSecond: number) => {
        if (preSecond <= 1) {
          setIsShowLeftTime(false);
          clearInterval(leftTimer);
          // 重置秒数
          return INITIAL_LEFT_TIME;
        }
        return preSecond - 1;
      });
    }, 1000);
  }

  function storeAccessToken(token: string): void {
    setCookie(null, "access_token", token, {
      maxAge: 7 * 24 * 60 * 60,
      path: "/",
    });
  }

  function getWechatLoginQrCode() {
    const urlSuffix =
      query.forward === "invitation" && query.invitationCode
        ? `?forward=invitation&invitationCode=${query.invitationCode}`
        : "";
    const params = {
      self_redirect: false,
      id: "wechatCodeContainer",
      appid: process.env.NEXT_PUBLIC_WECHAT_APP_ID ?? "",
      scope: process.env.NEXT_PUBLIC_WECHAT_SCOPE ?? "",
      redirect_uri: encodeURIComponent((process.env.NEXT_PUBLIC_WECHAT_REDIRECT_URL ?? "") + (urlSuffix ?? "")),
      state: process.env.NEXT_PUBLIC_WECHAT_STATE ?? "",
      style: "",
      href: "",
    };

    if (window.WxLogin) {
      new window.WxLogin(params);
    } else {
      loadScripts(["https://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"]).then(() => {
        new window.WxLogin(params);
      });
    }
  }

  return {
    open,
    setOpen,
    fetching,
    setFetching,
    loginMethod,
    setLoginMethod,
    storeAccessToken,
    getWechatLoginQrCode,
    leftTime,
    isShowLeftTime,
    setIsShowLeftTime,
    isInIe,
  };
};

const AuthorizationContainer = createContainer(useAuthorization);
export default AuthorizationContainer;
