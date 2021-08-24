import { CircularProgress, createStyles, makeStyles } from "@material-ui/core";
import { useRouter } from "next/router";
import { setCookie } from "nookies";
import React, { useEffect } from "react";
import { NextPlatform, useLoginByWeChatMutation } from "../../generated/graphql";
import { jumpAfterLogin, stringifyQuery } from "../../utils/router";
import SnackbarContainer from "../common/snackbar/snackbarContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      justifyContent: "center",
      marginTop: "30%",
    },
  }),
);

const Wechat: React.FunctionComponent = () => {
  const query = useRouter().query;
  const { code, state } = query;
  const [LoginByWeChatMutationResult, executeLoginByWeChatMutation] = useLoginByWeChatMutation();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const classes = useStyles();

  function redirectToLogin(): void {
    window.location.href = "/login" + stringifyQuery(query, ["forward", "invitationCode"]);
  }

  useEffect(() => {
    if (code && code !== "") {
      if (state != process.env.NEXT_PUBLIC_WECHAT_STATE) {
        openSnackbar("系统错误", "error");
        redirectToLogin();
      }
      executeLoginByWeChatMutation({
        code: code as string,
        platform: NextPlatform.PlatformWeb,
      });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [code, state]);

  function storeAccessToken(token: string): void {
    setCookie(null, "access_token", token, {
      maxAge: 7 * 24 * 60 * 60,
      path: "/",
    });
  }
  useEffect(() => {
    if (!LoginByWeChatMutationResult.fetching) {
      if (LoginByWeChatMutationResult.error) {
        openSnackbar("登录失败", "error");
        redirectToLogin();
      }
      if (LoginByWeChatMutationResult.data) {
        storeAccessToken(LoginByWeChatMutationResult.data.loginByWeChat?.accessTokenString as string);
        jumpAfterLogin(query);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [LoginByWeChatMutationResult]);
  return (
    <div className={classes.root}>
      <CircularProgress size={30} />
    </div>
  );
};

export default Wechat;
