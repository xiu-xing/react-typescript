import { Box, createStyles, makeStyles, Theme } from "@material-ui/core";
import WinsightsLogo from "../assets/logo.png";
import Typography from "@material-ui/core/Typography";
import Card from "./components/card";
import React from "react";
import { Tel, Consult, Activity, PlatForm, Response, Price, Differ } from "../assets";
import SimpleBar from "simplebar-react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "0 60px",
    },
    header: {
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      marginBottom: "80px",
    },
    logo: {
      marginBottom: "4px",
    },
    subTitle: {
      fontSize: 16,
      fontFamily: "NotoSansSC-Medium, NotoSansSC",
      fontWeight: 500,
      color: "#737373",
      textAlign: "center",
      marginTop: "16px",
    },
    title: {
      fontSize: 20,
      fontWeight: 500,
      color: "#333333",
      fontFamily: "NotoSansSC-Medium, NotoSansSC",
    },
    body: {
      display: "flex",
      flexWrap:"wrap",
      justifyContent:"center",
      marginTop: "52px",
    },
    footer: {
      display: "flex",
      flexWrap:"wrap",
      justifyContent:"center",
      textAlign: "center",
      marginTop: "40px",
    },
    more: {
      fontSize: 16,
      fontWeight: 500,
      color: theme.palette.primary.main,
      cursor: "pointer",
    },
  }),
);
const AboutUs: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  return (
    <SimpleBar style={{ height: "100%" }}>
      <Box width="100%" display="flex" justifyContent="center" className={classes.root}>
        <Box maxWidth={1348} width={"100%"}>
          <Box className={classes.header}>
            <img src={WinsightsLogo} className={classes.logo} />
            <Typography className={classes.subTitle}>
              来觅战略合作伙伴万盛专家是一个以专家为核心的全新知识分享平台，公司总部位于上海陆家嘴金融中心。我们拥有200多个细分领域，8,000,000余位各行业优秀人才，他们遍布医疗、金融、TMT、消费、交运、能源、化工、教育、信息技术、工业自动化等行业。我们的客户覆盖全球金融机构、管理咨询公司、企业等，我们的服务包括一手的信息、数据等，致力于提供优质的行业洞察，辅助客户通过高效便捷的方式获取行业知识以做出明智的决策。
            </Typography>
            <Typography className={classes.more} onClick={()=>{
              window.open("https://winsights.com.cn/Wins.Expert.H5/home/introduction.html")
            }}>了解更多</Typography>
          </Box>
          <Box className={classes.header}>
            <Typography className={classes.title}>服务内容</Typography>
            <Typography className={classes.subTitle}>
              我们为金融机构、企业、咨询公司等多元化的客户群提供专家知识共享服务
            </Typography>
            <Box className={classes.body}>
              <Card
                title="电话访谈"
                subtitle={["一对一的交流平台", "多对一的专业顾问团队", "享受一站式的知识共享服务"]}
              >
                <Tel style={{ fontSize: 40 }} />
              </Card>
              <Card
                title="定制咨询"
                subtitle={["量身定制的解决方案", "短时间内精准匹配专家", "提供具有商业价值的信息"]}
              >
                <Consult style={{ fontSize: 40 }} />
              </Card>
              <Card title="会议活动" subtitle={["200+ 行业细分领域", "8,000,000+ 优秀人才", "10,000+ 网络会议分享"]}>
                <Activity style={{ fontSize: 40 }} />
              </Card>
            </Box>
          </Box>
          <Box className={classes.header}>
            <Typography className={classes.title}>服务优势</Typography>
            <Box className={classes.footer}>
              <Card title="资源差异" subtitle={["丰富的专家资源，重点覆盖医疗、 金融、TMT、消费、工业自动化等行业"]}>
                <Differ style={{ fontSize: 40 }} />
              </Card>
              <Card title="价格更优" subtitle={["一站式的服务，更优惠的价格，致力于为您解决行业问题"]}>
                <Price style={{ fontSize: 40 }} />
              </Card>
              <Card title="极速响应" subtitle={["7*24*365全天候服务，运用大数据快速精准匹配专家定制解决方案"]}>
                <Response style={{ fontSize: 40 }} />
              </Card>
              <Card title="专业平台" subtitle={["坚持创新理念，从人工服务升级为系统化、智能化服务"]}>
                <PlatForm style={{ fontSize: 40 }} />
              </Card>
            </Box>
          </Box>
        </Box>
      </Box>
    </SimpleBar>
  );
};

export default AboutUs;
