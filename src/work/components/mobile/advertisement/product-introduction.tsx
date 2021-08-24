import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { adshAdPNG, detectionAdPNG, hardTechAdPNG, verticalBuilderAdPNG } from "./asset";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "16px 24px",
      height: "100%",
      overflowY: "scroll",
    },
    title: {
      fontSize: 18,
      color: "#333",
      fontWeight: 500,
      marginBottom: 4,
    },
    rightAlignTitle: {
      fontSize: 18,
      color: "#333",
      fontWeight: 500,
      marginBottom: 4,
      textAlign: "right",
    },
    subtitle: {
      fontSize: 14,
      color: "#666",
      fontWeight: 400,
      marginBottom: 8,
    },
   
    image: {
      width: "100%",
      marginBottom: 16,
    },
  }),
);

const ProductIntroductionAdvertisement: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  return (
    <Box className={classes.root}>
      <Typography className={classes.title}>高级搜索</Typography>
      <Typography className={classes.subtitle}>多样的指标数据，独家互动图表功能，统计图表一键生成</Typography>
      <img src={adshAdPNG as string} alt="" className={classes.image} />
      <Typography className={classes.rightAlignTitle}>追踪</Typography>
      <Typography className={classes.subtitle}>项目、机构、行业动态全掌握，自定义标签高效分类管理分类</Typography>
      <img src={detectionAdPNG as string} alt="" className={classes.image} />
      <Typography className={classes.title}>硬科技赛道</Typography>
      <Typography className={classes.subtitle}>
      赛道，独家整理完整的硬科技赛道谱系，纵览新技术发展与布局
      </Typography>
      <img src={verticalBuilderAdPNG as string} alt="" className={classes.image} />
      <Typography className={classes.rightAlignTitle}>自定义赛道</Typography>
      <Typography className={classes.subtitle}>
      跨越行业分类界限，自定义新领域，探索新概念，洞见新趋势
      </Typography>
      <img src={hardTechAdPNG as string} alt="" className={classes.image} />
    </Box>
  );
};

export default ProductIntroductionAdvertisement;
