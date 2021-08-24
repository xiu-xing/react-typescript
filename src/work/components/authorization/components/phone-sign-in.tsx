import { Button, createStyles, InputAdornment, makeStyles, TextField, Theme } from "@material-ui/core";
import { useRouter } from "next/router";
import React, { useState } from "react";
import { Controller, useForm } from "react-hook-form";
import { withAlphaHex } from "with-alpha-hex";
import * as yup from "yup";
import {
  useCreateVerificationCodeMutation,
  useLoginByOperationTokenMutation,
  useVerifyCodeMutation,
} from "../../../generated/graphql";
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
    getCodeBtn: {
      color: theme.palette.primary.main,
    },
    reGetCode: {
      color: "#989898",
      fontSize: "12px",
    },
  }),
);

const SignInInputFieldsSchema = yup.object().shape({
  account: yup
    .string()
    .trim()
    .test("account", "请输入正确的手机号码", function (value: string) {
      // const isValidEmail = REGEX.email.test(value);
      const isValidPhone = REGEX.phone.test(value);
      if (!isValidPhone) {
        return false;
      }
      return true;
    }),
  verificationCode: yup.number().min(6, "至少 6 位验证码").typeError("请输入正确的 6 位数字验证码"),
  // password: yup.string().min(8, "请输入密码").matches(REGEX.password, "请输入至少 8 位数密码"),
});

// Input interface
interface InputProps {
  account: string;
  password: string;
  verificationCode: number;
}

export enum ContactType {
  Phone = "PHONE",
  Email = "EMAIL",
}

const PhoneSignIn: React.FunctionComponent = () => {
  const classes = useStyles();
  const query = useRouter().query;
  const [account, setAccount] = useState("");
  const [verificationCode, setVertificationCode] = useState("");
  const [token, setToken] = useState("");

  const { setFetching, setOpen, storeAccessToken, leftTime, isShowLeftTime, setIsShowLeftTime } =
    AuthorizationContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [, executeCreateVerificationCodeMutation] = useCreateVerificationCodeMutation();
  const [, executeVerifyCodeMutation] = useVerifyCodeMutation();
  const [, executeLoginByOperationTokenMutation] = useLoginByOperationTokenMutation();

  const { handleSubmit, register, control, errors, clearError } = useForm<InputProps>({
    validationSchema: SignInInputFieldsSchema,
    reValidateMode: "onBlur",
    mode: "onBlur",
  });

  const handleSignInOption = async (): Promise<void> => {
    setFetching(true);

    try {
      const loginByVertificationCodeMutationResult = await executeVerifyCodeMutation({
        input: {
          contactInfo: `+86${account}`,
          contactType: ContactType.Phone,
          verificationCode,
          tokenString: token,
        },
      });
      if (loginByVertificationCodeMutationResult.error) {
        const errMessage = errorHandler(loginByVertificationCodeMutationResult.error);
        throw Error(errMessage);
      }
      // accessToken = _.get(loginByVertificationCodeMutationResult, "data.loginByPassword.accessTokenString");
      const res = await executeLoginByOperationTokenMutation({
        contactInfo: `+86${account}`,
        contactType: ContactType.Phone,
        operationToken: token,
      });
      storeAccessToken(token);
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

  function handleGetVertificationCodeClick() {
    executeCreateVerificationCodeMutation({
      contactInfo: `+86${account}`,
      contactType: ContactType.Phone,
    }).then(({ data }) => {
      if (data?.createVerificationCode) {
        setIsShowLeftTime(true);
        setToken(data.createVerificationCode);
      }
    });
  }

  return (
    <form
      className={classes.form}
      onSubmit={handleSubmit(() => {
        handleSignInOption();
      })}
    >
      <div>
        <Controller
          name="account"
          control={control}
          as={
            <TextField
              type="text"
              label="手机号"
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
          name="verificationCode"
          control={control}
          as={
            <TextField
              label="验证码"
              inputRef={register}
              error={!!errors?.verificationCode}
              className={classes.formField}
              inputProps={{ value: verificationCode }}
              helperText={errors?.verificationCode?.message}
              type="text"
              onFocus={(): void => clearError("verificationCode")}
              onInput={(event: React.ChangeEvent<HTMLInputElement>): void => setVertificationCode(event.target.value)}
              InputLabelProps={{
                classes: {
                  root: classes.inputLabelRoot,
                  shrink: classes.inputLabelShrink,
                },
              }}
              InputProps={{
                endAdornment: (
                  <InputAdornment position="end">
                    {isShowLeftTime ? (
                      <span className={classes.reGetCode}>{`重新获取 (${leftTime}s)`}</span>
                    ) : (
                      <Button
                        aria-label="toggle password visibility"
                        onClick={handleGetVertificationCodeClick}
                        className={classes.getCodeBtn}
                        // onMouseDown={handleMouseDownPassword}
                      >
                        获取验证码
                      </Button>
                    )}
                  </InputAdornment>
                ),
              }}
            />
          }
        />
      </div>
      <Button
        type="submit"
        variant="contained"
        classes={{
          root: classes.signInButton,
        }}
      >
        登录
      </Button>
    </form>
  );
};

export default PhoneSignIn;
