import { ListItem, ListItemAvatar, ListItemText, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { get } from "lodash";
import React, { useEffect, useState } from "react";
import { Entity, EntityType, useEntityQuery } from "../../../../../../../generated/graphql";
import EntityAvatar from "../../../../../../common/entity-avatar-next/entity-avatar";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "12px 32px",
    },
    avatar: {
      width: 32,
      height: 32,
    },
    listItemAvatar: {
      minWidth: 48,
    },
    listItemText: {
      margin: 0,
    },
  }),
);

interface EntityComponentProps {
  id: string;
  type: EntityType;
}

const EntityComponent: React.FunctionComponent<EntityComponentProps> = (props) => {
  const classes = useStyles();
  const { id, type } = props;
  const [entityQueryResult, executeEntityQuery] = useEntityQuery({
    variables: {
      entityID: id,
      entityType: type,
    },
    pause: true,
  });
  const [entity, setEntity] = useState<Entity>();

  useEffect(() => {
    if (id && type) {
      executeEntityQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id, type]);

  useEffect(() => {
    if (entityQueryResult.data) {
      const res = get(entityQueryResult, ["data", "entity"]);

      res && setEntity(res);
    }
  }, [entityQueryResult]);

  return (
    <>
      {entity && (
        <ListItem className={classes.root}>
          <ListItemAvatar className={classes.listItemAvatar}>
            <EntityAvatar className={classes.avatar} src={entity.portraitURL as string} />
          </ListItemAvatar>
          <ListItemText className={classes.listItemText} primary={<Typography>{entity.entityName}</Typography>} />
        </ListItem>
      )}
    </>
  );
};

export default EntityComponent;
