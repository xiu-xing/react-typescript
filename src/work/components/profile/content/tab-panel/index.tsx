import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useTabContext } from "@material-ui/lab";
import React, { useEffect, useMemo, useState } from "react";
import { Tab } from "../../../../generated/graphql";
import { getLockLimit } from "../../../../utils/permission";
import InfoFlowTab from "./info-flow-tab";
import LockedTab from "./locked-tab";
import SectionTab from "./section-tab";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
  }),
);

interface TabPanelProp {
  tab: Tab;
}

const TabPanel: React.FunctionComponent<TabPanelProp> = (props) => {
  const classes = useStyles();
  const [hasRender, setHasRender] = useState(false);
  const tabContext = useTabContext();
  const { tab } = props;

  useEffect(() => {
    if (tab?.id === tabContext?.value && !hasRender) {
      setHasRender(true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tabContext?.value]);

  const tabContent = useMemo(
    () => {
      switch (tab?.__typename) {
        case "SectionedDisplayTab":
          return <SectionTab tab={tab} />;
        case "InfoFlowTab":
          return <InfoFlowTab tab={tab} />;
      }
    },
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [tab],
  );

  if (hasRender && tab) {
    return (
      <div className={classes.root} hidden={tab.id !== tabContext?.value}>
        {getLockLimit(tab.permissions) ? <LockedTab /> : tabContent}
      </div>
    );
  } else {
    return null;
  }
};

export default TabPanel;
