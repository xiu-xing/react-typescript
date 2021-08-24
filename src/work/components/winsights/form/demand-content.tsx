import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import SimpleBar from "simplebar-react";
import CodeTextField from "./components/code-text-field";
import BasicTextField from "./components/basic-text-field";
import FormWrapper from "./components/form-wrapper";
import { useDemandMutation } from "../../../generated/graphql";
import AppContainer from "../../../containers/appContainer";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";
import SelectCodeTel from "./components/select-code-tel";
import UploadFile from "./components/upload-file";
import { REGEX } from "../../../utils/regex";

const useStyles = makeStyles(() =>
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
  }),
);

const DemandContent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const { closeDialog } = AppContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();

  const [name, setName] = useState<string>();
  const [mobile, setMobile] = useState<string>();
  const [verifyCode, setVerifyCode] = useState<string>();
  const [token, setToken] = useState<string>();
  const [email, setEmail] = useState<string>();
  const [industry, setIndustry] = useState<string>();
  const [company, setCompany] = useState<string>();
  const [position, setPosition] = useState<string>();
  const [description, setDescription] = useState<string>();
  const [file, setFile] = useState<File>();
  const [commit, setCommit] = useState<boolean>(false);

  const [, executeDemandMutation] = useDemandMutation();

  function onFileChange(files: File[]): void {
    if (files.length > 0) setFile(files[0]);
    else setFile(undefined);
  }

  async function onSubmit() {
    if (commit) return;
    if (!name || !mobile || !verifyCode || !description) {
      openSnackbar("发布失败，请确认填写内容", "error");
      return;
    }
    if (email && !REGEX.email.test(email)) {
      openSnackbar("发布失败，请确认填写内容", "error");
      return;
    }
    setCommit(true);
    const res = await executeDemandMutation({
      input: {
        userName: name,
        userMobile: mobile,
        userEmail: email,
        demandIndustry: industry,
        demandDesc: description,
        companyName: company,
        position: position,
      },
      tokenString: token ?? "",
      verificationCode: verifyCode,
      demandAttachment: file,
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
      openSnackbar("发布失败，请确认填写内容", "error");
      return;
    } else {
      openSnackbar("发布成功", "success");
      closeDialog();
    }
  }

  function descInputHelperComponent() {
    if (description) return <Box />;
    return (
      <>
        <Typography className={classes.helperText}>填写示例：</Typography>
        <Box height={4} />
        <Typography className={classes.helperText}>
          需要寻找懂消炎药的行业专家，专家需要有抗生素药品类的渠道拓展经验，希望了解消炎药的市场竞争格局，消炎药相关的最新医药政策变化。
        </Typography>
        <Box height={12} />
        <Typography className={classes.helperText}>错误示例：</Typography>
        <Box height={4} />
        <Typography className={classes.helperText}>我需要医药行业专家，讲讲市场竞争格局，政策变化。</Typography>
      </>
    );
  }

  return (
    <FormWrapper title="提交需求" buttonName={commit ? "发布中..." : "发布"} onSubmit={onSubmit}>
      <SimpleBar style={{ height: "calc(100vh - 184px)", padding: "24px 32px" }}>
        <Box display="flex" flexDirection="column">
          <Typography className={classes.contentTitle}>
            当您要深入研究某个行业并希望得到相关专家解惑，我们会快速匹配到您所需的专家，为您提供一站式的对接服务
          </Typography>
          <Box height={20} />
          <BasicTextField
            autoFocus
            required
            label="姓名"
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
            error={email ? !REGEX.email.test(email) : false}
            helperText={email ? (!REGEX.email.test(email) ? "请输入正确的邮箱" : "") : "用于接收需求进度等信息"}
            value={email}
            onChange={(event) => {
              setEmail((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <BasicTextField
            label="目标行业"
            helperText={
              industry
                ? ""
                : "请填写约访专家的目标行业，可输入多个关键词，以逗号隔开，例如：医药，新能源汽车，半导体材料"
            }
            value={industry}
            onChange={(event) => {
              setIndustry((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <BasicTextField
            label="目标行业公司"
            helperText={
              company ? "" : "请填写您要约访专家的目标公司，可输入多个关键词，以逗号隔开，例如：A 公司，B 公司，C 公司"
            }
            value={company}
            onChange={(event) => {
              setCompany((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <BasicTextField
            label="目标专家职能"
            helperText={position ? "" : "请输入多个关键词，以逗号隔开，例如：产品总监/经理，市场总监，工程师，医生"}
            value={position}
            onChange={(event) => {
              setPosition((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <BasicTextField
            label="需求描述"
            multiline
            required
            helperText={description ? "" : "信息保护中，仅工作人员可见"}
            value={description}
            onChange={(event) => {
              setDescription((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={8} />
          {descInputHelperComponent()}
          <Box height={16} />
          <Typography className={classes.helperText}>上传材料</Typography>
          <Box height={12} />
          <UploadFile onChange={onFileChange} acceptedFiles={[".pdf", ".zip", ".rar", ".doc"]} />
          <Box height={12} />
          <Typography className={classes.helperText}>
            {file && file.name ? file.name : "仅支持 word，PDF，ZIP，RAR 格式，文件大小不超过 10MB"}
          </Typography>
        </Box>
      </SimpleBar>
    </FormWrapper>
  );
};

export default DemandContent;
