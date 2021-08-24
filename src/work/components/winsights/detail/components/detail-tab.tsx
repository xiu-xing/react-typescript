import { Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { isArray } from "lodash";
import React, { ReactNode, useState } from "react";
import { DetailSource } from "..";
import Header from "./header";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      maxWidth: 1348,
      margin: "auto",
      display: "flex",
      flexDirection: "column",
    },
    header: {
      display: "flex",
      flexDirection: "column",
      position: "sticky",
      top: 48,
      zIndex: 9,
      paddingTop: 20,
      backgroundColor: "white",
      paddingLeft: "16px",
    },
    audio: {
      marginBottom: "6px"
    },
    tabs: {
      display: "flex",
      alignItems: "center",
      marginTop: "14px",
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
    },
    svgRime: {
      marginTop: "2px",
      cursor: "pointer",
      color: "#CCC",
    },
  }),
);

interface TabsSectionProps {
  defaultActiveIndex?: number;
  tabs: string[];
  children: ReactNode[] | ReactNode;
  detail?: DetailSource;
};

const DetailTab: React.FunctionComponent<TabsSectionProps> = (props) => {
  const classes = useStyles();
  const { tabs, children, defaultActiveIndex, detail } = props;
  const [activeIndex, setActiveIndex] = useState(defaultActiveIndex || 0);

  return (
    <div className={classes.root}>
      <div className={classes.header}>
        <Header detail={detail}/>
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
              <div key={index} style={{ display: activeIndex === index ? "block" : "none" }}>
                {el}
              </div>
            );
          })
        ) : (
          <div style={{ display: "block" }}>{children}</div>
        )}
      </div>
    </div>
  );
};

export default DetailTab;
