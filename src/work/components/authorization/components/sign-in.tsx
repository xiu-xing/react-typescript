import { Button, createStyles, makeStyles, TextField, Theme } from "@material-ui/core";
import _ from "lodash";
import { useRouter } from "next/router";
import React, { useState } from "react";
import { Controller, useForm } from "react-hook-form";
import { withAlphaHex } from "with-alpha-hex";
import * as yup from "yup";
import { useLoginByPasswordMutation } from "../../../generated/graphql";
import { errorHandler } from "../../../utils/errorHandler";
import { REGEX } from "../../../utils/regex";
import { jumpAfterLogin } from "../../../utils/router";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";
import AuthorizationContainer from "../authorizationContainer";

export const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    form: {
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      justifyContent: "space-between",
      minHeight: "225px",
      width: "328px",
    },
    formField: {
      width: "100%",
      height: "10%",
      marginTop: 26,
      "&:first-child": {
        marginTop: 0,
      },
    },
    inputLabelRoot: {
      fontSize: 16,
    },
    inputLabelShrink: {
      fontSize: 14,
    },
    link: {
      color: theme.palette.primary.main,
      textDecoration: "none",
      fontSize: 14,
    },
    linkButton: {
      marginTop: 20,
    },
    signInButton: {
      width: 328,
      height: 36,
      backgroundColor: theme.palette.primary.main,
      color: "#ffffff",
      "&:hover": {
        backgroundColor: withAlphaHex(theme.palette.primary.main, 0.96),
      },
    },
    wechatIcon: {
      color: "#7CBE63",
      width: 24,
      marginRight: 4,
      marginTop: 2,
    },
  }),
);

const SignInInputFieldsSchema = yup.object().shape({
  account: yup
    .string()
    .trim()
    .test("account", "请输入正确的邮箱", function (value: string) {
      const isValidEmail = REGEX.email.test(value);
      const isValidPhone = REGEX.phone.test(value);
      if (!isValidEmail && !isValidPhone) {
        return false;
      }
      return true;
    }),
  verificationCode: yup.number().min(6, "至少 6 位验证码").typeError("请输入正确的 6 位数字验证码"),
  password: yup.string().min(8, "请输入密码").matches(REGEX.password, "请输入至少 8 位数密码"),
});

// Input interface
interface InputProps {
  account: string;
  password: string;
  verificationCode: number;
}

enum LoginType {
  verificationCode = "VERIFICATION_CODE",
  password = "PASSWORD",
}

const SignIn: React.FunctionComponent = () => {
  const classes = useStyles();
  const query = useRouter().query;
  const [account, setAccount] = useState("");
  const [password, setPassword] = useState("");
  const [loginType] = useState<LoginType>(LoginType.password);
  const { setFetching, setOpen, storeAccessToken } = AuthorizationContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [, executeLoginByPasswordMutation] = useLoginByPasswordMutation();

  const { handleSubmit, register, control, errors, clearError } = useForm<InputProps>({
    validationSchema: SignInInputFieldsSchema,
    reValidateMode: "onBlur",
    mode: "onBlur",
  });

  const handleSignInOption = async (account: string, password = "", verificationCode = 0): Promise<void> => {
    let accessToken: string;
    const credential = password ? password : verificationCode;

    setFetching(true);

    try {
      const loginByPasswordMutationResult = await executeLoginByPasswordMutation({
        account,
        password: credential as string,
      });

      if (loginByPasswordMutationResult.error) {
        const errMessage = errorHandler(loginByPasswordMutationResult.error);
        throw Error(errMessage);
      }
      accessToken = _.get(loginByPasswordMutationResult, "data.loginByPassword.accessTokenString");

      storeAccessToken(accessToken);
      jumpAfterLogin(query);
    } catch (error) {
      setTimeout(() => {
        setOpen(true);
      }, 1000);

      openSnackbar(error.message, "error");
      clearError(["account", "password", "verificationCode"]);
    } finally {
      setTimeout(() => {
        setOpen(false);
        setFetching(false);
      }, 700);
    }
  };

  return (
    <form
      className={classes.form}
      onSubmit={handleSubmit((data) => {
        loginType === LoginType.password
          ? handleSignInOption(data.account, data?.password)
          : handleSignInOption(data.account, "", data?.verificationCode);
      })}
    >
      <div>
        <Controller
          name="account"
          control={control}
          as={
            <TextField
              type="text"
              label="邮箱"
              inputRef={register}
              error={!!errors?.account}
              className={classes.formField}
              inputProps={{ value: account }}
              helperText={errors?.account?.message}
              onFocus={(): void => {
                clearError("account");
              }}
              InputLabelProps={{
                classes: {
                  root: classes.inputLabelRoot,
                  shrink: classes.inputLabelShrink,
                },
              }}
              onInput={(event: React.ChangeEvent<HTMLInputElement>): void => setAccount(event.target.value)}
            />
          }
        />
        {/* According to "password" or "verification code" render input */}
        <Controller
          name="password"
          control={control}
          as={
            <TextField
              label="密码"
              inputRef={register}
              error={!!errors?.password}
              className={classes.formField}
              inputProps={{ value: password }}
              helperText={errors?.password?.message}
              type="password"
              onFocus={(): void => clearError("password")}
              onInput={(event: React.ChangeEvent<HTMLInputElement>): void => setPassword(event.target.value)}
              InputLabelProps={{
                classes: {
                  root: classes.inputLabelRoot,
                  shrink: classes.inputLabelShrink,
                },
              }}
            />
          }
        />
      </div>
      {/* Switch user option to Sign Up */}
      {/* <div className={classes.authOrForgetPassword}> */}
      <Button
        type="submit"
        variant="contained"
        classes={{
          root: classes.signInButton,
        }}
        // TODO 目前只根据密码登录
        // disabled={notEmptyInput() && noErrors(loginType)}
      >
        登录
      </Button>
      {/* </div> */}
    </form>
  );
};

export default SignIn;
