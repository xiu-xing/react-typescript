import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useAtom } from "jotai";
import React from "react";
import { EntityType, Maybe, Section } from "../../../../generated/graphql";
import { first } from "../../../../utils/tools";
import { profileAtom, profileEntityAtom } from "../states";
import ChartSection from "./chart";
import DataBlockSection from "./data-block";
import InfoFlowSection from "./info-flow";
import ListSection from "./list";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "18px 16px",
      display: "grid",
      gridAutoRows: "max-content",
      gridAutoColumns: "100%",
      gridRowGap: 36,
      maxWidth: "100vw",
    },
  }),
);

interface Entity {
  entityId: string;
  entityType: EntityType;
}

const Sections: React.FunctionComponent = () => {
  const classes = useStyles();
  const [profile] = useAtom(profileAtom);
  const [profileEntity] = useAtom(profileEntityAtom);

  if (!profile || !profileEntity) {
    return null;
  }

  const content = (section: Maybe<Section>) => {
    const entity: Entity = {
      entityId: profileEntity.entityId ?? "",
      entityType: profileEntity.entityType ?? EntityType.Organization,
    };

    switch (section?.__typename) {
      case "BlockSection":
        return <DataBlockSection {...entity} section={section} key={section.id} />;
      case "ChartSection":
        return <ChartSection {...entity} name={section.name} id={first(section.chartIDs)} key={section.id} />;
      case "ListSection":
        return <ListSection {...entity} section={section} key={section.id} />;
      case "InfoFlowSection":
        return <InfoFlowSection {...entity} section={section} key={section.id} />;
      default:
        return <div>{section?.__typename}</div>;
    }
  };

  return <div className={classes.root}>{profile.sections && profile.sections.map((section) => content(section))}</div>;
};

export default Sections;
