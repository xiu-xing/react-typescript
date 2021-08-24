import React from "react";
import UserContainer from "../../../containers/userContainer";
import { Role } from "../../../generated/graphql";
import ActiveServiceCard from "./active-service-card";
import AuthenticationCard from "./authentication-card";
import { makeStyles, createStyles } from "@material-ui/core";
import TrialServiceCard from "./trial-service-card";
const useStyle = makeStyles(() =>
  createStyles({
    disableText: {
      paddingTop: "10%",
      display: "flex",
      alignItems: "center",
      flexDirection: "column",
      color: "#737373",
    },
  }),
);

function AccessAuthenticationBox() {
  const classes = useStyle();
  const { user, defaultTeam } = UserContainer.useContainer();

  if (defaultTeam != null) {
    return <AuthenticationCard />;
  }
  if (user?.role == Role.Basic) {
    return <TrialServiceCard />;
  }
  if (user?.role == Role.Expired || user?.role == Role.Trial) {
    return <ActiveServiceCard />;
  }

  return <div className={classes.disableText}>今日访问已上限</div>;
}

export default AccessAuthenticationBox;
