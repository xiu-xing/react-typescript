import { Avatar, AvatarProps } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { ReactNode } from "react";
import { EntityType } from "../../../generated/graphql";
import { CompanyIcon, DealIcon, PersonIcon, VerticalIcon } from "./assets/index";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    entityLogo: {
      maxWidth: theme.spacing(3),
      maxHeight: theme.spacing(3),
      background: "none",
    },
    imgLogo: {
      maxWidth: "100%",
      maxHeight: "100%",
      objectFit: "contain",
      background: "none",
    },
  }),
);

interface EntityAvatarProps extends AvatarProps {
  entityType?: EntityType;
}

const EntityAvatar: React.FunctionComponent<EntityAvatarProps> = (props) => {
  const classes = useStyles();
  const { entityType, src, className, ...leftProps } = props;

  function defaultAvatar(): ReactNode {
    switch (entityType) {
      case EntityType.Organization:
        return <CompanyIcon />;
      case EntityType.Person:
        return <PersonIcon />;
      case EntityType.Deal:
        return <DealIcon />;
      case EntityType.Vertical:
        return <VerticalIcon />;
      default:
        return null;
    }
  }

  return (
    <Avatar src={src} className={clsx(classes.entityLogo, className)} variant="rounded" alt="" {...leftProps}>
      {src ? <img src={src} className={classes.imgLogo} alt="" /> : defaultAvatar()}
    </Avatar>
  );
};

export default EntityAvatar;
