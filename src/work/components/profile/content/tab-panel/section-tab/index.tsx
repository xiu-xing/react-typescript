import { createStyles, makeStyles, Theme } from "@material-ui/core";
import { useTabContext } from "@material-ui/lab";
import { OverlayScrollbarsComponent } from "overlayscrollbars-react";
import React, { useEffect, useMemo } from "react";
import { Filter, Section, SectionedDisplayTab, useProfileTabSectionsQuery } from "../../../../../generated/graphql";
import { useFilterInputs } from "../../../../../utils/hooks";
import FilterContext from "../../../../common/filter-context";
import FilterItem from "../../../../common/filter-item";
import Space from "../../../../common/space";
import { useProfileEntity, useTabIndex } from "../../../atoms";
import Sections from "./sections";

export const FILTER_AREA_HEIGHT = 52;

interface SectionTabProp {
  tab: SectionedDisplayTab;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    filterArea: {
      display: "flex",
      height: FILTER_AREA_HEIGHT,
      borderBottom: "1px solid #EEE",
      padding: "0 24px",
    },
    filters: {
      maxHeight: FILTER_AREA_HEIGHT,
      height: FILTER_AREA_HEIGHT,
    },
  }),
);

const SectionTab: React.FunctionComponent<SectionTabProp> = (props) => {
  const { tab } = props;
  const classes = useStyles();
  const [entity] = useProfileEntity();

  const [filterInputs, handleFilterInputChange] = useFilterInputs(tab.filters as Filter[]);
  const tabContext = useTabContext();
  const [, setTab] = useTabIndex();
  const [tabSectionQuertResult] = useProfileTabSectionsQuery({
    variables: {
      tabID: tab.id,
      entityID: entity.id,
      entityType: entity.type,
    },
  });

  useEffect(() => {
    setTab(tabContext?.value ?? "");
  }, [tabContext?.value]);

  const filtersArea = useMemo(
    () =>
      tab.filters && tab.filters.length > 0 ? (
        <OverlayScrollbarsComponent
          className={classes.filterArea}
          options={{
            overflowBehavior: {
              x: "scroll",
              y: "hidden",
            },
            scrollbars: {
              autoHide: "l",
            },
          }}
        >
          <Space className={classes.filters} size="large">
            {tab.filters.map((f, i) => (
              <FilterItem key={f?.id ?? "" + i} filter={f as Filter} onChange={handleFilterInputChange} />
            ))}
          </Space>
        </OverlayScrollbarsComponent>
      ) : null,
    [tab.filters],
  );

  return (
    <>
      {filtersArea}
      <FilterContext value={filterInputs}>
        {tabSectionQuertResult.data?.profileTabSections && tabSectionQuertResult.data?.profileTabSections.length > 0 ? (
          <Sections
            sections={tabSectionQuertResult.data?.profileTabSections as Section[]}
            hasFilterArea={!!(tab.filters && tab.filters.length > 0)}
          />
        ) : null}
      </FilterContext>
    </>
  );
};

export default SectionTab;
