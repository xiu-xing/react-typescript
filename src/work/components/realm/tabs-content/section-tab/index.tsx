import { createStyles, makeStyles } from "@material-ui/core";
import { useTabContext } from "@material-ui/lab";
import clsx from "clsx";
import React, { useEffect, useState } from "react";
import SimpleBar from "simplebar-react";
import { Section, SectionedDisplayTab, useRealmTabSectionsQuery } from "../../../../generated/graphql";
import { useTabIndex } from "../../../profile/atoms";
import AdvancedSearchContainer from "../../container";
import Sections from "./sections";

const useStyles = makeStyles(() =>
  createStyles({
    simplebar: {
      height: "100%",
    },
  }),
);

interface SectionTabProp {
  tab: SectionedDisplayTab;
}

const SectionTab: React.FunctionComponent<SectionTabProp> = (props) => {
  const { tab } = props;
  const classes = useStyles();
  const [sections, setSections] = useState<Section[]>([]);
  const { realm } = AdvancedSearchContainer.useContainer();
  const tabContext = useTabContext();
  const [, setTab] = useTabIndex();

  const [realmTabSectionsResult] = useRealmTabSectionsQuery({
    variables: {
      realmID: realm,
      tabID: tab.id,
    },
  });

  useEffect(() => {
    const data = realmTabSectionsResult.data?.realmTabSections;

    if (data && data.length) {
      setSections(data as Section[]);
    }
  }, [realmTabSectionsResult]);

  useEffect(() => {
    setTab(tabContext?.value ?? "");
  }, [setTab, tabContext]);

  return sections && sections.length > 0 ? (
    <SimpleBar className={clsx(classes.simplebar)}>
      <Sections sections={sections} />
    </SimpleBar>
  ) : null;
};
export default SectionTab;
