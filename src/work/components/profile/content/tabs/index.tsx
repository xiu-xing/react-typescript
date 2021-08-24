import { ButtonBase } from "@material-ui/core";
import { createStyles, makeStyles, Theme, withStyles } from "@material-ui/core/styles";
import { TabList, useTabContext } from "@material-ui/lab";
import clsx from "clsx";
import { ChevronLeft, ChevronRight } from "mdi-material-ui";
import React, { useCallback, useEffect, useMemo, useState } from "react";
import { Tab as TabModel } from "../../../../generated/graphql";
import { first } from "../../../../utils/tools";
import { APPBAR_HEIGHT } from "../../../app/skeleton/components/appbar-next";
import { TOOLBAR_HEIGHT } from "../../toolbar";
import Tab, { TAB_HEIGHT } from "./tab";

const StyledTabList = withStyles((theme: Theme) =>
  createStyles({
    root: {
      minHeight: TAB_HEIGHT,
      "& .MuiTabs-flexContainer": {
        "& button:not(:last-child)": {
          marginRight: 32,
        },
      },
    },
    indicator: {
      height: 3,
      backgroundColor: theme.palette.primary.main,
    },
  }),
)(TabList);

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "sticky",
      zIndex: 999,
      top: APPBAR_HEIGHT + TOOLBAR_HEIGHT,
      height: TAB_HEIGHT,
      display: "grid",
      padding: "0 24px",
      borderBottom: "1px solid #EEE",
      background: "white",
      gridTemplateColumns: "1fr",
    },
    changeTop: {
      top: 0,
      zIndex: 0,
    },
    button: {
      height: TAB_HEIGHT,
      width: TAB_HEIGHT,
      color: theme.palette.primary.main,
    },
    disableButton: {
      color: "#EEE",
    },
  }),
);

interface TabsProps {
  tabs: TabModel[];
  onChange?: (value: string) => void;
  changeTop?: boolean;
}

const Tabs: React.FunctionComponent<TabsProps> = (props) => {
  const { tabs, onChange, changeTop } = props;
  const tabIndex = useTabContext();
  const [overflow, setOverflow] = useState(false);
  const classes = useStyles();

  const getId = useCallback(
    (id: string, offset: number): string => {
      let index = 0;
      tabs.forEach((t, i) => {
        if (t.id === id) {
          index = i;
        }
      });

      if (index + offset < 0) {
        return first(tabs).id;
      } else if (index + offset > tabs.length - 1) {
        return tabs[tabs.length - 1].id;
      } else {
        return tabs[index + offset].id;
      }
    },
    [tabs],
  );

  const handleNext = useCallback(() => {
    if (onChange) onChange(getId(tabIndex?.value ?? "", 1));
  }, [onChange, tabIndex]);

  const handlePrev = useCallback(() => {
    if (onChange) onChange(getId(tabIndex?.value ?? "", -1));
  }, [onChange, tabIndex]);

  const disablePrev = useMemo(() => tabIndex?.value === first(tabs).id, [tabIndex, tabs]);
  const disableNext = useMemo(() => tabIndex?.value === tabs[tabs.length - 1].id, [tabIndex, tabs]);

  function handleResizing() {
    const node = document.querySelector(".MuiTabs-scroller");

    const scrollWidth = node?.scrollWidth ?? 0;
    const clientWidth = node?.clientWidth ?? 0;
    if (scrollWidth > clientWidth) {
      setOverflow(true);
    } else {
      setOverflow(false);
    }
  }

  useEffect(() => {
    handleResizing();
    window.addEventListener("resize", handleResizing);
    return () => {
      window.removeEventListener("resize", handleResizing);
    };
  }, []);

  return (
    <div
      className={clsx(classes.root, changeTop ? classes.changeTop : "")}
      style={{ ...(overflow && { gridTemplateColumns: "1fr 88px" }) }}
    >
      <StyledTabList
        variant="scrollable"
        scrollButtons="off"
        onChange={(_, v) => {
          if (onChange) onChange(v);
        }}
      >
        {tabs.map((t, i) => (
          <Tab key={t?.id ?? "" + i} value={t?.id} tab={t as TabModel} />
        ))}
      </StyledTabList>
      <div hidden={!overflow}>
        <ButtonBase
          className={classes.button}
          onClick={handlePrev}
          disabled={disablePrev}
          classes={{ disabled: classes.disableButton }}
        >
          <ChevronLeft />
        </ButtonBase>
        <ButtonBase
          className={classes.button}
          onClick={handleNext}
          disabled={disableNext}
          classes={{ disabled: classes.disableButton }}
        >
          <ChevronRight />
        </ButtonBase>
      </div>
    </div>
  );
};

export default Tabs;
