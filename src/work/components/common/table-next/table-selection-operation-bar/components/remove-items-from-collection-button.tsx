import { ButtonBase, CircularProgress, Typography } from "@material-ui/core";
import { useClient } from "@momentum-valley/muse-js";
import { TrashCanOutline } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import UserContainer from "../../../../../containers/userContainer";
import { EntityInput } from "../../../../../generated/graphql";
import { useStyles } from "../table-selection-operation-bar";

interface RemoveItemsFromCollectionDialogProps {
  success(): void;
  failure(): void;
  onClick(): Set<EntityInput> | Promise<Set<EntityInput>>;
}

const RemoveItemsFromCollectionDialog: React.FunctionComponent<RemoveItemsFromCollectionDialogProps> = (props) => {
  const classes = useStyles();
  // const [unfollowEntitiesMutationResult, executeUnfollowEntitiesMutation] = useUnfollowEntitiesMutation();
  const muse = useClient();

  const [loading, setLoading] = useState(false);

  // useEffect(() => {
  //   const result = unfollowEntitiesMutationResult.data?.unfollowEntities;
  //   if (unfollowEntitiesMutationResult.error || (!unfollowEntitiesMutationResult.fetching && !result)) {
  //     props.failure();
  //     return;
  //   }
  //   if (!unfollowEntitiesMutationResult.fetching && result) {
  //     props.success();
  //     return;
  //   }
  //   // eslint-disable-next-line react-hooks/exhaustive-deps
  // }, [unfollowEntitiesMutationResult]);

  return (
    <ButtonBase
      onClick={async (): Promise<void> => {
        if (loading) {
          return;
        }
        try {
          setLoading(true);
          const removeEntities = await props.onClick();
          const entities: EntityInput[] = [];
          for (const entity of removeEntities.values()) {
            const entityId = entity.entityId;
            const entityType = entity.entityType;
            if (entityId && entityType) {
              entities.push({ entityId, entityType } as EntityInput);
            }
          }

          muse.sendTrackingEvent("common.unsubscribe", {
            entities: entities.map((e) => ({
              id: e.entityId,
              type: e.entityType,
            })),
          });

          // await executeUnfollowEntitiesMutation({ entities });
        } finally {
          setLoading(false);
        }
      }}
      disabled={loading}
      className={classes.action}
      color="inherit"
    >
      {loading ? (
        <CircularProgress className={classes.tableActionIcon} color="inherit" size={16} disableShrink />
      ) : (
        <TrashCanOutline className={classes.tableActionIcon} color="inherit" />
      )}
      <Typography className={classes.actionText}>取消收藏</Typography>
    </ButtonBase>
  );
};

export default RemoveItemsFromCollectionDialog;
