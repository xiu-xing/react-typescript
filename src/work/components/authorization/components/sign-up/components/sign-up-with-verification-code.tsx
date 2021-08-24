import { Button, TextField, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import { Controller, useForm } from "react-hook-form";
import * as yup from "yup";
import {} from "../../../../../generated/graphql";
import { errorParse } from "../../../../../utils/errorHandler";
import { REGEX } from "../../../../../utils/regex";
import EndAdornment, { ButtonType } from "../../../../common/input-end-adornment/end-adornment";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import AuthorizationContainer, { LoginMethod } from "../../../authorizationContainer";
import SignUpContainer from "../signUpContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    form: {
      display: "flex",
      flexDirection: "column",
      justifyContent: "space-between",
      alignItems: "center",
    },
    inputFocused: {
      color: theme.palette.primary.main,
    },
    inputUnderline: {
      borderBottomColor: theme.palette.primary.main,
    },
    inputLabelRoot: {
      fontSize: 16,
    },
    inputLabelShrink: {
      fontSize: 14,
    },
    visibleIconButton: {
      fontSize: "1rem",
      padding: 5,
    },
    verificationLink: {
      color: "#999999",
    },
    authOrForgetPassword: {
      marginTop: 58,
      width: "100%",
      display: "flex",
      alignItems: "center",
      justifyContent: "space-between",
    },
    link: {
      color: theme.palette.primary.main,
      textDecoration: "none",
      fontSize: 14,
    },
    signInButton: {
      height: 36,
    },
    signUpButton: {
      height: 36,
    },
    linkOuter: {
      display: "flex",
    },
    linkText: {
      alignSelf: "center",
    },
    textField: {
      width: "100%",
      marginTop: 38,
      "&:first-child": {
        marginTop: 0,
      },
    },
  }),
);

type Inputs = {
  account: string;
  verificationCode: string;
};

export const SignUpFieldsSchema = yup.object().shape({
  account: yup
    .string()
    .trim()
    .test("account", "请输入正确的邮箱或手机号码", function (value: string) {
      const isValidEmail = REGEX.email.test(value);
      const isValidPhone = REGEX.phone.test(value);
      if (!isValidEmail && !isValidPhone) {
        return false;
      }
      return true;
    }),
  verificationCode: yup
    .string()
    .trim()
    .length(6, "至少 6 位验证码")
    .matches(REGEX.verificationCode, "请输入 6 位数字验证码"),
});

