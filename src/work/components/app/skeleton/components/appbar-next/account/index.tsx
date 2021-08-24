import { Box, ButtonBase, Popover } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import UserContainer from "../../../../../../containers/userContainer";
import { getResourceUrl } from "../../../../../../utils/url";
import { AvatarPlaceholder } from "./assets/index";
import Menu from "./menu";
import UserInfo from "./user-info";
import Verification from "./verification";

const useStyles = makeStyles(() =>
  createStyles({
    iconButton: {
      color: "#fff",
      width: 48,
      height: 48,
      borderRadius: 24,
    },
    content: {
      width: 364,
      padding: "12px 0",
    },
  }),
);

const Account: React.FunctionComponent = () => {
  const classes = useStyles();

  const { user } = UserContainer.useContainer();

  const [anchorEl, setAnchorEl] = React.useState<HTMLButtonElement | null>(null);

  const handleClick = (event: React.MouseEvent<HTMLButtonElement>): void => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = (): void => {
    setAnchorEl(null);
  };

  return (
    <>
      <ButtonBase className={classes.iconButton} onClick={handleClick}>
        {user?.avatarURL ? (
          <img
            src={user?.avatarURL ? getResourceUrl(user.avatarURL) : ""}
            style={{
              width: 32,
              height: 32,
              objectFit: "cover",
              borderRadius: 16,
            }}
          />
        ) : (
          <AvatarPlaceholder />
        )}
      </ButtonBase>
      <Popover
        anchorEl={anchorEl}
        open={Boolean(anchorEl)}
        onClose={handleClose}
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "left",
        }}
        keepMounted
        disableScrollLock
      >
        <Box className={classes.content}>
          <UserInfo />
          <Verification />
          <Menu />
        </Box>
      </Popover>
    </>
  );
};

export default Account;
