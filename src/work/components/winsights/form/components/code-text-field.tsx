import { InputAdornment, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { useState } from "react";
import CounterContainer from "../../../../containers/counterContainer";
import { ContactType, useCreateVerificationCodeWithLongValidityMutation } from "../../../../generated/graphql";
import SnackbarContainer from "../../../common/snackbar/snackbarContainer";
import BasicTextField from "./basic-text-field";

const useStyles = makeStyles(() =>
  createStyles({
    verificationCodeText: {
      fontSize: "12px",
      cursor: "pointer",
      color: "#989898",
    },
    verificationCodeDisabledText: {
      color: "#999",
    },
  }),
);

interface CodeTextFieldProps {
  required?: boolean;
  value?: string;
  onChange: (event: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => void;
  onOperationTokenChange: (token: string | undefined) => void;
  phone: string | undefined;
}

// 创建的验证码半小时过期
const CodeTextField: React.FunctionComponent<CodeTextFieldProps> = (props) => {
  const classes = useStyles();
  const { required, value, onChange, phone, onOperationTokenChange } = props;

  const [isSended, setIsSended] = useState(false);
  const counterContainer = CounterContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [, executeCreateVerificationCode] = useCreateVerificationCodeWithLongValidityMutation();
  const reg = /^[+][8][6][1][3-9]\d{9}$|^[+][8][5][2]([5|6|9])\d{7}$|^[+][8][8][6][0][9]\d{8}$|^[+][8][5][3][6]\d{7}$/;

  async function createVerifyCode() {
    if (!phone || !reg.test(phone)) {
      openSnackbar("请输入正确的手机号码！", "warning");
      return;
    }
    if (counterContainer.count <= 0) {
      setIsSended(true);
      counterContainer.countingStart();
      const res = await executeCreateVerificationCode({
        contactInfo: phone,
        contactType: ContactType.Phone,
      });
      if (res.error) {
        openSnackbar("验证码发送失败，请稍后再试！", "warning");
        return;
      }
      onOperationTokenChange(res.data?.createVerificationCodeWithLongValidity ?? "");
    }
  }

  return (
    <BasicTextField
      name="verificationCode"
      inputProps={{
        maxLength: 6,
      }}
      required={required}
      helperText={value ? "" : "请输入验证码"}
      label="验证码"
      onChange={onChange}
      InputProps={{
        endAdornment: (
          <InputAdornment position="end">
            <Typography
              variant="button"
              className={clsx(
                classes.verificationCodeText,
                isSended && counterContainer.count > 0 ? classes.verificationCodeDisabledText : "",
              )}
              onClick={createVerifyCode}
            >
              {!isSended
                ? `获取验证码`
                : `重新获取${counterContainer.count > 0 ? "（" + counterContainer.count + "s）" : ""}`}
            </Typography>
          </InputAdornment>
        ),
      }}
    />
  );
};

export default CodeTextField;
