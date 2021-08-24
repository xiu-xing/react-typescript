import { Box, createStyles, InputAdornment, makeStyles, TextField, Theme, Typography } from "@material-ui/core";
import clsx from "clsx";
import { Email } from "mdi-material-ui";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import CounterContainer from "../../../../../containers/counterContainer";
// import {
//   useCreateVerificationCodeByEmailMutation,
//   useUpdateEmailMutation,
//   useVerifyCodeMutation
// } from "../../../../../generated/graphql";
import { REGEX } from "../../../../../utils/regex";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import UserContainer from "../../../userContainer";
import Card from "../../card";
import Dialog from "../../dialog";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    box: {
      display: "grid",
      gridAutoFlow: "row",
      gridRowGap: 30,
      padding: "16px 24px 20px",
    },
    input: {
      "& input": {
        lineHeight: "24px",
        padding: "8px 0 9px",
      },
      "& input::-webkit-input-placeholder": {
        color: "#999",
        fontSize: 14,
      },
    },
    verificationCodeText: {
      fontSize: "12px",
      cursor: "pointer",
      color: theme.palette.primary.main,
    },
    verificationCodeDisabledText: {
      color: "#999",
    },
    icon: {
      color: "#66778B",
      fontSize: "56px",
    },
  }),
);

const Mail: React.FC = () => {
  const classes = useStyles();
  const snackbarContainer = SnackbarContainer.useContainer();
  const counterContainer = CounterContainer.useContainer();
  const {
    dialogType: dialogIndex,
    setDialogType: setDialogIndex,
    executeUserQuery,
    user,
  } = UserContainer.useContainer();

  const [verificationCodeToken, setVerificationCodeToken] = useState("");

  // const [
  //   createVerificationCodeByEmailResult,
  //   executeCreateVerificationCodeByEmailMutation,
  // ] = useCreateVerificationCodeByEmailMutation();
  // const [verifyCodeMutationResult, executeVerifyCodeMutation] = useVerifyCodeMutation();
  // const [updateEmailMutationResult, executeUpdateEmailMutation] = useUpdateEmailMutation();

  const { register, errors, triggerValidation, getValues, handleSubmit } = useForm();
  const [isSended, setIsSended] = useState(false);

  function onSubmit(): void {
    const formValues = getValues();
    // executeVerifyCodeMutation({
    //   input: {
    //     account: formValues["email"],
    //     verificationCode: formValues["verificationCode"],
    //     tokenString: verificationCodeToken,
    //   },
    // });
  }

  function onVerificationButtonClick(): void {
    triggerValidation("email").then((isEmailValid) => {
      if (!isEmailValid) {
        return;
      }

      const formValues = getValues();
      if (counterContainer.count <= 0) {
        setIsSended(true);
        counterContainer.countingStart();

        // executeCreateVerificationCodeByEmailMutation({
        //   email: formValues["email"],
        // });
      }
    });
  }

  // useEffect(() => {
  //   if (
  //     createVerificationCodeByEmailResult.data &&
  //     createVerificationCodeByEmailResult.data.createVerificationCodeByEmail
  //   ) {
  //     setVerificationCodeToken(createVerificationCodeByEmailResult.data.createVerificationCodeByEmail);
  //     return;
  //   }
  //   if (createVerificationCodeByEmailResult.error) {
  //     setVerificationCodeToken("");
  //     snackbarContainer.openSnackbar("验证码发送失败", "error");
  //     counterContainer.countingStop();
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [createVerificationCodeByEmailResult]);

  // useEffect(() => {
  //   if (verifyCodeMutationResult.data) {
  //     if (verifyCodeMutationResult.data.verifyCode) {
  //       const formValues = getValues();
  //       executeUpdateEmailMutation({
  //         operationToken: verifyCodeMutationResult.data.verifyCode,
  //         email: formValues["email"],
  //       });
  //       return;
  //     }
  //     snackbarContainer.openSnackbar("验证码校验失败", "error");
  //     return;
  //   }
  //   if (verifyCodeMutationResult.error) {
  //     snackbarContainer.openSnackbar("验证码校验失败", "error");
  //     return;
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [verifyCodeMutationResult]);

  // useEffect(() => {
  //   if (updateEmailMutationResult.data) {
  //     if (updateEmailMutationResult.data.updateEmail) {
  //       snackbarContainer.openSnackbar("邮箱更新成功", "success");
  //       executeUserQuery();
  //       setDialogIndex("none");
  //       return;
  //     }
  //     snackbarContainer.openSnackbar("更新失败，请稍后重试", "error");
  //     return;
  //   }
  //   if (updateEmailMutationResult.error) {
  //     snackbarContainer.openSnackbar("更新失败，请稍后重试", "error");
  //     return;
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [updateEmailMutationResult]);

  return (
    <>
      <Card
        icon={<Email className={classes.icon} />}
        title="邮箱地址"
        subTitle={"email"}
        onClick={(): void => setDialogIndex("mail")}
      />
      <Dialog
        open={dialogIndex === "mail"}
        onClose={(): void => setDialogIndex("none")}
        onConfirm={(): void => {
          handleSubmit(onSubmit)();
        }}
        title="更换绑定邮箱"
        confirm
        width="sm"
      >
        <form>
          <Box className={classes.box}>
            <TextField
              className={classes.input}
              name="email"
              inputRef={register({
                required: { value: true, message: "请输入邮箱" },
                pattern: { value: REGEX.email, message: "请输入正确的邮箱" },
                // validate: {
                //   isTheSameEmail: (value: string): boolean | string => {
                //     if (user && user.email && user.email === value) {
                //       return "邮箱不能一样";
                //     }
                //     return true;
                //   },
                // },
              })}
              size="medium"
              // color="primary"
              placeholder="邮箱"
              error={Boolean(errors.email)}
              helperText={errors.email ? errors.email["message"] : ""}
            />
            <TextField
              className={classes.input}
              name="verificationCode"
              inputRef={register({
                required: { value: true, message: "请输入验证码" },
                pattern: { value: REGEX.verificationCode, message: "请输入6位数字的验证码" },
              })}
              inputProps={{
                maxLength: 6,
              }}
              error={Boolean(errors.verificationCode)}
              helperText={errors.verificationCode ? errors.verificationCode["message"] : ""}
              size="medium"
              placeholder="验证码"
              InputProps={{
                endAdornment: (
                  <InputAdornment position="end">
                    <Typography
                      variant="button"
                      className={clsx(
                        classes.verificationCodeText,
                        isSended && counterContainer.count > 0 ? classes.verificationCodeDisabledText : "",
                      )}
                      onClick={onVerificationButtonClick}
                    >
                      {!isSended
                        ? `发送验证码`
                        : `重新发送${counterContainer.count > 0 ? "（" + counterContainer.count + "s）" : ""}`}
                    </Typography>
                  </InputAdornment>
                ),
              }}
            />
          </Box>
        </form>
      </Dialog>
    </>
  );
};

export default Mail;
