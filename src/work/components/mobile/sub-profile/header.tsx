import { Box, Tab as MUITab, Tabs as MUITabs, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { useAtom } from "jotai";
import { Tune } from "mdi-material-ui";
import React, { ReactNode } from "react";
import { Filter as FilterModel, Section } from "../../../generated/graphql";
import Filter from "./filter";
import {
  bottomSheepOpenAtom,
  countMapAtom,
  filterInputCountAtom,
  outsideNameFormatterAtom,
  showNumberOfFiltersAtom,
  subProfileAtom,
  subProfileTabActiveIndexAtom,
  useFilterInputs,
} from "./states";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      background: "white",
    },
    title: {
      fontSize: 18,
      fontWeight: 500,
      padding: "4px 16px 0px",
    },
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
    sticky: {
      position: "sticky",
      top: 0,
      zIndex: 1,
    },
    filterTips: {
      backgroundColor: "#F5F6F9",
      height: 36,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      fontSize: 14,
      color: "#666",
    },
    tuneIcon: {
      fontSize: 16,
      color: "#666",
      marginRight: 4,
    },
  }),
);

const Header: React.FunctionComponent = () => {
  const classes = useStyles();
  const [subProfileState] = useAtom(subProfileAtom);
  const [countMap] = useAtom(countMapAtom);
  const [tabActiveIndex, setTabActiveIndex] = useAtom(subProfileTabActiveIndexAtom);
  const [outsideNameFormatter] = useAtom(outsideNameFormatterAtom);
  const [filterInput] = useFilterInputs();
  const [inputCount] = useAtom(filterInputCountAtom);
  const [showNumberOfFilters] = useAtom(showNumberOfFiltersAtom);
  const [, setOpen] = useAtom(bottomSheepOpenAtom);
  const filterReg = /%sn/gi;
  const titleReg = /%on/gi;

  function titleBaseComponent(title: string): ReactNode {
    return (
      <Box display="flex" alignItems="center" justifyContent="space-between">
        <Typography className={classes.title}>{title}</Typography>
        {(subProfileState?.filters?.length ?? 0) > 0 && (subProfileState?.sections?.length ?? 0) == 1 && (
          <Filter filters={subProfileState?.filters as FilterModel[]} />
        )}
      </Box>
    );
  }

  function titleComponent(): ReactNode {
    if (!subProfileState) {
      return null;
    }

    const sections = subProfileState.sections ?? [];
    if (sections.length == 0) {
      return null;
    }

    let title = subProfileState.title ?? "";
    if (sections.length == 1) {
      const section = sections[0];
      let count = "";

      switch (section?.__typename) {
        case "InfoFlowSection":
        case "ListSection":
          count = (countMap?.get(section.id) ?? section.count ?? "").toString();
          break;
        default:
          break;
      }
      title = `${title} ${count}`;
    }

    if (outsideNameFormatter) {
      filterInput.selectorFilterInputs?.forEach((s) => {
        if (s?.filterID == outsideNameFormatter.id) {
          title = outsideNameFormatter.formatter.replace(titleReg, title);
          title = title.replace(filterReg, s.filterValue);
        }
      });
    }
    return titleBaseComponent(title);
  }

  function tabTitle(section: Section): string {
    let count = 0;
    switch (section.__typename) {
      case "ListSection":
      case "InfoFlowSection":
        count = countMap?.get(section.id) ?? section.count ?? 0;
        return `${section?.name} ${count == 0 ? "" : count.toString()}`;
      default:
        return section.name ?? "";
    }
  }

  return (
    <div
      className={clsx(classes.root, {
        [classes.sticky]: (subProfileState?.sections ?? []).length > 1,
      })}
    >
      {titleComponent()}
      {(subProfileState?.sections?.length ?? 0) > 1 && (
        <Box
          display="grid"
          gridTemplateColumns={(subProfileState?.filters?.length ?? 0) > 0 ? "1fr max-content" : undefined}
          borderBottom="1px solid #EEE"
          alignItems="center"
        >
          <MUITabs
            indicatorColor="primary"
            textColor="primary"
            scrollButtons="off"
            variant="scrollable"
            value={tabActiveIndex}
            classes={{
              root: classes.tabs,
              indicator: classes.tabIndicator,
            }}
            TabIndicatorProps={{
              children: <span />,
            }}
            onChange={(_, value) => {
              setTabActiveIndex(value);
            }}
          >
            {subProfileState?.sections?.map((section) => {
              return <MUITab key={section?.id} className={classes.tab} label={section && tabTitle(section)} />;
            })}
          </MUITabs>
          {(subProfileState?.filters?.length ?? 0) > 0 && (
            <Filter filters={subProfileState?.filters as FilterModel[]} />
          )}
        </Box>
      )}

      {showNumberOfFilters && inputCount && inputCount != 0 ? (
        <Box className={classes.filterTips} onClick={() => setOpen((prev) => !prev)}>
          <Tune className={classes.tuneIcon} />
          {inputCount} 筛选条件
        </Box>
      ) : null}
    </div>
  );
};

export default Header;
