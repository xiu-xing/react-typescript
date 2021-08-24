import React, { useEffect, useMemo, useRef, useState } from "react";
import { Section as SectionModel } from "../../../../generated/graphql";
import Row from "../../../common/section-next/components/row";
import Section from "./section";

interface SectionsProps {
  sections: SectionModel[];
}

const Sections: React.FunctionComponent<SectionsProps> = (props) => {
  const { sections = [] } = props;

  const sectionsRef = useRef<HTMLDivElement | null>(null);

  const [downLg, setDownLg] = useState(false);

  const sectionEls = useMemo(
    () =>
      sections.map((s) => ({
        type: s.__typename,
        el: <Section key={s.id} sectionModel={s} />,
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
          case "InfoFlowSection":
          case "ListSection":
          case "FeaturedTableSection":
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

  const resizeHandler = () => {
    if (sectionsRef.current) setDownLg(Boolean(sectionsRef.current.clientWidth < 1000));
  };

  useEffect(() => {
    window.addEventListener("resize", resizeHandler);
    return (): void => {
      window.removeEventListener("resize", resizeHandler);
    };
  }, [sectionsRef]);

  return (
    <div ref={sectionsRef} style={{ paddingLeft: 24 }}>
      {sectionElements}
    </div>
  );
};

export default Sections;
