import { get } from "lodash";
import { useEffect, useState } from "react";
import { createContainer } from "unstated-next";
import UserContainer from "../../containers/userContainer";
import { useDelTeamMemberMutation, UserInfo, useTeamMembersQuery } from "../../generated/graphql";
import SnackbarContainer from "../common/snackbar/snackbarContainer";
import { parseError } from "../../utils/error";
import { useClient } from "@momentum-valley/muse-js";

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useTeamMembers() {
  const [members, setMembers] = useState<Array<UserInfo>>();
  const [displayMembers, setDisplayMembers] = useState<Array<UserInfo>>([]);
  const { defaultTeam } = UserContainer.useContainer();
  const [filter, setFilter] = useState<string>("");
  const muse = useClient();
  const { openSnackbar } = SnackbarContainer.useContainer();

  const [teamMembersQueryResult, executeTeamMembersQuery] = useTeamMembersQuery({
    variables: {
      teamID: defaultTeam ? defaultTeam.id : "",
    },
    pause: true,
  });

  const [, executeDelTeamMembers] = useDelTeamMemberMutation();

  useEffect(() => {
    const result: Array<UserInfo> = get(teamMembersQueryResult, ["data", "usersByTeam"]);

    result && setMembers(result);
  }, [teamMembersQueryResult]);

  useEffect(() => {
    if (defaultTeam) {
      executeTeamMembersQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [defaultTeam]);

  useEffect(() => {
    if (members) {
      if (filter != "") {
        muse.sendTrackingEvent("team_members.search", {
          keyword: filter,
        });
        const reg = new RegExp(filter);
        setDisplayMembers(members.filter((member) => member.userName.match(reg) || member.email.match(reg)));
      } else {
        setDisplayMembers(members);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [members, filter]);

  const deleteMember = (userId: string): void => {
    if (defaultTeam) {
      muse.sendTrackingEvent("team_members.member_remove", {
        user_id: userId,
      });
      executeDelTeamMembers({ removedUser: [userId], teamID: defaultTeam.id }).then((res) => {
        if (res.data?.delTeamMember.valueOf()) {
          setMembers((prev) => {
            return prev?.filter((member) => member.userID !== userId);
          });
          openSnackbar("移除用户成功", "success");
        } else if (!res.data?.delTeamMember.valueOf()) {
          openSnackbar("移除用户权限不足", "error");
        } else {
          const err = parseError(res.error);
          openSnackbar(err.message ?? "移除用户失败", "error");
        }
      });
    }
  };

  return {
    team: defaultTeam,
    displayMembers,

    deleteMember,
    setFilter,
  };
}

const TeamMembersContainer = createContainer(useTeamMembers);
export default TeamMembersContainer;
