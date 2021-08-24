import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { OverlayScrollbarsComponent } from "overlayscrollbars-react";
import React, { useMemo, useRef, useState } from "react";
import { FILTER_AREA_HEIGHT } from "..";
import { Section as SectionModel } from "../../../../../../generated/graphql";
import { APPBAR_HEIGHT } from "../../../../../app/skeleton/components/appbar-next";
import Row from "../../../../../common/section/row";
import { useSectionIndex } from "../../../../atoms";
import { TOOLBAR_HEIGHT } from "../../../../toolbar";
import { TAB_HEIGHT } from "../../../tabs/tab";
import NavigationMenu from "./navigation-menu";
import Section from "./section";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    menu: {
      [theme.breakpoints.down(1000)]: {
        display: "none",
      },
    },
    sections: (props) => ({
      maxHeight: `calc(100vh - ${APPBAR_HEIGHT + props["top"] ?? 0}px)`,
      overflow: "hidden auto",
      [theme.breakpoints.down(1000)]: {
        padding: "0px 24px 0px",
      },
      padding: "0px 24px 24px 194px",
      width: "100%",
      "& .os-content>.row:not(:last-child)": {
        borderBottom: "1px solid #EEE",
      },
      "& .os-content>.row>.col:not(:last-child)": {
        paddingRight: 24,
      },
      "& .os-padding": {
        zIndex: "auto",
      },
    }),
  }),
);

interface SectionInfo {
  scrollRange: [number, number];
  startPoint: number;
}

interface SectionsProps {
  sections: SectionModel[];
  hasFilterArea?: boolean;
}

const Sections: React.FunctionComponent<SectionsProps> = (props) => {
  const { sections = [], hasFilterArea = true } = props;
  const invalidScrollHeight = TOOLBAR_HEIGHT + TAB_HEIGHT + (hasFilterArea ? FILTER_AREA_HEIGHT : 0) + 1;
  const classes = useStyles({ top: invalidScrollHeight });

  const rootRef = useRef<OverlayScrollbarsComponent | null>(null);
  const sectionRefs = useRef<Record<string, HTMLElement>>(Object.create(null));
  const [downLg, setDownLg] = useState(false);
  const [defaultSectionIndex] = useSectionIndex();
  const [activeId, setActiveId] = useState<string>(defaultSectionIndex ?? sections[0].id);

  const preventScrollEvent = useRef<boolean>(false);

  const collectSectionsInfo = (): Record<string, SectionInfo> => {
    const res: Record<string, SectionInfo> = {};

    const extraScrollHeight = rootRef.current?.osInstance()?.getState().overflowAmount.y ?? 0;

    let total = 0;
    const sectionWeight: number[] = [];

    sections.forEach((s) => {
      const node = sectionRefs.current[s.id];
      if (node) {
        if (!node.previousElementSibling && !node.nextElementSibling) {
          sectionWeight[s.id] = node.clientHeight;
        } else {
          sectionWeight[s.id] = node.clientHeight / 2;
        }
        total += node.clientHeight;
      }
    });

    let scrollOffset = 0;

    sections.forEach((s) => {
      const paragraph = (sectionWeight[s.id] / total) * extraScrollHeight;
      res[s.id] = {
        startPoint: sectionRefs.current[s.id]?.offsetTop,
        scrollRange: [scrollOffset, (scrollOffset += paragraph)],
      };
    });

    return res;
  };

  const jumpToSection = (sectionId: string) => {
    setActiveId(sectionId);
    const info = collectSectionsInfo()[sectionId];
    preventScrollEvent.current = true;
    rootRef.current?.osInstance()?.scrollStop().scroll({ y: info.startPoint });
    setTimeout(() => {
      preventScrollEvent.current = false;
    }, 600);
  };

  const scrollHandle = () => {
    if (preventScrollEvent.current) {
      return;
    }

    const infos = collectSectionsInfo();

    sections.forEach((s) => {
      const scrollTop = rootRef.current?.osInstance()?.scroll().position.y ?? 0;

      if (scrollTop >= infos[s.id].scrollRange[0] && scrollTop <= infos[s.id].scrollRange[1]) {
        setActiveId(s.id);
      }
    });
  };

  const sectionEls = useMemo(
    () =>
      sections.map((s) => ({
        type: s.__typename,
        el: (
          <Section
            key={s.id}
            section={s}
            ref={(ref) => {
              const node = ref?.parentElement;
              if (node) sectionRefs.current[s.id] = node;
            }}
          />
        ),
      })),
    [sections],
  );

  const sectionElements = useMemo(() => {
    if (!downLg) {
      const rows: JSX.Element[][] = [];
      let needFill = false;

      sections.forEach((s, i) => {
        const ele = sectionEls[i].el;
        switch (s.__typename) {
          case "StatementSheetSection":
          case "ProgressBarSection":
          case "BlockSection":
          case "TableSection":
            rows.push([ele]);
            needFill = false;
            break;
          case "GraphSection":
          case "ChartSection": {
            if (s.fullWidth) {
              rows.push([ele]);
              needFill = false;
            } else if (needFill) {
              rows[rows.length - 1].push(ele);
              needFill = false;
            } else {
              rows.push([ele]);
              needFill = true;
            }
            break;
          }
          case "ListSection":
          case "InfoFlowSection":
          case "FeaturedTableSection":
            rows.push([ele]);
            needFill = false;
            break;
          case "FeaturedListSection":
            break;
          default:
            // eslint-disable-next-line no-case-declarations
            const _exhaustiveCheck: never = s;
            break;
        }
      });

      return rows.map((e, i) => <Row key={i}>{e}</Row>);
    }

    return sectionEls.map((s, i) => <Row key={i}>{s.el}</Row>);
  }, [downLg]);

  return (
    <>
      <div className={classes.menu}>
        <NavigationMenu
          activeId={activeId}
          sections={sections}
          onChange={jumpToSection}
          top={invalidScrollHeight + APPBAR_HEIGHT}
        />
      </div>
      <OverlayScrollbarsComponent
        className={classes.sections}
        ref={rootRef}
        options={{
          overflowBehavior: {
            x: "hidden",
            y: "scroll",
          },
          scrollbars: {
            autoHide: "l",
          },
          callbacks: {
            onContentSizeChanged: (e) => setDownLg(Boolean(e && e?.width < 1000)),
            onScroll: scrollHandle,
          },
        }}
      >
        {sectionElements}
      </OverlayScrollbarsComponent>
    </>
  );
};

export default Sections;
