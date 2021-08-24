import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import RightsGrid from "./grid";
import {
  Grid as DxGrid,
  Table as DxTable,
  TableHeaderRow as DxTableHeaderRow,
} from "@devexpress/dx-react-grid-material-ui";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    content: {
      padding: "16px 24px",
    },
    title: {
      fontSize: 18,
      color: "#333",
      fontFamily: "NotoSansSC-Medium, NotoSansSC",
      fontWeight: 500,
      marginBottom: 16,
    },
  }),
);

const RightsAdvertisement: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const columns = [
    { name: "product", title: "项目", minWidth: 50, align: "left", width: "46%" },
    { name: "free", title: "免费版", minWidth: 40, align: "center", icon: true, width: "27%" },
    { name: "personal", title: "机构版", minWidth: 40, align: "center", icon: true, width: "27%" },
  ];

  const titleData = ["海量数据", "检索分析", "研报", "洞察", "追踪", "专属线下服务"];
  const rowData = [
    [
      {
        "product": "项目企业、上市企业、投资机构、基金、基金管理人、LP、企业家、投资人、行业赛道",
        "free": "部分",
        "personal": "check",
      },
      { "product": "私募融资、并购事件、IPO事件、股权转让、战略融资、定向增发", "free": "部分", "personal": "check" },
      { "product": "工商注册、基协备案、发明专利、新闻资讯、风险舆情", "free": "部分", "personal": "check" },
    ],
    [
      { "product": "快速搜索", "free": "check", "personal": "check" },
      { "product": "高级搜索", "free": "部分", "personal": "check" },
    ],
    [
      { "product": "研究报告", "free": "部分", "personal": "check" },
      { "product": "报告图表", "free": "部分", "personal": "check" },
      { "product": "查看原文", "free": "close", "personal": "60 次/日" },
    ],
    [
      { "product": "风口赛道", "free": "check", "personal": "check" },
      { "product": "硬科技赛道", "free": "close", "personal": "check" },
    ],
    [
      { "product": "项目追踪", "free": "10 家", "personal": "check" },
      { "product": "机构追踪", "free": "10 家", "personal": "check" },
      { "product": "行业追踪", "free": "10 家", "personal": "check" },
    ],
    [
      { "product": "专家咨询服务", "free": "close", "personal": "check" },
      { "product": "研报撰写服务", "free": "close", "personal": "check" },
      { "product": "数据技术服务", "free": "close", "personal": "check" },
    ],
  ];

  return (
    <Box className={classes.root}>
      {titleData.map((item, index) => {
        return (
          <Box className={classes.content} key={index}>
            <Typography className={classes.title}>{item}</Typography>
            <RightsGrid
              rows={rowData[index]}
              columns={columns}
              columnExtensions={columns.map((c) => ({
                columnName: c.name,
                align: c.align as DxTable.ColumnExtension["align"],
                width: c.width,
              }))}
            />
          </Box>
        );
      })}
    </Box>
  );
};

export default RightsAdvertisement;
