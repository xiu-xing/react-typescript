import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useTabContext } from "@material-ui/lab";
import clsx from "clsx";
import React, { useMemo } from "react";
import { Tab } from "../../../generated/graphql";
import { getLockLimit } from "../../../utils/permission";
import CommonGridContainer from "../../common/common-grid-components/grid/container";
import InfoFlowTab from "../../profile/content/tab-panel/info-flow-tab";
import LockedTab from "../../profile/content/tab-panel/locked-tab";
import RealmGridChartTab from "./realm-grid-chart-tab";
import GridTabContainer from "./realm-grid-chart-tab/container";
import SectionTab from "./section-tab";

// import SectionTab from "../section-tab";
// import SheetChart from "../sheet-chart";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      height: "calc(100% - 46px)",
    },
    simplebar: {
      height: `100%`,
    },
  }),
);

interface TabPanelProps {
  tab: Tab;
}

const TabPanel: React.FunctionComponent<TabPanelProps> = (props) => {
  const { tab } = props;
  const classes = useStyles();
  const tabContext = useTabContext();

  const tabContent = useMemo(() => {
    switch (tab.__typename) {
      case "SectionedDisplayTab":
        return <SectionTab tab={tab} />;
      case "InfoFlowTab":
        return <InfoFlowTab tab={tab} />;
      case "SheetTab":
        return (
          <GridTabContainer.Provider>
            <CommonGridContainer.Provider>
              <RealmGridChartTab tab={tab} />
            </CommonGridContainer.Provider>
          </GridTabContainer.Provider>
        );
    }
  }, [tab]);

  return (
    <div className={clsx(classes.root)} hidden={tab.id !== tabContext?.value}>
      {getLockLimit(tab.permissions) ? <LockedTab /> : tabContent}
    </div>
  );
};

export default TabPanel;
