import { Box, fade, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useAtom } from "jotai";
import React, { ReactNode } from "react";
import { Maybe, Tag as TagModel } from "../../../generated/graphql";
import theme from "../../../theme";
import { RimePlaceholderImg } from "../../common/entity-avatar-next/assets";
import { profileAtom } from "./states";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
      padding: "12px 16px 0",
    },
    entityLogo: {
      maxWidth: 30,
      minWidth: 30,
      maxHeight: 30,
      minHeight: 30,
      marginRight: 10,
      borderRadius: 2,
      objectFit: "contain",
    },
    entityName: {
      fontWeight: 500,
      fontSize: 16,
      color: "#333",
      marginRight: 8,
    },
    labelBox: {
      width: "max-content",
      borderRadius: 2,
      padding: 4,
      backgroundColor: fade(theme.palette.primary.main, 0.12),
      color: theme.palette.primary.main,
    },
    label: {
      fontSize: 12,
      lineHeight: 1.2,
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

const Header: React.FunctionComponent = () => {
  const classes = useStyles();
  const [profile] = useAtom(profileAtom);

  function logoComponent() {
    if (profile?.logoURI) {
      return <img className={classes.entityLogo} src={profile.logoURI} />;
    }
    return <RimePlaceholderImg className={classes.entityLogo} />;
  }

  function tagsComponent(tag: Maybe<TagModel>, index: number): ReactNode {
    if (tag && tag.__typename == "TextTag")
      return (
        <Box key={tag.name as string} className={classes.labelBox}>
          <Typography noWrap className={classes.label}>
            {tag.name}
          </Typography>
        </Box>
      );
  }

  return (
    <div className={classes.root}>
      {logoComponent()}
      <Typography className={classes.entityName}>{profile?.primaryName}</Typography>
      {profile?.tags && profile?.tags.map((v, i) => tagsComponent(v, i))}
    </div>
  );
};

export default Header;
