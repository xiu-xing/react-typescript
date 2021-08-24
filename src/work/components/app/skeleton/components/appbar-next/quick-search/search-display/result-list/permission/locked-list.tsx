import { Box, createStyles, makeStyles, Theme, Typography } from "@material-ui/core";
import nanoid from "nanoid";
import React, { ReactNode } from "react";
import { QuickSearchTag } from "../../../../../../../../../generated/graphql";
import ContactInformation from "../../../../../../../../common/contact-information";
import { Logo } from "../../../../../../../../profile/content/tab-panel/assets";
import { EntityLayout } from "../result-item";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      filter: "blur(2px)",
      display: "flex",
      opacity: 0.5,
      overflow: "hidden",
      alignItems: "center",
      userSelect: "none",
      flexDirection: "column",
    },
    contentRoot: {
      top: 0,
      width: "100%",
      bottom: 0,
      height: "100vh",
      display: "flex",
      zIndex: 998,
      position: "absolute",
      alignItems: "center",
      justifyContent: "center",
    },
    content: {
      position: "absolute",
      width: 480,
      backgroundColor: "#fff",
      boxShadow:
        "0px 1px 8px 0px rgba(0, 0, 0, 0.2), 0px 3px 3px -2px rgba(0, 0, 0, 0.12), 0px 3px 4px 0px rgba(0, 0, 0, 0.14)",
    },
    title: {
      backgroundColor: theme.palette.primary.main,
      color: "white",
      height: 60,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    description: {
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: 500,
      color: theme.palette.grey[800],
    },
    subDescription: {
      margin: "4px 0 16px 0",
      fontSize: 16,
      lineHeight: "24px",
      color: "#737373",
      fontWeight: 400,
    },
  }),
);

export const LockedList: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const fakerTag: QuickSearchTag = {
    __typename: "QuickSearchTag",
    icon: "",
    nameType: "其他名称",
    matchedName: "有限责任公司",
  };
  const fakerResult = {
    title: "有限责任公司",
    subtitle: "2010-03-03",
    description: "有限责任公司成立于2010年3月3日",
    tags: [fakerTag, fakerTag],
  };
  const fakerList = [
    fakerResult,
    fakerResult,
    fakerResult,
    fakerResult,
    fakerResult,
    fakerResult,
    fakerResult,
    fakerResult,
  ];

  function locked(): ReactNode {
    return (
      <div className={classes.contentRoot}>
        <div className={classes.content}>
          <div className={classes.title}>
            <Logo />
          </div>
          <Box paddingX="32px" paddingY="24px">
            <Typography className={classes.description}>添加下方客服微信，购买正式账号</Typography>
            <Typography className={classes.subDescription}>
              Rime Data 拥有丰富的一级市场研究数据，助您全面掌握市场新动态
            </Typography>
            <ContactInformation />
          </Box>
        </div>
      </div>
    );
  }

  return (
    <>
      {locked()}
      <div className={classes.root}>
        {fakerList.map((value) => (
          <EntityLayout
            key={nanoid(8)}
            title={value.title}
            subtitle={value.subtitle}
            description={value.description}
            tags={value.tags}
          />
        ))}
      </div>
    </>
  );
};
