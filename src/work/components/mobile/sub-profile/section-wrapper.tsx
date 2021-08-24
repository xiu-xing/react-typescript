import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useAtom } from "jotai";
import React from "react";
import { EntityInput, EntityType, Section } from "../../../generated/graphql";
import { first } from "../../../utils/tools";
import ChartSection from "../profile/sections/chart/index";
import DataBlockSection from "../profile/sections/data-block";
import InfoFlowSection from "../profile/sections/info-flow";
import ListSection from "../profile/sections/list";
import { subProfileEntityAtom, useFilterInputs } from "./states";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "20px 14px 20px 16px",
    },
  }),
);

interface SectionWrapperProps extends React.HTMLAttributes<HTMLDivElement> {
  section: Section;
}

const SectionWrapper: React.FunctionComponent<SectionWrapperProps> = ({ section, ...leftProps }) => {
  const classes = useStyles();
  const [subProfileEntity] = useAtom(subProfileEntityAtom);
  const [filters] = useFilterInputs();

  const content = () => {
    const entity: EntityInput = {
      entityId: subProfileEntity?.entityId ?? "",
      entityType: subProfileEntity?.entityType ?? EntityType.Organization,
    };
    switch (section?.__typename) {
      case "BlockSection":
        return <DataBlockSection section={section} {...entity} filters={filters} />;
      case "ChartSection":
        return (
          <ChartSection
            {...entity}
            name={section.name}
            id={first(section.chartIDs)}
            key={section.id}
            filters={filters}
          />
        );
      case "ListSection":
        return <ListSection section={section} {...entity} filters={filters} />;
      case "InfoFlowSection":
        return <InfoFlowSection section={section} {...entity} filters={filters} />;
      default:
        return <div>{section?.__typename}</div>;
    }
  };

  return (
    <div {...leftProps} className={classes.root}>
      {content()}
    </div>
  );
};

export default SectionWrapper;
