import { Box, Button, Dialog, DialogContent, DialogTitle, TextField, Theme, Typography } from "@material-ui/core";
import FormControl from "@material-ui/core/FormControl";
import MenuItem from "@material-ui/core/MenuItem";
import Select from "@material-ui/core/Select";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import UserContainer from "../../../../containers/userContainer";
import {
  ContactType,
  useBindContactMutation,
  useCreateVerificationCodeMutation,
  useIsEmailBindingRequiredQuery,
  useVerifyCodeMutation,
} from "../../../../generated/graphql";
import { REGEX } from "../../../../utils/regex";
import EndAdornment, { ButtonType } from "../../input-end-adornment/end-adornment";
import SnackbarContainer from "../../snackbar/snackbarContainer";
import Logo from "../assets/logo.svg";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    box: {
      display: "grid",
      gridAutoFlow: "row",
      gridRowGap: 30,
      padding: "10px 0px 15px",
    },
    description: {
      margin: "16px 0 0 0",
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: 500,
    },
    question: {
      margin: "16px 0 0 0",
      fontSize: 16,
      lineHeight: "24px",
      fontWeight: 500,
      color: "#666666",
    },
    dialogPaper: {
      minWidth: 420,
      width: 420,
      minHeight: 464,
      height: 436,
    },
    closeButton: {
      position: "absolute",
      right: 0,
      top: 4,
      color: "#ffffff",
    },
    dialogTitle: {
      background: theme.palette.primary.main,
      color: "#ffffff",
      paddingBottom: "12px",
    },
    input: {
      "& input": {
        lineHeight: "24px",
        padding: "5px 0 8px",
      },
      "& input::-webkit-input-placeholder": {
        color: "#999",
        fontSize: 14,
      },
    },
    trailSuccessContent: {
      textAlign: "center",
    },
    trailSuccessText: {
      display: "flex",
      marginLeft: "120px",
    },
    button: {
      top: 20,
      color: "#FFFFFF",
    },
    icon: {
      marginTop: "18px",
      color: theme.palette.primary.main,
    },
    formControl: {
      maxWidth: "40%",
      flex: "1 0 max-content",
    },
    selectEmpty: {
      "&:before": {
        borderBottomWidth: 0,
      },
      "&:after": {
        borderBottomWidth: 0,
      },
      "&:hover:not(.Mui-disabled):before": {
        borderBottomWidth: 0,
      },
    },
    buttonFlow: {
      position: "absolute",
      left: 300,
      top: 330,
      color: "#666666",
      fontSize: 12,
    },
    textField: {
      marginTop: 0,
      marginBottom: 0,
    },
  }),
);

