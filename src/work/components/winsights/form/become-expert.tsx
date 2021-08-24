import { Box, Checkbox, FormControlLabel, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { ChangeEvent, useState } from "react";
import SimpleBar from "simplebar-react";
import UploadFile from "./components/upload-file";
import BasicTextField from "./components/basic-text-field";
import { Alert } from "@material-ui/lab";
import { useBecomeExpertMutation, useExpertDemandMutation } from "../../../generated/graphql";
import CheckBoxGroup from "./components/checkbox-group";
import FormWrapper from "./components/form-wrapper";
import UploadCard from "./components/upload-card";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";
import AppContainer from "../../../containers/appContainer";
import CodeTextField from "./components/code-text-field";
import SelectCodeTel from "./components/select-code-tel";
import { REGEX } from "../../../utils/regex";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    contentTitle: {
      fontSize: 16,
      lineHeight: "24px",
      color: "#737373",
    },
    helperText: {
      fontSize: 14,
      color: "#666",
    },
    agreement: {
      fontSize: 14,
      fontWeight: 500,
      color: "#666666",
    },
    protocol: {
      color: theme.palette.primary.main,
    },
  }),
);

const BecomeExpert: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const { closeDialog } = AppContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [name, setName] = useState<string>();
  const [mobile, setMobile] = useState<string>();
  const [email, setEmail] = useState<string>();
  const [company, setCompany] = useState<string>();
  const [position, setPosition] = useState<string>();
  const [file, setFile] = useState<File>();
  const [card, setCard] = useState<File>();
  const [checked, setChecked] = useState<boolean>(false);
  const [verifyCode, setVerifyCode] = useState<string>();
  const [token, setToken] = useState<string>();
  const [commit, setCommit] = useState<boolean>(false);

  const [, executeBecomeExpertMutation] = useBecomeExpertMutation();
  function onFileChange(files: File[]): void {
    if (files.length > 0) setFile(files[0]);
    else setFile(undefined);
  }

  function onCardChange(files: File[]): void {
    if (files.length > 0) setCard(files[0]);
    else setCard(undefined);
  }

  async function onSubmit() {
    if (commit) return;
    if (!checked) {
      openSnackbar("请先勾选协议", "error");
      return;
    }
    if (!name || !mobile || !email || !company || !position || !verifyCode) {
      openSnackbar("提交失败，请确认填写内容", "error");
      return;
    }
    if (email && !REGEX.email.test(email)) {
      openSnackbar("提交失败，请确认填写内容", "error");
      return;
    }
    setCommit(true);
    const res = await executeBecomeExpertMutation({
      input: {
        userName: name,
        userMobile: mobile,
        userEmail: email,
        companyName: company,
        position: position,
      },
      tokenString: token ?? "",
      verificationCode: verifyCode,
      businessCard: card,
      resume: file,
    });

    setCommit(false);
    if (res.error?.message.includes("验证码错误")) {
      openSnackbar("验证码错误！", "error");
      return;
    }
    if (res.error?.message.includes("验证码过期")) {
      openSnackbar("验证码过期", "error");
      return;
    }
    if (res.error?.message.includes("频率限制")) {
      openSnackbar("手机号接收超过频率限制", "error");
      return;
    }
    if (res.error) {
      openSnackbar("提交失败，请确认填写内容", "error");
      return;
    } else {
      openSnackbar("提交成功", "success");
      closeDialog();
    }
  }

  return (
    <FormWrapper title="成为专家" buttonName={commit ? "提交中..." : "提交"} onSubmit={onSubmit}>
      <SimpleBar style={{ height: "calc(100vh - 184px)", padding: "24px 32px" }}>
        <Box display="flex" flexDirection="column">
          <BasicTextField
            autoFocus
            label="姓名"
            required
            helperText={name ? "" : "输入您的姓名"}
            value={name}
            onChange={(event) => {
              setName((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <Box display="flex">
            <SelectCodeTel
              onChange={(mobile: string) => {
                setMobile(mobile);
              }}
            />
            <Box minWidth={32} />
            <CodeTextField
              required
              onChange={(event) => {
                setVerifyCode((event.target as HTMLInputElement).value);
              }}
              onOperationTokenChange={(token) => {
                setToken(token);
              }}
              phone={mobile}
              value={verifyCode}
            />
          </Box>
          <Box height={16} />
          <BasicTextField
            label="邮箱"
            required
            error={email ? !REGEX.email.test(email) : false}
            helperText={email ? (!REGEX.email.test(email) ? "请输入正确的邮箱" : "") : "用于接收需求进度等信息"}
            value={email}
            onChange={(event) => {
              setEmail((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <BasicTextField
            label="公司"
            required
            helperText={company ? "" : "输入您当前就职的公司"}
            value={company}
            onChange={(event) => {
              setCompany((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <BasicTextField
            label="职位"
            required
            helperText={position ? "" : "输入您的职位"}
            value={position}
            onChange={(event) => {
              setPosition((event.target as HTMLInputElement).value);
            }}
          />
        </Box>
        <Box height={16} />
        <Typography className={classes.helperText}>简历</Typography>
        <Box height={12} />
        <UploadFile onChange={onFileChange} acceptedFiles={[".pdf", ".zip", ".rar", ".doc"]} />
        <Box height={16} />
        <Typography className={classes.helperText}>名片</Typography>
        <Box height={12} />
        <UploadCard onChange={onCardChange} acceptedFiles={[".jpg", ".png", ".jpeg"]} />
        <Box height={24} />
        <FormControlLabel
          control={<Checkbox checked={checked} size="small" color="primary" />}
          label={
            <div className={classes.agreement}>
              我已阅读并同意
              <span
                className={classes.protocol}
                onClick={() => {
                  window.open("https://winsights.com.cn/Wins.Expert.H5/expert/protocol.html");
                }}
              >
                《万盛行业专家顾问网络协议》
              </span>
            </div>
          }
          onChange={(event: ChangeEvent<{}>, checked: boolean) => {
            setChecked(checked);
          }}
        />
      </SimpleBar>
    </FormWrapper>
  );
};

export default BecomeExpert;
