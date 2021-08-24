import { Box, Button, IconButton, InputAdornment, TextField, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Visibility, VisibilityOff } from "@material-ui/icons";
import { useRouter } from "next/router";
import { setCookie } from "nookies";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
// import { useActivateAccountMutation, useCreateAccountMutation } from "../../../../../generated/graphql";
import { REGEX } from "../../../../../utils/regex";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import AuthorizationContainer from "../../../authorizationContainer";
import SignUpContainer from "../signUpContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    title: {
      color: "#5F6368",
      fontSize: 20,
    },
    form: {
      marginTop: 32,
    },
    buttonBox: {
      marginTop: 118,
    },
    visibleIconButton: {
      fontSize: "1rem",
      padding: 5,
    },
    inputLabelRoot: {
      fontSize: 16,
    },
    inputLabelShrink: {
      fontSize: 14,
    },
    textField: {
      fontSize: 14,
      width: "100%",
      marginTop: 42,
      "&:first-child": {
        marginTop: 0,
      },
    },
  }),
);

function storeAccessToken(token: string): void {
  setCookie(null, "access_token", token, {
    maxAge: 7 * 24 * 60 * 60,
    path: "/",
  });
}

const PasswordSetting: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { setFetching } = AuthorizationContainer.useContainer();
  const { operationToken, account, passwordAction } = SignUpContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();

  const [passwordVisible, setPasswordVisible] = useState(false);
  const [repeatedPasswordVisible, setRepeatedPasswordVisible] = useState(false);

  const { register, errors, handleSubmit, watch } = useForm();

  const password = watch("password");

  const router = useRouter();

  // const [activateAccountMutationResult, executeActivateAccountMutation] = useActivateAccountMutation();
  // const [createAccountMutationResult, executeCreateAccountMutation] = useCreateAccountMutation();

  // function onSubmit(): void {
  //   if (password && operationToken) {
  //     if (passwordAction === "activateAccount") {
  //       executeActivateAccountMutation({
  //         account: account,
  //         password: password,
  //         operationToken: operationToken,
  //       });
  //       return;
  //     }
  //     executeCreateAccountMutation({
  //       account: account,
  //       password: password,
  //       operationToken: operationToken,
  //     });
  //   }
  // }

  // useEffect(() => {
  //   setFetching(activateAccountMutationResult.fetching);
  //   if (activateAccountMutationResult.data) {
  //     const accessToken = _.get(activateAccountMutationResult, "data.activateAccount.accessTokenString");
  //     if (accessToken) {
  //       accessToken && storeAccessToken(accessToken);
  //       router.replace("/");
  //       return;
  //     }
  //     openSnackbar("密码设置失败", "error");
  //     return;
  //   }
  //   if (activateAccountMutationResult.error) {
  //     openSnackbar("密码设置失败", "error");
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [activateAccountMutationResult]);

  // useEffect(() => {
  //   setFetching(createAccountMutationResult.fetching);
  //   if (createAccountMutationResult.data) {
  //     const accessToken = _.get(createAccountMutationResult, "data.createAccount.accessTokenString");
  //     if (accessToken) {
  //       accessToken && storeAccessToken(accessToken);
  //       router.replace("/");
  //       return;
  //     }
  //     openSnackbar("密码设置失败", "error");
  //     return;
  //   }
  //   if (createAccountMutationResult.error) {
  //     openSnackbar("密码设置失败", "error");
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [createAccountMutationResult]);

  return (
    <Box>
      <Typography>设置密码</Typography>
      <form className={classes.form}>
        <TextField
          className={classes.textField}
          name="password"
          inputRef={register({
            required: { value: true, message: "请输入密码" },
            pattern: { value: REGEX.password, message: "请输入8位及以上的字母、数字、符号的组合" },
          })}
          type={passwordVisible ? "text" : "password"}
          error={Boolean(errors.password)}
          helperText={
            errors.password
              ? errors.password["message"]
              : password
              ? ""
              : "使用 8 个或更多字符（字母、数字和符号的组合）"
          }
          size="medium"
          placeholder="密码"
          InputProps={{
            endAdornment: (
              <InputAdornment position="end">
                <IconButton
                  onClick={(): void => {
                    setPasswordVisible(!passwordVisible);
                  }}
                  className={classes.visibleIconButton}
                  aria-label="toggle password visibility"
                >
                  {passwordVisible ? <Visibility /> : <VisibilityOff />}
                </IconButton>
              </InputAdornment>
            ),
          }}
          InputLabelProps={{
            classes: {
              root: classes.inputLabelRoot,
              shrink: classes.inputLabelShrink,
            },
          }}
        />
        <TextField
          className={classes.textField}
          name="repeatedPassword"
          inputRef={register({
            required: { value: true, message: "请重新输入密码" },
            validate: (value) => {
              // const passwordValue = getValues().password;
              if (value === password) {
                return true;
              }
              return "两次输入的密码不一致";
            },
          })}
          type={repeatedPasswordVisible ? "text" : "password"}
          error={Boolean(errors.repeatedPassword)}
          helperText={errors.repeatedPassword ? errors.repeatedPassword["message"] : ""}
          size="medium"
          placeholder="确认密码"
          InputProps={{
            endAdornment: (
              <InputAdornment position="end">
                <IconButton
                  onClick={(): void => {
                    setRepeatedPasswordVisible(!repeatedPasswordVisible);
                  }}
                  className={classes.visibleIconButton}
                  aria-label="toggle repeatedPassword visibility"
                >
                  {repeatedPasswordVisible ? <Visibility /> : <VisibilityOff />}
                </IconButton>
              </InputAdornment>
            ),
          }}
        />
      </form>
      <Box className={classes.buttonBox}>
        <Button
          variant="contained"
          color="primary"
          onClick={(): void => {
            // handleSubmit(onSubmit)();
          }}
        >
          完成
        </Button>
      </Box>
    </Box>
  );
};

export default PasswordSetting;
