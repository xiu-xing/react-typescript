import { Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { EntityType, Tab } from "../../../generated/graphql";
import { APPBAR_HEIGHT } from "../../app/skeleton/components/appbar-next";
import Space from "../../common/space";
import ExportButton from "./export-button";
import FeedbackButton from "./feedback-button";
import TrackButton from "./track-button";

export const TOOLBAR_HEIGHT = 64;

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "sticky",
      zIndex: 1000,
      top: APPBAR_HEIGHT,
      height: TOOLBAR_HEIGHT,
      padding: "0 24px",
      paddingBottom: 8,
      paddingTop: 20,
      display: "flex",
      alignItems: "center",
      background: "white",
      justifyContent: "space-between",
    },
    title: {
      color: theme.palette.grey[800],
      fontSize: 20,
      lineHeight: 1.3,
    },
    entity: {
      display: "grid",
      gridTemplateColumns: "max-content 1fr",
      alignItems: "center",
    },
  }),
);

interface ToolbarProps {
  entity: {
    id: string;
    name: string;
    type: EntityType;
  };
  title: string;
  avatar?: React.ReactNode;
  tailing?: React.ReactNode;
  tabs: Tab[];
}

const Toolbar: React.FunctionComponent<ToolbarProps> = (props) => {
  const classes = useStyles();
  const { entity, title, avatar, tabs } = props;

  return (
    <div className={classes.root}>
      <div className={classes.entity}>
        {avatar}
        <Typography noWrap className={classes.title}>
          {title}
        </Typography>
      </div>
      <Space size="large">
        <ExportButton id={entity.id} name={entity.name} type={entity.type} />
        <FeedbackButton tabs={tabs} entity={entity} />
        <TrackButton entityId={entity.id} entityType={entity.type} />
      </Space>
    </div>
  );
};

export default Toolbar;
