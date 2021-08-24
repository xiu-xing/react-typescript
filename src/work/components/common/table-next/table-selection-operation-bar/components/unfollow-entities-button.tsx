import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import { StarOutline } from "mdi-material-ui";
import React from "react";
import { useClient } from "urql";
import {
  EntityInput,
  // UnfollowEntitiesDocument,
  // UnfollowEntitiesMutation,
  // UnfollowEntitiesMutationVariables,
} from "../../../../../generated/graphql";
import TableSelectionBaseButton from "./base";

interface UnfollowEntitiesButtonProps {
  onClick(): Promise<EntityInput[]>;
  onSuccess?(): void;
  onFailure?(): void;
}

const UnfollowEntitiesButton: React.FunctionComponent<UnfollowEntitiesButtonProps> = (props) => {
  const client = useClient();
  const muse = useMuseClient();

  const onClick = async (): Promise<void> => {
    try {
      const entities = await props.onClick();
      muse.sendTrackingEvent("common.unsubscribe", {
        entities: entities.map(({ entityId, entityType }) => ({ id: entityId, type: entityType })),
      });
      // await client
      //   .mutation<UnfollowEntitiesMutation, UnfollowEntitiesMutationVariables>(UnfollowEntitiesDocument, {
      //     entities: entities.map(({ entityId, entityType }) => ({ entityId, entityType })),
      //   })
      //   .toPromise();
      props.onSuccess?.();
    } catch (e) {
      console.error(e);
      props.onFailure?.();
    }
  };

  return <TableSelectionBaseButton onClick={onClick} title={"取消关注"} startIcon={StarOutline} />;
};

export default UnfollowEntitiesButton;
