import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useTabContext } from "@material-ui/lab";
import clsx from "clsx";
import React, { useMemo } from "react";
import { Tab, TrealmImportType } from "../../../generated/graphql";
import { getLockLimit } from "../../../utils/permission";
import CommonGridContainer from "../../common/common-grid-components/grid/container";
import LockedTab from "../../profile/content/tab-panel/locked-tab";
import InstitutionGridTab from "./grid-tab";
import InstitutionGridTabContainer from "./grid-tab/container";

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
      case "SheetTab": {
        let importType: TrealmImportType | undefined = undefined;
        if (tab.payloads) importType = tab.payloads["ImportType"] as TrealmImportType;

        return (
          <InstitutionGridTabContainer.Provider initialState={{ sheetId: tab.id, importType: importType }}>
            <CommonGridContainer.Provider>
              <InstitutionGridTab tab={tab} />
            </CommonGridContainer.Provider>
          </InstitutionGridTabContainer.Provider>
        );
      }
      default:
        return <>Error! Nonsupport Tab</>;
    }
  }, [tab]);

  return (
    <div className={clsx(classes.root)} hidden={tab.id !== tabContext?.value}>
      {getLockLimit(tab.permissions) ? <LockedTab /> : tabContent}
    </div>
  );
};

export default TabPanel;
