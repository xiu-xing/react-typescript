import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Refresh } from "mdi-material-ui";
import { useRouter } from "next/dist/client/router";
import React, { ReactNode, useEffect, useMemo, useState } from "react";
import RiskManagementContainer from "../../riskManagementContainer";
import Toolbar from "../toolbar";
import BannerPNG from "./banner.png";
import RiskContent from "./components/risk-content";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    contentBox: {
      width: 1100,
      marginLeft: 6,
    },
    titleBox: {
      display: "flex",
      alignItems: "center",
    },
    title: {
      fontSize: 20,
      marginRight: 16,
      marginLeft: 8,
    },
    researchBox: {
      display: "flex",
      alignItems: "center",
      cursor: "pointer",
    },
    researchText: {
      fontSize: 14,
    },
    recommendationRoot: {
      maxWidth: "80%",
      margin: "auto",
    },
    banner: {
      width: 1096,
      height: 152,
      cursor: "pointer",
      marginLeft: 10,
    },
  }),
);

/**
 * 风控中间内容
 * | 我的机构和我的关注的中间部分
 */
const RiskPage: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const router = useRouter();

  const { riskType, group, setGroupDialogOpen } = RiskManagementContainer.useContainer();

  const defaultTitle: string | ReactNode = useMemo(() => {
    switch (riskType) {
      case "institution":
        return "我的机构·机构主体和基金";
      case "companies":
        return "我的机构·已投项目";
      case "fund-companies":
        return "我的机构·对外投资基金项目";
      default:
        return "风控";
    }
  }, [riskType, group]);
  const [title, setTitle] = useState<string | ReactNode>(defaultTitle);

  function contentComponent(): ReactNode {
    switch (riskType) {
      default:
        return <RiskContent />;
    }
  }

  useEffect(() => {
    if (group) {
      setTitle(`我的关注·${group.groupName}`);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [group]);

  return (
    <>
      <Toolbar
        title={
          <div className={classes.titleBox}>
            <Typography className={classes.title}>{title}</Typography>
            {riskType === "groups" && group && (
              <div
                className={classes.researchBox}
                onClick={(): void => {
                  setGroupDialogOpen(true);
                }}
              >
                <Refresh fontSize="small" color="primary" />
                <Typography className={classes.researchText} color="primary">
                  重新选择分组
                </Typography>
              </div>
            )}
          </div>
        }
      />
      <img src={BannerPNG} alt="" className={classes.banner} />
      <div className={classes.contentBox}>{contentComponent()}</div>
    </>
  );
};

export default RiskPage;