const SignUpWithVerificationCode: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { account, setAccount, setOperationToken, setSignUpStep, setPasswordAction } = SignUpContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [verificationCode, setVerificationCode] = useState("");

  // 验证码和手机匹配的 token
  const [verificationCodeToken, setVerificationCodeToken] = useState("");
  const { setLoginMethod, setFetching, setOpen } = AuthorizationContainer.useContainer();

  // const [, executeVerifyCode] = useVerifyCodeMutation();
  // const [
  //   createVerificationCodeByEmailResult,
  //   executeCreateVerificationCodeByEmailMutation,
  // ] = useCreateVerificationCodeByEmailMutation();
  // const [
  //   createVerificationCodeByPhoneResult,
  //   executeCreateVerificationCodeByPhoneMutation,
  // ] = useCreateVerificationCodeByPhoneMutation();

  // const [checkAccountExistenceQueryResult, executeCheckAccountExistenceQuery] = useCheckAccountExistenceQuery({
  //   variables: { account },
  //   requestPolicy: "network-only",
  //   pause: true,
  // });

  const { handleSubmit, register, control, errors, clearError, setError } = useForm<Inputs>({
    validationSchema: SignUpFieldsSchema,
    reValidateMode: "onBlur",
    mode: "onBlur",
  });

  // handle send verification code by account
  // const sendVerificationCode = (): void => {
  //   if (account) {
  //     REGEX.email.test(account)
  //       ? executeCreateVerificationCodeByEmailMutation({ email: account })
  //       : executeCreateVerificationCodeByPhoneMutation({ phone: account });
  //   }
  // };

  // handle verification code input
  const handleAccountChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
    setAccount(event.target.value);
  };

  // register handler
  const handleSignInOption = async (): Promise<void> => {
    setFetching(true);

    try {
      // const verifyCodeResult = await executeVerifyCode({
      //   input: {
      //     account,
      //     verificationCode,
      //     tokenString: verificationCodeToken,
      //   },
      // });
      // if (verifyCodeResult.data?.verifyCode) {
      //   setOperationToken(verifyCodeResult.data?.verifyCode);
      //   setPasswordAction("createAccount");
      //   setSignUpStep("settingPassword");
      //   return;
      // }
      // if (verifyCodeResult.error) {
      //   throw Error("验证码已过期, 请重新获取验证码");
      // }
    } catch (error) {
      setTimeout(() => {
        setOpen(true);
      }, 1000);
      openSnackbar(errorParse(error.message).Message, "error");
    } finally {
      setTimeout(() => {
        setFetching(false);
      }, 700);
    }
  };

  // useEffect(() => {
  //   if (checkAccountExistenceQueryResult.fetching) {
  //     return;
  //   }
  //   if (checkAccountExistenceQueryResult.data) {
  //     const isAccountExistence = _.get(checkAccountExistenceQueryResult, "data.checkAccountExistence");
  //     if (isAccountExistence) {
  //       setError("account", "Existed", "帐号已存在");
  //     }
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [checkAccountExistenceQueryResult]);

  // 处理 email 获取验证码结果
  // useEffect(() => {
  //   if (createVerificationCodeByEmailResult.data) {
  //     const verificationCode = _.get(createVerificationCodeByEmailResult, "data.createVerificationCodeByEmail");
  //     if (verificationCode) {
  //       setVerificationCodeToken(verificationCode);
  //     } else {
  //       setError("verificationCode", "Send", "获取验证码失败");
  //     }
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [createVerificationCodeByEmailResult]);

  // // 处理 手机 获取验证码结果
  // useEffect(() => {
  //   if (createVerificationCodeByPhoneResult.data) {
  //     const verificationCode = _.get(createVerificationCodeByPhoneResult, "data.createVerificationCodeByPhone");
  //     if (verificationCode) {
  //       setVerificationCodeToken(verificationCode);
  //     } else {
  //       setError("verificationCode", "Send", "获取验证码失败");
  //     }
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [createVerificationCodeByPhoneResult]);

  const hasEmptyInput = (): boolean => {
    return !(account && verificationCode);
  };

  const hasErrors = (): boolean => {
    return !!errors?.account?.message && !!errors?.verificationCode?.message;
  };

  return (
    <form
      onSubmit={handleSubmit(() => {
        handleSignInOption();
      })}
    >
      <Controller
        name="account"
        control={control}
        onBlur={(): void => {
          if (account && !errors.account) {
            // executeCheckAccountExistenceQuery();
          }
        }}
        as={
          <TextField
            type="text"
            label="帐号"
            inputRef={register}
            error={!!errors["account"]}
            className={classes.textField}
            onInput={handleAccountChange}
            onFocus={(): void => {
              clearError("account");
            }}
            inputProps={{ value: account }}
            helperText={errors?.account?.message}
            InputLabelProps={{
              classes: {
                root: classes.inputLabelRoot,
                shrink: classes.inputLabelShrink,
              },
            }}
          />
        }
      />
      <Controller
        name="verificationCode"
        control={control}
        as={
          <TextField
            type="text"
            label="验证码"
            inputRef={register}
            className={classes.textField}
            error={!!errors["verificationCode"]}
            helperText={errors?.verificationCode?.message}
            inputProps={{ value: verificationCode, maxLength: 6 }}
            onInput={(event: React.ChangeEvent<HTMLInputElement>): void => {
              setVerificationCode(event.target.value);
            }}
            onFocus={(): void => {
              clearError("verificationCode");
            }}
            InputProps={{
              endAdornment: (
                <EndAdornment
                  buttonType={ButtonType.VERIFICATION_CODE}
                  disabled={!!errors["account"]}
                  // sendVerificationCode={sendVerificationCode}
                />
              ),
              classes: {
                focused: classes.inputFocused,
                underline: classes.inputUnderline,
              },
            }}
            InputLabelProps={{
              classes: {
                root: classes.inputLabelRoot,
                shrink: classes.inputLabelShrink,
              },
            }}
          />
        }
      />
      <div className={classes.authOrForgetPassword}>
        <Button
          type="submit"
          disabled={hasEmptyInput() || hasErrors()}
          className={classes.signUpButton}
          variant="contained"
          color="primary"
        >
          快速注册
        </Button>
        <div className={classes.linkOuter}>
          <div className={classes.linkText}>已有账号？</div>
          <Button
            onClick={(): void => {
              setLoginMethod(LoginMethod.Email);
            }}
          >
            <span className={classes.link}>去登陆</span>
          </Button>
        </div>
      </div>
    </form>
  );
};

export default SignUpWithVerificationCode;
