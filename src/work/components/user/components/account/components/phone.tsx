import { Box, createStyles, InputAdornment, makeStyles, TextField, Theme, Typography } from "@material-ui/core";
import clsx from "clsx";
import { Cellphone } from "mdi-material-ui";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import CounterContainer from "../../../../../containers/counterContainer";
// import {
//   useCreateVerificationCodeByPhoneMutation,
//   useUpdatePhoneMutation,
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

const Phone: React.FC = () => {
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
  //   createVerificationCodeByPhoneResult,
  //   executeCreateVerificationCodeByPhoneMutation,
  // ] = useCreateVerificationCodeByPhoneMutation();
  // const [verifyCodeMutationResult, executeVerifyCodeMutation] = useVerifyCodeMutation();
  // const [updatePhoneMutationResult, executeUpdatePhoneMutation] = useUpdatePhoneMutation();

  const { register, errors, triggerValidation, getValues, handleSubmit } = useForm();
  const [isSended, setIsSended] = useState(false);

  function onSubmit(): void {
    const formValues = getValues();
    // executeVerifyCodeMutation({
    //   input: {
    //     account: formValues["phone"],
    //     verificationCode: formValues["verificationCode"],
    //     tokenString: verificationCodeToken,
    //   },
    // });
  }

  function onVerificationButtonClick(): void {
    triggerValidation("phone").then((isPhoneValid) => {
      if (!isPhoneValid) {
        return;
      }

      const formValues = getValues();
      if (counterContainer.count <= 0) {
        setIsSended(true);
        counterContainer.countingStart();

        // executeCreateVerificationCodeByPhoneMutation({
        //   phone: formValues["phone"],
        // });
      }
    });
  }

  // useEffect(() => {
  //   if (
  //     createVerificationCodeByPhoneResult.data &&
  //     createVerificationCodeByPhoneResult.data.createVerificationCodeByPhone
  //   ) {
  //     setVerificationCodeToken(createVerificationCodeByPhoneResult.data.createVerificationCodeByPhone);
  //     return;
  //   }
  //   if (createVerificationCodeByPhoneResult.error) {
  //     setVerificationCodeToken("");
  //     snackbarContainer.openSnackbar("验证码发送失败", "error");
  //     counterContainer.countingStop();
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [createVerificationCodeByPhoneResult]);

  // useEffect(() => {
  //   if (verifyCodeMutationResult.data) {
  //     if (verifyCodeMutationResult.data.verifyCode) {
  //       const formValues = getValues();
  //       executeUpdatePhoneMutation({
  //         operationToken: verifyCodeMutationResult.data.verifyCode,
  //         phone: formValues["phone"],
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
  //   if (updatePhoneMutationResult.data) {
  //     if (updatePhoneMutationResult.data.updatePhone) {
  //       snackbarContainer.openSnackbar("手机号更新成功", "success");
  //       executeUserQuery();
  //       setDialogIndex("none");
  //       return;
  //     }
  //     snackbarContainer.openSnackbar("更新失败，请稍后重试", "error");
  //     return;
  //   }
  //   if (updatePhoneMutationResult.error) {
  //     snackbarContainer.openSnackbar("更新失败，请稍后重试", "error");
  //     return;
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [updatePhoneMutationResult]);

  return (
    <>
      <Card
        icon={<Cellphone className={classes.icon} />}
        title="手机号码"
        subTitle={"手机"}
        onClick={(): void => setDialogIndex("phone")}
      />
      <Dialog
        open={dialogIndex === "phone"}
        onClose={(): void => setDialogIndex("none")}
        onConfirm={(): void => {
          handleSubmit(onSubmit)();
        }}
        title="更换绑定手机"
        confirm
        width="sm"
      >
        <form>
          <Box className={classes.box}>
            <TextField
              className={classes.input}
              name="phone"
              inputRef={register({
                required: { value: true, message: "请输入手机号" },
                pattern: { value: REGEX.phone, message: "请输入正确的手机号" },
                // validate: {
                //   isTheSamePhone: (value: string): boolean | string => {
                //     if (user && user.phone && user.phone === value) {
                //       return "手机号不能一样";
                //     }
                //     return true;
                //   },
                // },
              })}
              inputProps={{
                maxLength: 11,
              }}
              size="medium"
              placeholder="手机号码"
              error={Boolean(errors.phone)}
              helperText={errors.phone ? errors.phone["message"] : ""}
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

export default Phone;
