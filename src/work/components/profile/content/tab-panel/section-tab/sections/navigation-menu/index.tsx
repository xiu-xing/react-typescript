import { createStyles, makeStyles } from "@material-ui/core/styles";
import { OverlayScrollbarsComponent } from "overlayscrollbars-react";
import React from "react";
import { FILTER_AREA_HEIGHT } from "../..";
import { Section } from "../../../../../../../generated/graphql";
import { APPBAR_HEIGHT } from "../../../../../../app/skeleton/components/appbar-next";
import { TOOLBAR_HEIGHT } from "../../../../../../common/toolbar/toolbar";
import { TAB_HEIGHT } from "../../../../tabs/tab";
import MenuItem from "./menu-item";

const useStyles = makeStyles(() =>
  createStyles({
    root: (props) => ({
      backgroundColor: "#fff",
      zIndex: 997,
      position: "fixed",
      top: props["top"],
      bottom: 0,
      width: 170,
      minWidth: 170,
      borderRight: "rgba(0, 0, 0, 0.11) solid 1px",
      display: "flex",
      flexDirection: "column",
      padding: "8px 0px",
    }),
  }),
);

interface NavigationMenuProps {
  sections: Section[];
  activeId: string;
  top?: number;
  onChange?: (id: string) => void;
}

const NavigationMenu: React.FunctionComponent<NavigationMenuProps> = (props) => {
  const {
    activeId,
    sections,
    top = APPBAR_HEIGHT + TOOLBAR_HEIGHT + TAB_HEIGHT + FILTER_AREA_HEIGHT,
    onChange = () => {},
  } = props;
  const classes = useStyles({ top: top });

  return (
    <OverlayScrollbarsComponent
      className={classes.root}
      options={{
        scrollbars: {
          autoHide: "l",
        },
      }}
    >
      {sections.map((section) => (
        <MenuItem
          key={section.id}
          section={section}
          active={activeId === section.id}
          onClick={() => onChange(section.id)}
        />
      ))}
    </OverlayScrollbarsComponent>
  );
};

export default NavigationMenu;
