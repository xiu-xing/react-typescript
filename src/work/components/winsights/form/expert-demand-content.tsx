import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect, useMemo, useState } from "react";
import SimpleBar from "simplebar-react";
import UploadFile from "./components/upload-file";
import CodeTextField from "./components/code-text-field";
import BasicTextField from "./components/basic-text-field";
import FormWrapper from "./components/form-wrapper";
import CheckBoxGroup from "./components/checkbox-group";
import { useExpertDemandMutation } from "../../../generated/graphql";
import AppContainer from "../../../containers/appContainer";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";
import SelectCodeTel from "./components/select-code-tel";
import { REGEX } from "../../../utils/regex";
import { ConsoleLine } from "mdi-material-ui";
import { ContentProps } from "../trendingExpert";

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

interface ExpertDemandContentProps {
  proId?: string;
  index: number;
  content: ContentProps[];
}

const ExpertDemandContent: React.FunctionComponent<ExpertDemandContentProps> = (props) => {
  const classes = useStyles();
  const { closeDialog } = AppContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();

  const [name, setName] = useState<string>();
  const [mobile, setMobile] = useState<string>();
  const [verifyCode, setVerifyCode] = useState<string>();
  const [token, setToken] = useState<string>();
  const [email, setEmail] = useState<string>();
  const [description, setDescription] = useState<string>();
  const [expert, setDemandExpert] = useState<string>("");
  const [file, setFile] = useState<File>();
  const [commit, setCommit] = useState<boolean>(false);

  const demandExpert = useMemo(
    () => [...props.content.map((c) => c.title), "其他专家：在需求中具体描述想约访专家信息"],
    [props.content],
  );
  const demandExpertId = useMemo(() => [...props.content.map((c) => c.id), "-1"], [props.content]);

  useEffect(() => {
    const expertList: string[] = [];
    props.content.forEach((value) => {
      expertList.push("0");
    });
    expertList[props.index] = demandExpertId[props.index];
    setDemandExpert(expertList.join(","));
  }, [demandExpertId]);

  const [, executeExpertDemandMutation] = useExpertDemandMutation();

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
    const res = await executeExpertDemandMutation({
      input: {
        userName: name,
        userMobile: mobile,
        userEmail: email,
        demandDesc: description,
        demandExpert: expert,
        proId: `${props.proId}`,
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
        <Typography className={classes.helperText}>请您简要描述需求详情，如：</Typography>
        <Box height={4} />
        <Typography className={classes.helperText}>
          需要寻找IVD领域中关于化学发光免疫及POCT等领域的相关专家，可以是头部企业也可以是协会，能够充分解读IVD不同领域不同技术的难点及痛点，并了解目前国内IVD仪器及设备的相关情况，同时也了解目前行业的集采现状等
        </Typography>
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
          <CheckBoxGroup
            labels={demandExpert}
            itemId={demandExpertId}
            currentIndex={props.index}
            onValueChange={(values) => {
              setDemandExpert(values.join(","));
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

export default ExpertDemandContent;
