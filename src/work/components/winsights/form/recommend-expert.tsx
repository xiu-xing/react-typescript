import { Box, FormControlLabel, Radio, RadioGroup, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import SimpleBar from "simplebar-react";
import BasicTextField from "./components/basic-text-field";
import FormWrapper from "./components/form-wrapper";
import UploadCard from "./components/upload-card";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";
import { useRecommendExpertMutation } from "../../../generated/graphql";
import AppContainer from "../../../containers/appContainer";
import CodeTextField from "./components/code-text-field";
import SelectCodeTel from "./components/select-code-tel";
import ExportMeet from "../conference";
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
    formControlLabel: {
      marginLeft: -2,
      marginRight: 42,
      minWidth: 50,
      "& .MuiRadio-root": {
        padding: 0,
      },
      "& .MuiCheckbox-root": {
        padding: 0,
      },
      "& .MuiSvgIcon-root": {
        fontSize: 17,
      },
      "& .MuiFormControlLabel-label": {
        marginLeft: 4,
        fontSize: 16,
        lineHeight: 1.71,
        color: "#333",
        fontWeight: theme.typography.fontWeightRegular,
        whiteSpace: "nowrap",
        overflow: "hidden",
        textOverflow: "ellipsis",
        width: "100%",
      },
    },
  }),
);

const RecommendExpert: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const { closeDialog } = AppContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [name, setName] = useState<string>();
  const [mobile, setMobile] = useState<string>();
  const [company, setCompany] = useState<string>();
  const [position, setPosition] = useState<string>();
  const [background, setBackground] = useState<string>();
  const [card, setCard] = useState<File>();
  const [ways, setWays] = useState<string>("实名推荐");
  const [verifyCode, setVerifyCode] = useState<string>();
  const [token, setToken] = useState<string>();
  const [expertName, setExpertName] = useState<string>();
  const [expertMobile, setExpertMobile] = useState<string>();
  const [commit, setCommit] = useState<boolean>(false);
  const [, executeRecommendExpertMutation] = useRecommendExpertMutation();

  function descInputHelperComponent() {
    if (background) return <Box />;
    return (
      <>
        <Typography className={classes.helperText}>填写示例：</Typography>
        <Typography className={classes.helperText}>专家擅长：神经介入产品，外周血管高耗产品，手术机器人</Typography>
        <Typography className={classes.helperText}>
          2019/08 - 至今 担任 A
          公司外科手术机器人事业部部门经理，负责产品线上市前后医学事务，管理产品上市后的临床研究，临床评价策略的制定。
        </Typography>
        <Typography className={classes.helperText}>
          2005/01 - 2017/06 担任 B 医院外科主治医生，擅长血管腔内接入治疗手术。
        </Typography>
      </>
    );
  }

  function onCardChange(files: File[]): void {
    if (files.length > 0) setCard(files[0]);
    else setCard(undefined);
  }

  async function onSubmit() {
    if (commit) return;
    if (
      !expertMobile ||
      !expertName ||
      !name ||
      !mobile ||
      !background ||
      !company ||
      !position ||
      !verifyCode ||
      !ways
    ) {
      openSnackbar("推荐失败，请确认填写内容", "error");
      return;
    }
    setCommit(true);
    const res = await executeRecommendExpertMutation({
      input: {
        refName: expertName,
        refMobile: expertMobile,
        refCompany: company,
        refPosition: position,
        refIntroduction: background,
        refAnonymous: ways,
        userName: name,
        userMobile: mobile,
      },
      tokenString: token ?? "",
      verificationCode: verifyCode,
      businessCard: card,
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
      openSnackbar("推荐失败，请确认填写内容", "error");
      return;
    } else {
      openSnackbar("推荐成功", "success");
      closeDialog();
    }
  }

  return (
    <FormWrapper title="推荐专家" buttonName={commit ? "推荐中..." : "推荐"} onSubmit={onSubmit}>
      <SimpleBar style={{ height: "calc(100vh - 184px)", padding: "24px 32px" }}>
        <Box display="flex" flexDirection="column">
          <BasicTextField
            autoFocus
            label="姓名"
            required
            helperText={name ? "" : "请输入您的姓名"}
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
            label="专家姓名"
            required
            helperText={expertName ? "" : "请输入专家姓名"}
            value={expertName}
            onChange={(event) => {
              setExpertName((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <BasicTextField
            type="tel"
            label="专家手机号"
            required
            helperText={expertMobile ? "" : "请输入专家手机号"}
            value={expertMobile}
            onChange={(event) => {
              setExpertMobile((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <BasicTextField
            label="公司"
            required
            helperText={company ? "" : "请输入专家当前或曾任职公司"}
            value={company}
            onChange={(event) => {
              setCompany((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <BasicTextField
            label="职位"
            required
            helperText={position ? "" : "请输入专家上述公司职位"}
            value={position}
            onChange={(event) => {
              setPosition((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={16} />
          <BasicTextField
            label="背景"
            multiline
            required
            value={background}
            onChange={(event) => {
              setBackground((event.target as HTMLInputElement).value);
            }}
          />
          <Box height={8} />
          {descInputHelperComponent()}
        </Box>
        <Box height={16} />
        <Typography className={classes.helperText}>名片</Typography>
        <Box height={12} />
        <UploadCard onChange={onCardChange} acceptedFiles={[".jpg", ".png", ".jpeg"]} />
        <Box height={14} />
        <Typography className={classes.helperText}>数据模块</Typography>
        <Box height={12} />
        <RadioGroup
          row
          aria-label="recommend_ways"
          name="ways"
          value={ways}
          onChange={(event) => {
            setWays((event.target as HTMLInputElement).value);
          }}
        >
          <FormControlLabel
            className={classes.formControlLabel}
            value="实名推荐"
            control={<Radio color="primary" />}
            label="实名推荐"
          />
          <FormControlLabel
            className={classes.formControlLabel}
            value="匿名推荐"
            control={<Radio color="primary" />}
            label="匿名推荐"
          />
        </RadioGroup>
        <Box height={8} />
        <Typography className={classes.helperText}>联系被推荐人时会提起您，增加推荐成功率</Typography>
      </SimpleBar>
    </FormWrapper>
  );
};

export default RecommendExpert;
