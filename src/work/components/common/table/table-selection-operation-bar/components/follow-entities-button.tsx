import { Star } from "mdi-material-ui";
import React from "react";
import { useClient } from "urql";
import UserContainer from "../../../../../containers/userContainer";
import {
  EntityInput,
  // FollowEntitiesDocument,
  // FollowEntitiesMutation,
  // FollowEntitiesMutationVariables,
  Role,
} from "../../../../../generated/graphql";
import { parseError } from "../../../../../utils/error";
import { isAccessError } from "../../../../../utils/errorHandler";
import SnackbarContainer from "../../../snackbar/snackbarContainer";
import TableSelectionBaseButton from "./base";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";

interface FollowEntitiesButtonProps {
  onClick(): Promise<EntityInput[]> | EntityInput[];
  onSuccess?(): void;
  onFailure?(): void;
}

const FollowEntitiesButton: React.FunctionComponent<FollowEntitiesButtonProps> = (props) => {
  const client = useClient();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const { user, setTrailServiceDialogOpen, setInstitutionAuthenticationDialog, setActiveServiceDialogOpen } =
    UserContainer.useContainer();
  const muse = useMuseClient();

  const onClick = async (): Promise<void> => {
    try {
      const entities = await props.onClick();

      muse.sendTrackingEvent("common.subscribe", {
        entities: entities.map(({ entityId, entityType }) => ({
          id: entityId,
          type: entityType,
        })),
      });

      // const result = await client
      //   .mutation<FollowEntitiesMutation, FollowEntitiesMutationVariables>(FollowEntitiesDocument, {
      //     entities,
      //   })
      //   .toPromise();

      // if (result.error) {
      //   const error = parseError(result.error);
      //   if (isAccessError(error.code)) {
      //     openSnackbar(error.message, "error");
      //     if (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
      //       setInstitutionAuthenticationDialog(true);
      //     }
      //     if (user?.role == Role.Basic) {
      //       setTrailServiceDialogOpen(true);
      //     }
      //     if (user?.role == Role.Expired) {
      //       setActiveServiceDialogOpen(true);
      //     }
      //     return;
      //   }
      //   throw new Error(result.error.toString());
      // }
      props.onSuccess?.();
    } catch (e) {
      console.error(e);
      props.onFailure?.();
    }
  };

  return <TableSelectionBaseButton onClick={onClick} title={"关注"} startIcon={Star} />;
};

export default FollowEntitiesButton;
