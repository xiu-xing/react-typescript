import { Button, Collapse, createStyles, IconButton, makeStyles, Theme } from "@material-ui/core";
import clsx from "clsx";
import { ChevronDown, ChevronUp } from "mdi-material-ui";
import React, { useState } from "react";
import NewsContainer from "../../../newsContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    tagsRoot: {
      display: "grid",
      gridTemplateColumns: "1fr 25px",
      gridTemplateRows: "auto",
      marginBottom: 12,
      marginLeft: 16,
    },
    tagButton: {
      margin: "4px 2px",
      padding: "4px 12px",
      boxShadow: "none",
    },
    activeButton: {
      background: theme.palette.primary.main,
      "&:hover": {
        background: theme.palette.primary.main,
      },
    },
    moreButton: {
      marginTop: "8px",
      height: "25px",
      width: "25px",
      padding: 0,
    },
    tagText: {
      fontWeight: 400,
      lineHeight: "24px",
      boxShadow: "none",
    },
  }),
);

const DefaultTags = [
  { title: "全部", code: undefined },
  { title: "投资融资", code: "2050214000" },
  { title: "收购重组", code: "2050214001" },
  { title: "基金募集", code: "2050214002" },
  { title: "排行榜单", code: "2050214100" },
  { title: "行业分析", code: "2050214150" },
  { title: "行业政策", code: "2050214200" },
  { title: "投资人观点", code: "2050214251" },
  { title: "创业者观点", code: "2050214252" },
  { title: "人物介绍", code: "2050214300" },
  { title: "人事变动", code: "2050214450" },
  { title: "产品发布", code: "2050214351" },
  { title: "产品介绍", code: "2050214352" },
  { title: "路演项目", code: "2050214400" },
  { title: "财务报告", code: "2050214500" },
  { title: "大公司", code: "2050214650" },
  { title: "机构介绍", code: "2050214700" },
  { title: "会议论坛", code: "2050214750" },
  { title: "早期项目", code: "2050214601" },
  { title: "竞争合作", code: "2050214800" },
  { title: "股市行情", code: "2050214901" },
  { title: "股权变动", code: "2050214902" },
  { title: "股权质押", code: "2050214903" },
];

const Tags: React.FunctionComponent = () => {
  const classes = useStyles();
  const { setTags } = NewsContainer.useContainer();
  const [selectedTagIndex, setSelectedTagIndex] = useState<number>(0);
  const [collapse, setCollapse] = useState<boolean>(false);

  return (
    <div className={classes.tagsRoot}>
      <Collapse in={collapse} collapsedHeight={42}>
        {DefaultTags.map((tag, index) => (
          <Button
            className={clsx(classes.tagButton, selectedTagIndex === index && classes.activeButton)}
            key={index}
            variant={selectedTagIndex === index ? "contained" : undefined}
            color={selectedTagIndex === index ? "primary" : undefined}
            onClick={(): void => {
              setSelectedTagIndex(index);
              setTags(tag.code ? [tag.code] : []);
            }}
          >
            <span className={classes.tagText}>{tag.title}</span>
          </Button>
        ))}
      </Collapse>
      <IconButton
        className={classes.moreButton}
        onClick={(): void => {
          setCollapse((old) => !old);
        }}
      >
        {collapse ? <ChevronUp /> : <ChevronDown />}
      </IconButton>
    </div>
  );
};

export default Tags;
