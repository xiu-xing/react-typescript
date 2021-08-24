import { useState, useEffect } from "react";
import { createContainer } from "unstated-next";
import GlobalUserContainer from "../../containers/userContainer";
import { useUserQuery, useTeamMembersQuery, UserInfo } from "../../generated/graphql";

export enum AccountType {
  Phone = "phone",
  Email = "email",
}

type DialogType =
  | "none"
  | "basic"
  | "phone"
  | "mail"
  | "password"
  | "binding"
  | "notification"
  | "bill"
  | "credit_card"
  | "avatar";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useUser() {
  const [dialogType, setDialogType] = useState<DialogType>("none");

  const { user, setUser } = GlobalUserContainer.useContainer();

  const [userQueryResult, executeUserQuery] = useUserQuery({
    requestPolicy: "network-only",
  });

  useEffect(() => {
    if (userQueryResult.data && userQueryResult.data.user) {
      setUser(userQueryResult.data.user);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [userQueryResult]);

  return {
    user,
    setUser,
    dialogType,
    setDialogType,
    executeUserQuery,
  };
}

const UserContainer = createContainer(useUser);

export default UserContainer;
