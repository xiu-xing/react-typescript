import { Box, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import nanoid from "nanoid";
import React, { ReactNode } from "react";
import {
  WinsightsItem1,
  WinsightsItem2,
  WinsightsItem3,
  WinsightsItem4,
  WinsightsItem5,
  WinsightsItem6,
  WinsightsItem7,
} from "./asset";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      padding: "16px 24px 40px",
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
      lineHeight: "24px",
      textAlign: "center",
    },
    box: {
      width: "100%",
      display: "flex",
      border: "1px solid #EEE",
      borderRadius: "4px",
    },
    rect: {
      minWidth: "108px",
      height: "92px",
      background: theme.palette.primary.main,
      display: "flex",
      flexDirection: "column",
      justifyContent: "center",
      alignItems: "center",
      color: "#FFF",
      fontSize: "16px",
      fontWeight: 500,
    },
    leftTriangle: {
      width: "15px",
      height: "92px",
      borderLeft: "15px solid #4F709B",
      borderTop: "46px solid transparent",
      borderBottom: "46px solid transparent",
    },
    rightTriangle: {
      width: "15px",
      height: "92px",
      borderRight: "15px solid #4F709B",
      borderTop: "46px solid transparent",
      borderBottom: "46px solid transparent",
    },
    content: {
      width: "100%",
      display: "flex",
      flexDirection: "column",
      alignItems: "start",
      justifyContent: "center",
      marginLeft: "16px",
      paddingRight: "12px",
    },
    contentText: {
      fontSize: "14px",
      color: "#666",
      lineHeight: "24px",
      textAlign: "start",
    },
    icon: {
      fontSize: "30px",
      marginBottom: "6px",
    },
  }),
);

const WinsightsDemandComponent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  function leftPentagonItem(icon: ReactNode, text: string, content: string[]) {
    return (
      <Box className={classes.box}>
        <Box className={classes.rect}>
          {icon} {text}
        </Box>
        <div className={classes.leftTriangle} />
        <Box className={classes.content}>
          {content.map((v) => (
            <Typography className={classes.contentText} key={nanoid(8)}>
              {v}
            </Typography>
          ))}
        </Box>
      </Box>
    );
  }

  function rightPentagonItem(icon: ReactNode, text: string, content: string[]) {
    return (
      <Box className={classes.box}>
        <Box className={classes.content} style={{paddingLeft: 10}}>
          {content.map((v) => (
            <Typography className={classes.contentText} key={nanoid(8)}>
              {v}
            </Typography>
          ))}
        </Box>
        <div className={classes.rightTriangle} />
        <Box className={classes.rect}>
          {icon} {text}
        </Box>
      </Box>
    );
  }

  return (
    <Box className={classes.root}>
      <Typography className={classes.title}>服务内容</Typography>
      <Box height={8} />
      <Typography className={classes.subtitle}>
        我们为金融机构、企业、咨询公司等多元化的客户群提供专家知识共享服务
      </Typography>
      <Box height={24} />
      {leftPentagonItem(<WinsightsItem1 className={classes.icon} />, "电话访谈", [
        "一对一的交流平台",
        "多对一的专业顾问团队",
        "享受一站式的知识共享服务",
      ])}
      <Box height={32} />
      {rightPentagonItem(<WinsightsItem2 className={classes.icon} />, "定制咨询", [
        "量身定制的解决方案",
        "短时间内精准匹配专家",
        "提供具有商业价值的信息",
      ])}
      <Box height={32} />
      {leftPentagonItem(<WinsightsItem3 className={classes.icon} />, "极速响应", [
        "200+ 行业细分领域",
        "8,000,000+ 优秀人才",
        "10,000+ 网络会议分享",
      ])}
      <Box height={40} />
      <Typography className={classes.title}>服务优势</Typography>
      <Box height={24} />
      {leftPentagonItem(<WinsightsItem4 className={classes.icon} />, "资源差异", [
        "丰富的专家资源，重点覆盖医疗、 金融、TMT、消费、工业自动化等行业",
      ])}
      <Box height={32} />
      {rightPentagonItem(<WinsightsItem5 className={classes.icon} />, "价格更优", [
        "一站式的服务，更优惠的价格，致力于为您解决行业问题",
      ])}
      <Box height={32} />
      {leftPentagonItem(<WinsightsItem6 className={classes.icon} />, "极速响应", [
        "7*24*365全天候服务，运用大数据快速精准匹配专家定制解决方案",
      ])}
      <Box height={32} />
      {rightPentagonItem(<WinsightsItem7 className={classes.icon} />, "专业平台", [
        "坚持创新理念，从人工服务升级为系统化、智能化服务",
      ])}
    </Box>
  );
};

export default WinsightsDemandComponent;
