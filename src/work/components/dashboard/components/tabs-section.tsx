import { Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { isArray } from "lodash";
import { Lock } from "mdi-material-ui";
import React, { ReactNode, useState } from "react";
import UserContainer from "../../../containers/userContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
    },
    bar: {
      display: "flex",
      alignItems: "center",
    },
    tabs: {
      display: "flex",
      alignItems: "center",
    },
    tab: {
      fontSize: 14,
      color: "#999",
      padding: 4,
      cursor: "pointer",
      marginLeft: 28,
      userSelect: "none",
    },
    activeTab: {
      color: theme.palette.primary.main,
      fontWeight: 500,
    },
    title: {
      fontSize: 20,
      color: "#5F6368",
      margin: "12px 8px",
    },
    content: {},
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
  disableItemIndex?: number;
}

const TabsSection: React.FunctionComponent<TabsSectionProps> = (props) => {
  const classes = useStyles();
  const { title, tabs, children, defaultActiveIndex, disableItemIndex } = props;
  const [activeIndex, setActiveIndex] = useState(defaultActiveIndex || 0);
  const { setInstitutionAuthenticationDialog } = UserContainer.useContainer();

  return (
    <div className={classes.root}>
      <div className={classes.bar}>
        <Typography className={classes.title}>{title}</Typography>
        <div className={classes.tabs}>
          {tabs.map((name, index) => {
            return (
              <React.Fragment key={index}>
                <Typography
                  key={index}
                  className={clsx(classes.tab, activeIndex === index ? classes.activeTab : undefined)}
                  onClick={(): void => {
                    if (disableItemIndex == index) {
                      setInstitutionAuthenticationDialog(true);
                    } else {
                      setActiveIndex(index);
                    }
                  }}
                >
                  {name}
                </Typography>
                {disableItemIndex == index ? <Lock className={classes.svgRime} /> : null}
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

export default TabsSection;
