import { Box, Tab as MUITab, Tabs as MUITabs } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { useAtom } from "jotai";
import _ from "lodash";
import React, { useEffect, useState } from "react";
import { useClient } from "urql";
import {
  Filter as FilterModel,
  ListDocument,
  ListQuery,
  ListQueryVariables,
  Section,
} from "../../../generated/graphql";
import Filter from "./filter";
import SectionWrapper from "./section-wrapper";
import {
  countMapAtom,
  subProfileAtom,
  subProfileEntityAtom,
  subProfileTabActiveIndexAtom,
  useFilterInputs,
} from "./states";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    tabs: {
      // borderBottom: "1px solid #EEE",
    },
    tabIndicator: {
      display: "flex",
      justifyContent: "center",
      backgroundColor: "transparent",
      "& > span": {
        maxWidth: 16,
        width: "100%",
        backgroundColor: theme.palette.primary.main,
      },
    },
    tab: {
      padding: "6px 16px",
    },
  }),
);

const Tabs: React.FC = () => {
  const classes = useStyles();
  const client = useClient();
  const [subProfileState] = useAtom(subProfileAtom);
  const [subProfileEntity] = useAtom(subProfileEntityAtom);
  const [countMap, setCountMap] = useAtom(countMapAtom);

  const [tabActiveIndex, setTabActiveIndex] = useAtom(subProfileTabActiveIndexAtom);
  const [cachedTabMap, setCachedTabMap] = useState<Map<number, Section>>(new Map());
  const [filters] = useFilterInputs();

  useEffect(() => {
    subProfileState?.sections?.forEach((section) => {
      switch (section?.__typename) {
        case "ListSection":
          client
            .query<ListQuery, ListQueryVariables>(ListDocument, {
              listID: section.listIDs[0],
              entityID: subProfileEntity.entityId,
              entityType: subProfileEntity.entityType,
              filters: filters,
              first: 10,
            })
            .toPromise()
            .then((res) => {
              const count = res.data?.list?.connection?.totalCount;
              setCountMap((oldValue) => {
                const newValue = _.clone(oldValue);
                newValue.set(section.id, count ?? 0);
                return newValue;
              });
            });
          break;
        default:
          break;
      }
    });
  }, [filters]);

  useEffect(() => {
    // If cached
    const tabSection = cachedTabMap.get(tabActiveIndex);
    if (tabSection) {
      return;
    }
    // Or not
    const section = (subProfileState?.sections ?? [])[tabActiveIndex];
    if (section) {
      setCachedTabMap((oldValue) => {
        const newValue = _.clone(oldValue);
        newValue.set(tabActiveIndex, section);
        return newValue;
      });
    }
  }, [cachedTabMap, setCachedTabMap, subProfileState, tabActiveIndex]);

  // function contentComponent(index: number): ReactNode {
  //   // If cached
  //   const tabContent = cachedTabContentMap.get(index);
  //   if (tabContent) {
  //     return tabContent;
  //   }
  //   // Or not
  //   const section = (subProfileState?.sections ?? [])[index];
  //   if (section) {
  //     const newTabContent = <SectionWrapper section={section} />;
  //     const newCachedTabContentMap = _.clone(cachedTabContentMap);
  //     newCachedTabContentMap.set(index, newTabContent);
  //     setCachedTabContentMap(newCachedTabContentMap);
  //     return newTabContent;
  //   }
  //   return null;
  // }

  if (!subProfileState || !subProfileState.sections || subProfileState.sections.length == 0) {
    return null;
  }

  if (subProfileState.sections.length === 1) {
    const section = subProfileState.sections[0];
    if (section) {
      return <SectionWrapper section={section} />;
    }
  }

  return (
    <div className={classes.root}>
      {Array.from(cachedTabMap.entries()).map((mapValue) => (
        <SectionWrapper hidden={mapValue[0] !== tabActiveIndex} key={mapValue[1].id} section={mapValue[1]} />
      ))}
    </div>
  );
};

export default Tabs;
