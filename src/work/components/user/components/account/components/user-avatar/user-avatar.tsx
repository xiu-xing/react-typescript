import {
  makeStyles
} from "@material-ui/core";
import React from "react";
import UserContainer from "../../../../userContainer";
import Modal from "./components/modal/modal";
import UserAvatarContainer from "./user-avatar-container";


const useStyles = makeStyles({
  dialogBox: {
    display: "grid",
    gridAutoFlow: "row",
    gridRowGap: 20,
    padding: "16px 24px 20px",
  },
  formControl: {
    display: "grid",
    gridAutoFlow: "row",
    padding: "10px 0px 0px 0px",
  },
  icon: {
    color: "#66778B",
    fontSize: "56px",
  },
  avatarImg: {
    maxWidth: "56px",
    maxHeight: "56px",
  },

});

const UserAvatar: React.FC = () => {
  const classes = useStyles();

  const {
    dialogType: dialogIndex,
    setDialogType: setDialogIndex,
    user,
  } = UserContainer.useContainer();
  const {
    iconError, setIconError,
  } = UserAvatarContainer.useContainer();

  return (
    <>
      {/* <Card
        icon={
          user?.avatar && !iconError ? (
            <img
              className={classes.avatarImg}
              onError={() => {
                setIconError(true);
              }}
              src={user?.avatar}
            />
          ) : (
              <AccountCircleOutline className={classes.icon} />
            )
        }
        title={user?.nickname}
        subTitle={(user?.company ? user?.company : " - ") + " | " + (user?.position ? user?.position : " - ")}
        onClick={(): void => setDialogIndex("avatar")}
      /> */}
      <Modal />
    </>
  );
};
const UserAvatarDisply: React.FC = () => (
  <UserAvatarContainer.Provider>
    <UserAvatar />
  </UserAvatarContainer.Provider>
)
export default UserAvatarDisply;
