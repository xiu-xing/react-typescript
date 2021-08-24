import { Box, Button, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { isArray } from "lodash";
import React, { ReactNode, useState } from "react";
import AppContainer from "../../../containers/appContainer";
import Space from "../../common/space";
import { Recommend, Information, User } from "../assets";
import BecomeExpert from "../form/become-expert";
import DemandContent from "../form/demand-content";
import RecommendExpert from "../form/recommend-expert";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      // maxWidth: 1348,
      margin: "auto",
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
    },
    header: {
      display: "flex",
      flexDirection: "column",
      position: "sticky",
      top: 48,
      zIndex: 9,
      paddingTop: 24,
      backgroundColor: "white",
      paddingLeft: "16px",
      paddingRight: "16px",
      maxWidth: 1348,
      width: "100%",
    },
    head: {
      display: "flex",
      alignItems: "center",
      justifyContent: "space-between",
    },
    title: {
      fontSize: 20,
      color: "#333333",
      whiteSpace: "nowrap",
    },
    btn: {
      color: theme.palette.primary.main,
      backgroundColor: "white",
      border: "none",
      whiteSpace: "pre",
    },
    icon: {
      width: "16px",
      height: "16px",
    },
    tabs: {
      display: "flex",
      alignItems: "center",
      marginTop: "8px",
    },
    tab: {
      fontSize: 14,
      fontWeight: 500,
      color: "#666666",
      padding: "8px 4px",
      cursor: "pointer",
      marginRight: "40px",
      userSelect: "none",
      borderBottom: "2px solid white",
    },
    activeTab: {
      color: theme.palette.primary.main,
      borderBottom: "2px solid",
    },
    content: {
      marginTop: "16px",
      height: "calc(100vh - 171px)",
      width: "100%",
    },
    svgRime: {
      marginTop: "2px",
      cursor: "pointer",
      color: "#CCC",
    },
  }),
);

interface TabsSectionProps {
  title: string;
  defaultActiveIndex?: number;
  tabs: string[];
  children: ReactNode[] | ReactNode;
}

const TabsSection: React.FunctionComponent<TabsSectionProps> = (props) => {
  const classes = useStyles();
  const { showDialog } = AppContainer.useContainer();
  const { title, tabs, children, defaultActiveIndex } = props;
  const [activeIndex, setActiveIndex] = useState(defaultActiveIndex || 0);

  return (
    <div className={classes.root}>
      <div className={classes.header}>
        <Box className={classes.head}>
          <Typography className={classes.title}>{title}</Typography>
          <Space size={"middle"}>
            <Button
              className={classes.btn}
              startIcon={<Information className={classes.icon} />}
              onClick={() => {
                showDialog({
                  fullWidth: true,
                  maxWidth: "sm",
                  children: <DemandContent />,
                });
              }}
            >
              提交需求
            </Button>
            <Button
              className={classes.btn}
              startIcon={<User className={classes.icon} />}
              onClick={() => {
                showDialog({
                  fullWidth: true,
                  maxWidth: "sm",
                  children: <BecomeExpert />,
                });
              }}
            >
              成为专家
            </Button>
            <Button
              className={classes.btn}
              startIcon={<Recommend className={classes.icon} />}
              onClick={() => {
                showDialog({
                  fullWidth: true,
                  maxWidth: "sm",
                  children: <RecommendExpert />,
                });
              }}
            >
              推荐专家
            </Button>
          </Space>
        </Box>
        <div className={classes.tabs}>
          {tabs.map((name, index) => {
            return (
              <React.Fragment key={index}>
                <Typography
                  key={index}
                  className={clsx(classes.tab, activeIndex === index ? classes.activeTab : undefined)}
                  onClick={(): void => {
                    setActiveIndex(index);
                  }}
                >
                  {name}
                </Typography>
              </React.Fragment>
            );
          })}
        </div>
      </div>
      <div className={classes.content}>
        {children && isArray(children) ? (
          children.map((el, index) => {
            return (
              <div key={index} style={{ display: activeIndex === index ? "block" : "none", height: "100%" }}>
                {el}
              </div>
            );
          })
        ) : (
          <div style={{ display: "block", height: "100%" }}>{children}</div>
        )}
      </div>
    </div>
  );
};

export default TabsSection;
