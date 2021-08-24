import {
  Box,
  createStyles,
  FormControl,
  FormLabel,
  IconButton,
  InputAdornment,
  makeStyles,
  TextField,
  Theme,
  Typography,
} from "@material-ui/core";
import { Visibility, VisibilityOff } from "@material-ui/icons";
import clsx from "clsx";
import { Lock } from "mdi-material-ui";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import CounterContainer from "../../../../../containers/counterContainer";
// import {
//   useCreateVerificationCodeByEmailMutation,
//   useCreateVerificationCodeByPhoneMutation,
//   useUpdatePasswordMutation,
//   useVerifyCodeMutation,
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
    icon: {
      color: "#66778B",
      fontSize: "56px",
    },
    verificationCodeText: {
      fontSize: "12px",
      cursor: "pointer",
      color: theme.palette.primary.main,
    },
    verificationCodeDisabledText: {
      color: "#999",
    },
    visibleIconButton: {
      fontSize: "1rem",
      padding: 5,
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
    radioContainer: {},
    sectionTitle: {
      fontSize: 13,
      color: "#333",
      marginBottom: 12,
    },
    radioLabel: {
      fontSize: "12px",
      color: "#333",
    },
  }),
);

const Password: React.FC = () => {
  const classes = useStyles();
  const snackbarContainer = SnackbarContainer.useContainer();
  const counterContainer = CounterContainer.useContainer();
  const { dialogType: dialogIndex, setDialogType: setDialogIndex, user } = UserContainer.useContainer();

  const [verificationCodeToken, setVerificationCodeToken] = useState("");

  const { register, errors, getValues, handleSubmit } = useForm();
  const [isSended, setIsSended] = useState(false);
  const [visible, setVisible] = useState(false);
  const [verificationType, setVerificationType] = useState("");

  // const [
  //   createVerificationCodeByPhoneResult,
  //   executeCreateVerificationCodeByPhoneMutation,
  // ] = useCreateVerificationCodeByPhoneMutation();
  // const [
  //   createVerificationCodeByEmailResult,
  //   executeCreateVerificationCodeByEmailMutation,
  // ] = useCreateVerificationCodeByEmailMutation();
  // const [verifyCodeMutationResult, executeVerifyCodeMutation] = useVerifyCodeMutation();
  // const [updatePasswordMutationResult, executeUpdatePasswordMutation] = useUpdatePasswordMutation();

  const radioOptions = [
    {
      value: "phone",
      label: "手机号码",
    },
    {
      value: "email",
      label: "邮箱地址",
    },
  ];

  function onSubmit(): void {
    const formValues = getValues();
    // executeVerifyCodeMutation({
    //   input: {
    //     account: verificationType === "phone" ? user?.phone || "" : user?.email || "",
    //     verificationCode: formValues["verificationCode"],
    //     tokenString: verificationCodeToken,
    //   },
    // });
  }

  function onRadioChange(event: React.ChangeEvent<HTMLInputElement>, value: string): void {
    setVerificationType(value);
  }

  function onVerificationButtonClick(): void {
    if (counterContainer.count <= 0) {
      setIsSended(true);
      counterContainer.countingStart();

      // if (verificationType === "email" && user?.email) {
      //   executeCreateVerificationCodeByEmailMutation({
      //     email: user.email,
      //   });
      //   return;
      // }

      // if (verificationType === "phone" && user?.phone) {
      //   executeCreateVerificationCodeByPhoneMutation({
      //     phone: user.phone,
      //   });
      //   return;
      // }
    }
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
  //       executeUpdatePasswordMutation({
  //         operationToken: verifyCodeMutationResult.data.verifyCode,
  //         password: formValues["password"],
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
  //   if (updatePasswordMutationResult.data) {
  //     if (updatePasswordMutationResult.data.updatePassword) {
  //       snackbarContainer.openSnackbar("密码更新成功", "success");
  //       setDialogIndex("none");
  //       destroyCookie(null, "access_token");
  //       // window.location.href = "/login";
  //       return;
  //     }
  //     snackbarContainer.openSnackbar("更新失败，请稍后重试", "error");
  //     return;
  //   }
  //   if (updatePasswordMutationResult.error) {
  //     snackbarContainer.openSnackbar("更新失败，请稍后重试", "error");
  //     return;
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [updatePasswordMutationResult]);

  return (
    <>
      <Card
        icon={<Lock className={classes.icon} />}
        title="密码"
        subTitle="修改当前密码"
        onClick={(): void => {
          if (!user) {
            snackbarContainer.openSnackbar("加载中，请稍候", "warning");
            return;
          }
          // setVerificationType(user.phone ? "phone" : "email");
          setDialogIndex("password");
        }}
      />
      <Dialog
        open={dialogIndex === "password"}
        title="修改密码"
        confirm
        onClose={(): void => setDialogIndex("none")}
        onConfirm={(): void => {
          handleSubmit(onSubmit)();
        }}
        width="sm"
      >
        <form>
          <Box className={classes.box}>
            <div className={classes.radioContainer}>
              <FormControl component="fieldset">
                <FormLabel focused={false} className={classes.sectionTitle} component="legend">
                  验证方式
                </FormLabel>
                {/* <RadioGroup
                  row
                  defaultValue={user ? (user.phone ? "phone" : "email") : "phone"}
                  onChange={onRadioChange}
                >
                  {radioOptions.map((child, index) => {
                    return (
                      <FormControlLabel
                        classes={{ label: classes.radioLabel }}
                        key={index}
                        value={child.value}
                        control={<Radio size="small" color="primary" disabled={!(user && user[child.value])} />}
                        label={child.label}
                      />
                    );
                  })}
                </RadioGroup> */}
              </FormControl>
            </div>
            {/* <TextField
              disabled
              className={classes.input}
              name="account"
              value={verificationType === "email" ? user?.email : user?.phone}
              size="medium"
              color="primary"
            /> */}
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
              color="primary"
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
            <TextField
              className={classes.input}
              name="password"
              inputRef={register({
                required: { value: true, message: "请输入密码" },
                minLength: 8,
                pattern: { value: REGEX.password, message: "请输入8位及以上的字母、数字、符号的组合" },
              })}
              type={visible ? "text" : "password"}
              error={Boolean(errors.password)}
              helperText={errors.password ? errors.password["message"] : ""}
              size="medium"
              placeholder="设置密码"
              InputProps={{
                endAdornment: (
                  <InputAdornment position="end">
                    <IconButton
                      onClick={(): void => {
                        setVisible(!visible);
                      }}
                      className={classes.visibleIconButton}
                      aria-label="toggle password visibility"
                    >
                      {visible ? <Visibility /> : <VisibilityOff />}
                    </IconButton>
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

export default Password;
