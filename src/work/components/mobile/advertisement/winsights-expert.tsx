import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import {
  ExperienceWEBP,
  GreaterValueWEBP,
  ManagementWEBP,
  MoreWealthWEBP,
  OpportunityWEBP,
  Process1,
  Process2,
  Process3,
  Process4,
  Process5,
  ProcessArrowBottom,
  ProcessArrowLeft,
  ProcessArrowRight,
  SharingWEBP,
} from "./asset";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      padding: "16px 24px 73px",
    },
    title: {
      fontSize: "18px",
      color: "#333",
      fontWeight: 500,
      lineHeight: "26px",
    },
    subtitle: {
      fontSize: "14px",
      color: "#666",
      textAlign: "center",
    },
    content: {
      width: "100%",
      display: "flex",
      alignItems: "center",
    },
    img: {
      minWidth: "47px",
      maxWidth: "47px",
      minHeight: "47px",
      maxHeight: "47px",
    },
    contentTitle: {
      fontSize: "16px",
      color: "#333",
    },
    contentText: {
      fontSize: "14px",
      color: "#666",
    },
    processBox: {
      width: "100%",
      justifyContent: "space-between",
      alignItems: "center",
      display: "flex",
    },
    iconBox: {
      display: "flex",
      flexDirection: "column",
      justifyContent: "center",
      alignItems: "center",
      fontSize: 14,
      color: "#333",
    },
    processArrow: {
      width: 56,
      textAlign: "center",
      right: 0,
      position: "absolute",
      marginTop: 12,
    },
  }),
);

const WinsightsExpertComponent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  function contentItemLeft(img: string, text: string) {
    return (
      <Box className={classes.content}>
        <img src={img} className={classes.img} />
        <Box width={12} />
        <Typography className={classes.contentText}>{text}</Typography>
      </Box>
    );
  }

  function contentItemRight(img: string, title: string, subtitle: string) {
    return (
      <Box className={classes.content} style={{justifyContent: "space-between",}}>
        <Box>
          <Typography className={classes.contentTitle}>{title}</Typography>
          <Typography className={classes.contentText}>{subtitle}</Typography>
        </Box>
        <Box width={12} />
        <img src={img} className={classes.img} />
      </Box>
    );
  }

  function step1Section() {
    return (
      <>
        <Typography className={classes.title}>成为专家能获得什么</Typography>
        <Box height={8} />
        <Typography className={classes.subtitle}>充实自己，让知识增值</Typography>
        <Box height={8} />
        {contentItemLeft(MoreWealthWEBP, "您可以通过参与电话访谈、输出研究报告意见或参加会议活动，获得丰厚报酬")}
        <Box height={16} />
        {contentItemLeft(OpportunityWEBP, "与业内优秀人士双向交流，获得更多投资机遇及行业见解")}
        <Box height={16} />
        {contentItemLeft(GreaterValueWEBP, "完全自由的时间安排，让您的专业知识发挥更大的价值，同时建立个人品牌")}
      </>
    );
  }

  function step2Section() {
    return (
      <>
        <Typography className={classes.title}>适合人群</Typography>
        <Box height={8} />
        <Typography className={classes.subtitle}>有经验、有时间、愿分享的人士</Typography>
        <Box height={8} />
        {contentItemRight(ExperienceWEBP, "所在行业内 5 年以上经验", "某行业或专业领域积累了一定的经验")}
        <Box height={16} />
        {contentItemRight(ManagementWEBP, "管理岗或专业方向", "经理、总监、CEO...医生、教授、分析师...")}
        <Box height={16} />
        {contentItemRight(SharingWEBP, "愿意分享自己的知识经验", "对行业有自己的见解，愿意与他人分享")}
      </>
    );
  }

  function step3Section() {
    return (
      <>
        <Typography className={classes.title}>实施流程</Typography>
        <Box height={8} />
        <Typography className={classes.subtitle}>完善的服务流程，保障专家利益</Typography>
        <Box height={8} />
        <Box className={classes.processBox}>
          <Box className={classes.iconBox}>
            <Process1 fontSize={32} />
            成为专家
          </Box>
          <ProcessArrowRight fontSize={24} />
          <Box className={classes.iconBox}>
            <Process2 fontSize={32} />
            接到需求
          </Box>
          <ProcessArrowRight fontSize={24} />
          <Box className={classes.iconBox}>
            <Process3 fontSize={32} />
            完成项目
          </Box>
        </Box>
        <Box style={{ width: "100%", position: "relative", height: 32 }}>
          <Box className={classes.processArrow}>
            <ProcessArrowBottom fontSize={24} />
          </Box>
        </Box>
        <Box className={classes.processBox}>
          <Box className={classes.iconBox}>
            <Process5 fontSize={32} />
            回访跟进
          </Box>
          <ProcessArrowLeft fontSize={24} />
          <Box className={classes.iconBox}>
            <Process4 fontSize={32} />
            获得报酬
          </Box>
          <ProcessArrowLeft fontSize={24} />
          <Box width={56} />
        </Box>
      </>
    );
  }

  return (
    <Box className={classes.root}>
      {step1Section()}
      <Box height={40} />
      {step2Section()}
      <Box height={40} />
      {step3Section()}
    </Box>
  );
};

export default WinsightsExpertComponent;
