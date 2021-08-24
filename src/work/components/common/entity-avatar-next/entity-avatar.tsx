import { Avatar, AvatarProps, StyledComponentProps } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import { LogoPlaceholder } from "./assets";

const useStyles = makeStyles({
  avatarContainer: {
    width: 36,
    height: 36,
    borderRadius: 3,
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    pointerEvents: "none",
  },
  icon: {
    color: "#666",
  },
  imgLogo: {
    maxWidth: "100%",
    maxHeight: "100%",
    objectFit: "contain",
    background: "none",
  },
  avatarRoot: {
    width: "100%",
    height: "100%",
    backgroundColor: "#fff",
  },
  placeholderIcon: {
    width: "100%",
    height: "100%",
    backgroundColor: "#bdbdbd",
  },
});

type AvatarClassKey = "root" | "img" | "placeholder";

interface EntityAvatarProps extends Omit<AvatarProps, "classes">, StyledComponentProps<AvatarClassKey> {
  isListItem?: boolean;
}

const EntityAvatar: React.FunctionComponent<EntityAvatarProps> = (props) => {
  const classes = useStyles();
  const { className } = props;

  return (
    <div className={clsx(classes.avatarContainer, className)}>
      <Avatar
        alt=""
        src={props.src && props.src != "" ? props.src : LogoPlaceholder}
        classes={{
          img: clsx(classes.imgLogo, props.classes?.img),
          root: clsx(classes.avatarRoot, props.classes?.root),
        }}
        variant="rounded"
      >
        <img src={LogoPlaceholder} className={clsx(classes.avatarRoot)} />
      </Avatar>
    </div>
  );
};

export default EntityAvatar;
