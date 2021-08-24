import { Tab, Tabs, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import React, { useEffect, useState } from "react";
import AppContainer, { FixedTopStyleProps } from "../../../../../containers/appContainer";
import { NewsType } from "../../../../../models/news/news";
import NewsContainer from "../../../newsContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "sticky",
      zIndex: 1,
      top: ({ fixedTopHeight }: FixedTopStyleProps): number => fixedTopHeight,
      backgroundColor: "#fff",
    },
    toolbarBox: {
      width: 746,
      paddingTop: 24,
      borderBottom: "1px solid #EEE",
    },
    scrollToolBarBox: {
      borderBottom: "none",
    },

    shadow: {
      boxShadow: "4px 1px 4px 0px rgba(0, 0, 0, 0.2)",
    },

    chipRoot: {
      margin: 5,
      padding: "0 8px",
      fontSize: 14,
      border: "none",
      color: "#333",
      background: "rgba(102, 140, 157, 0.14)",
    },
    chipDeleteIcon: {
      color: theme.palette.primary.main,
    },
    buttonContainerBox: {
      height: "100%",
      position: "relative",
    },
    buttonBox: {
      position: "absolute",
      bottom: 0,
    },
    expandedContainer: {
      display: "grid",
      gridTemplateColumns: "1fr 64px",
      gridTemplateRows: "auto",
      paddingTop: 6,
    },
    button: {
      minWidth: "6rem",
      margin: 12,
    },
    tabRoot: {
      minWidth: "2rem",
      height: 38,
      fontSize: 14,
    },
    selected: {
      color: theme.palette.primary.main,
      fontSize: 14,
    },
  }),
);

const institutionTabListConfig = [
  {
    label: "全部",
    value: "institution-all",
  },
  {
    label: "我的机构",
    value: "me",
  },
  {
    label: "同行机构",
    value: "competitor",
  },
  {
    label: "已投项目",
    value: "invested-project",
  },
  {
    label: "对外投资基金项目",
    value: "fund-project",
  },
  {
    label: "LP",
    value: "limited-partner",
  },
];

const followTabListConfig = [
  {
    label: "全部",
    value: "all",
  },
  {
    label: "赛道",
    value: "vertical",
  },
  {
    label: "公司",
    value: "company",
  },
  {
    label: "人物",
    value: "person",
  },
];
type ConfigObject = {
  label: string;
  value: string;
};
function a11yProps(index: string): { id: string; value: string; "aria-controls": string } {
  return {
    id: index,
    value: index,
    "aria-controls": `news-institution-tabpanel-${index}`,
  };
}

const NewsTabs: React.FunctionComponent = () => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const muse = useClient();
  const classes = useStyles({ fixedTopHeight });
  const { newsType, setTabID } = NewsContainer.useContainer();
  const [show, setShow] = useState(false);

  const configs = newsType === NewsType.MyInstitution ? institutionTabListConfig : [];
  const [value, setValue] = useState<string>(configs[0]?.value ?? "");

  useEffect(() => {
    setTabID(value ? value : undefined);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [value]);

  useEffect(() => {
    if (newsType === NewsType.All) {
      setShow(false);
      return;
    }
    setShow(true);
    setValue(configs[0].value);
  }, [configs, newsType]);

  const handleChange = (_: React.ChangeEvent<{}>, newValue: string): void => {
    if (newsType == NewsType.MyInstitution) {
      muse.sendTrackingEvent("news.my_institution_tab_change", {
        tab: newValue,
      });
    }
    setValue(newValue);
  };

  return show ? (
    <Tabs indicatorColor="primary" value={value} onChange={handleChange} aria-label="news tabs">
      {configs.map((config) => (
        <Tab
          key={config.value}
          classes={{ root: classes.tabRoot, selected: classes.selected }}
          label={config.label}
          {...a11yProps(config.value)}
        />
      ))}
    </Tabs>
  ) : null;
};

export default NewsTabs;
