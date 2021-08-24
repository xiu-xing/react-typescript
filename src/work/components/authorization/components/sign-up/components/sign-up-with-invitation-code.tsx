import { Button, TextField, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import { Controller, useForm } from "react-hook-form";
import * as yup from "yup";
// import { useCheckInvitationCodeMutation } from "../../../../../generated/graphql";
import { REGEX } from "../../../../../utils/regex";
import AuthorizationContainer, { LoginMethod } from "../../../authorizationContainer";
import SignUpContainer from "../signUpContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
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
  invitationCode: string;
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
  invitationCode: yup.string().required("请输入邀请码"),
});

const SignUpWithInvitationCode: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { setLoginMethod, setFetching } = AuthorizationContainer.useContainer();
  const { account, setAccount, setOperationToken, setSignUpStep, setPasswordAction } = SignUpContainer.useContainer();

  const [invitationCode, setInvitationCode] = useState("");

  const { handleSubmit, register, control, errors, clearError, setError } = useForm<Inputs>({
    validationSchema: SignUpFieldsSchema,
    reValidateMode: "onBlur",
    mode: "onBlur",
  });

  // const [checkInvitationCodeMutationResult, executeCheckInvitationCodeMutation] = useCheckInvitationCodeMutation();

  // function onSubmit(): void {
  //   if (account && invitationCode) {
  //     executeCheckInvitationCodeMutation({
  //       account: account,
  //       invitationCode: invitationCode,
  //     });
  //   }
  // }

  const handleAccountChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
    if (errors["account"]) {
      clearError(["account"]);
    }
    setAccount(event.target.value);
  };

  const hasEmptyInput = (): boolean => {
    return !(account && invitationCode);
  };

  const hasErrors = (): boolean => {
    return !!errors?.account?.message && !!errors?.invitationCode?.message;
  };

  // useEffect(() => {
  //   setFetching(checkInvitationCodeMutationResult.fetching);
  //   if (checkInvitationCodeMutationResult.data) {
  //     const operationToken = _.get(checkInvitationCodeMutationResult, "data.checkInvitationCode");
  //     if (operationToken) {
  //       setOperationToken(operationToken);
  //       setPasswordAction("activateAccount");
  //       setSignUpStep("settingPassword");
  //       return;
  //     }
  //     setError("invitationCode", "error", "账号或邀请码错误");
  //     return;
  //   }
  //   if (checkInvitationCodeMutationResult.error) {
  //     setError("invitationCode", "error", "账号或邀请码错误");
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [checkInvitationCodeMutationResult]);

  return (
    <form
      onSubmit={handleSubmit(() => {
        // onSubmit();
      })}
    >
      <Controller
        name="account"
        control={control}
        as={
          <TextField
            type="text"
            label="帐号"
            inputRef={register}
            error={!!errors["account"]}
            className={classes.textField}
            onInput={handleAccountChange}
            inputProps={{ value: account }}
            helperText={errors?.account?.message}
            onFocus={(): void => {
              clearError(["account"]);
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
      <Controller
        name="invitationCode"
        control={control}
        as={
          <TextField
            label="邀请码"
            inputRef={register}
            className={classes.textField}
            error={!!errors["invitationCode"]}
            helperText={errors["invitationCode"]?.message}
            inputProps={{ value: invitationCode, maxLength: 6 }}
            onInput={(event: React.ChangeEvent<HTMLInputElement>): void => {
              if (errors["account"]) {
                clearError(["invitationCode"]);
              }
              setInvitationCode(event.target.value);
            }}
            InputProps={{
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

export default SignUpWithInvitationCode;
