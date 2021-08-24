import { createStyles, makeStyles } from "@material-ui/core/styles";
import { TabContext } from "@material-ui/lab";
import _ from "lodash";
import React, { useEffect, useMemo, useState } from "react";
import { Tab as TabModel } from "../../../generated/graphql";
import Tabs from "../../profile/content/tabs";
import TabPanel from "./tab-pannel";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: "100%",
      overflow: "hidden",
      flexGrow: 1,
    },
  }),
);

interface TabsContentProps {
  tabs: TabModel[];
}
interface Panel {
  id: string;
  component: JSX.Element | null;
  tab: TabModel;
}

const TabsContent: React.FunctionComponent<TabsContentProps> = (props) => {
  const classes = useStyles();
  const { tabs } = props;
  const [active, setActive] = useState<string>(tabs[0].id);
  const [hasMapFinish, setHasMapFinish] = useState(false);
  const handleTabChange = (newValue: string): void => setActive(newValue);
  const [panelMap, setPanelMap] = useState<Panel[]>([]);

  useEffect(() => {
    if (tabs) {
      tabs.length > 0 && setActive(tabs[0].id);
      const panelMap = tabs.map((tab, index) => {
        if (index === 0) {
          return {
            id: tab.id,
            component: <TabPanel tab={tabs[0]} key={tabs[0].id} />,
            tab: tab,
          };
        }
        return {
          id: tab.id,
          component: null,
          tab: tab,
        };
      });
      setPanelMap(panelMap);
    }
  }, [tabs]);

  useEffect(() => {
    if (hasMapFinish) return;

    const newPanelMap: Panel[] = _.clone(panelMap);

    for (const i in newPanelMap) {
      if (newPanelMap[i].id === active) {
        if (newPanelMap[i].component != null) return;
        newPanelMap[i].component = <TabPanel tab={newPanelMap[i].tab} key={newPanelMap[i].id} />;
        setPanelMap(newPanelMap);
      }
    }
    newPanelMap.length > 0 && setPanelMap(newPanelMap);

    if (newPanelMap.length > 0 && newPanelMap.every((item) => item.component != null)) {
      setHasMapFinish(true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [active]);

  const displayContent = useMemo(() => {
    return panelMap.map((item) => {
      return item.component;
    });
  }, [panelMap]);

  return (
    <div className={classes.root}>
      <TabContext value={active}>
        {tabs && (
          <>
            <Tabs tabs={tabs} onChange={handleTabChange} changeTop />
            {displayContent}
          </>
        )}
      </TabContext>
    </div>
  );
};

export default TabsContent;