export default function EmailVerificationDialogs(): JSX.Element {
  const classes = useStyles();
  const { register, errors, handleSubmit } = useForm();
  const [open, setOpen] = React.useState(false);
  const [findIsEmailBindingRequiredQueryResult] = useIsEmailBindingRequiredQuery({
    requestPolicy: "network-only",
  });
  const [, executeCreateVerificationCodeMutation] = useCreateVerificationCodeMutation();
  const [, executeVerifyCodeMutation] = useVerifyCodeMutation();
  const [, executeBindContactMutation] = useBindContactMutation();
  const [name, setName] = React.useState<null | string>();
  const [emailPrefix, setEmailPrefix] = React.useState<null | string>();
  const [selectedDomain, setSelectedDomain] = React.useState<null | string>();
  const [domain, setDomain] = useState<string[]>();

  const [token, setToken] = React.useState("");
  const [verificationCode, setVerificationCode] = useState("");
  const { openSnackbar } = SnackbarContainer.useContainer();
  const contactType = ContactType.Email;
  const { user, setUser } = UserContainer.useContainer();

  useEffect(() => {
    const data = findIsEmailBindingRequiredQueryResult.data?.isEmailBindingRequired;
    if (data) {
      const isBindingRequired = data.isBindingRequired;
      if (!isBindingRequired) {
        return;
      }
      const domain = data.domain;

      if (domain) {
        setDomain(domain);
        if (domain && domain.length > 0) {
          setSelectedDomain(domain[0]);
        }
      }

      setName(user?.userName);
      setOpen(true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [findIsEmailBindingRequiredQueryResult]);

  function onSendVerificationCodeButtonClick(callback?: (success: boolean) => void): void {
    const email = ((emailPrefix as string) + selectedDomain) as string;
    const isValidEmail = REGEX.email.test(email);
    if (isValidEmail) {
      executeCreateVerificationCodeMutation({
        contactInfo: email,
        contactType: contactType,
      }).then((res) => {
        if (res.error) {
          // error
          callback?.(false);
          openSnackbar("验证码发送失败，请稍后再试！", "warning");
          return;
        }
        setToken(res.data?.createVerificationCode as string);
      });
    } else {
      openSnackbar("请输入有效邮箱！", "warning");
      return;
    }
  }

  async function onSubmit(): Promise<void> {
    if (emailPrefix && verificationCode) {
      const verifyCodeResult = await executeVerifyCodeMutation({
        input: {
          verificationCode: verificationCode,
          contactInfo: emailPrefix + selectedDomain,
          contactType: contactType,
          tokenString: token,
        },
      });
      if (verifyCodeResult.error) {
        if (verifyCodeResult.error?.message.includes("验证码错误")) {
          openSnackbar(`验证码错误！`, "error");
          return;
        }
        if (verifyCodeResult.error?.message.includes("验证码过期")) {
          openSnackbar(`验证码过期！`, "error");
          return;
        }
        if (verifyCodeResult.error?.message.includes("邮箱已被使用")) {
          openSnackbar(`邮箱已被使用！`, "error");
          return;
        }
        openSnackbar(`验证失败，请稍后再试！`, "warning");
        return;
      }
    } else {
      return;
    }
    const updateUserInfoResult = await executeBindContactMutation({
      contactInfo: emailPrefix + selectedDomain,
      contactType: ContactType.Email,
      operationToken: token,
    });

    if (updateUserInfoResult.error) {
      openSnackbar(`邮箱绑定失败，请稍后重试！`, "warning");
      return;
    }
    openSnackbar(`邮箱绑定成功！`, "success");
    if (updateUserInfoResult.data?.bindContact) {
      setUser(updateUserInfoResult.data?.bindContact);
      setOpen(false);
    }
  }

  return (
    <Dialog classes={{ paper: classes.dialogPaper }} open={open}>
      <DialogTitle classes={{ root: classes.dialogTitle }}>
        <Logo />
      </DialogTitle>
      <DialogContent>
        <Typography className={classes.description}>应管理员要求，需要完善个人信息</Typography>
        <Typography className={classes.question}>有任何疑问，请咨询贵机构管理员</Typography>
        <form noValidate autoComplete="off">
          <Box className={classes.box}>
            <TextField
              className={classes.input}
              id="standard-basic"
              name="name"
              size="medium"
              label="真实姓名"
              onChange={(event): void => {
                setName(event.target.value);
              }}
              value={name}
              inputRef={register({
                required: { value: true, message: "请输入姓名" },
              })}
            />
            <TextField
              className={classes.input}
              name="email"
              inputRef={register({
                required: { value: true, message: "请输入邮箱" },
              })}
              size="medium"
              label="邮箱"
              onChange={(event): void => {
                setEmailPrefix(event.target.value);
              }}
              error={Boolean(errors.email)}
              helperText={errors.email ? errors.email["message"] : ""}
              InputProps={{
                endAdornment: (
                  <FormControl className={classes.formControl}>
                    <Select
                      value={selectedDomain}
                      onChange={(event): void => {
                        setSelectedDomain(event.target.value as string);
                      }}
                      displayEmpty
                      className={classes.selectEmpty}
                    >
                      {domain?.map((item, index) => {
                        return (
                          <MenuItem key={index} value={item}>
                            {item}
                          </MenuItem>
                        );
                      })}
                    </Select>
                  </FormControl>
                ),
              }}
            />
            <TextField
              fullWidth
              label="验证码"
              className={classes.textField}
              onChange={(event): void => {
                setVerificationCode(event.target.value);
              }}
              InputProps={{
                endAdornment: (
                  <EndAdornment
                    buttonType={ButtonType.VERIFICATION_CODE}
                    disabled={!emailPrefix}
                    sendVerificationCode={onSendVerificationCodeButtonClick}
                  />
                ),
              }}
            />
          </Box>
        </form>
        <Button
          color="primary"
          variant="contained"
          className={classes.button}
          disabled={!verificationCode}
          onClick={(): void => {
            handleSubmit(onSubmit)();
          }}
        >
          确认
        </Button>
      </DialogContent>
    </Dialog>
  );
}
