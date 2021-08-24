import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";

import "overlayscrollbars/css/OverlayScrollbars.css";
import React from "react";
import { Tab, WebProfile } from "../../generated/graphql";
import { APPBAR_HEIGHT } from "../app/skeleton/components/appbar-next/index-next";
import EntityAvatar from "../common/entity-avatar-next/entity-avatar";
import { useProfileData, useProfileEntity } from "./atoms";
import Content from "./content";
import Toolbar from "./toolbar";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    entityLogo: {
      marginRight: 12,
      maxWidth: theme.spacing(5),
      maxHeight: theme.spacing(5),
      background: "none",
    },
    noData: {
      height: `calc(100vh - ${APPBAR_HEIGHT}px)`,
      textAlign: "center",
      display: "grid",
      placeItems: "center",
      paddingBottom: "10%",
    },
  }),
);

const Profile: React.FunctionComponent = () => {
  const classes = useStyles();
  const [profileData] = useProfileData();
  const [profileEntity] = useProfileEntity();

  function checkData(data?: WebProfile): boolean {
    if (typeof data === "undefined") return false;

    if (data.tabs.filter((t) => typeof t?.id === "string").length <= 0) return false;

    return true;
  }

  return checkData(profileData) ? (
    <div className={classes.root}>
      <Toolbar
        entity={profileEntity}
        tabs={profileData?.tabs as Tab[]}
        title={profileData?.primaryName as string}
        avatar={<EntityAvatar src={profileData?.logoURI as string} className={classes.entityLogo} />}
      />
      <Content />
    </div>
  ) : (
    <Box className={classes.noData}>
      <Typography>暂无数据</Typography>
    </Box>
  );
};

export default Profile;
