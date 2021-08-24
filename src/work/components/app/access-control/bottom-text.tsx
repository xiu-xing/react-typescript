import { createStyles, makeStyles, Theme, Typography } from "@material-ui/core";
import React from "react";
import UserContainer from "../../../containers/userContainer";

const useStyle = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      justifyContent: "center",
      overflow: "hidden",
      "& p": {
        fontSize: 16,
      },
    },
    unlockText: {
      color: theme.palette.primary.main,
      cursor: "pointer",
    },
  }),
);

function AccessAuthenticationBottomText(): React.ReactElement {
  const classes = useStyle();
  const {
    user,
    setInstitutionAuthenticationDialog,
    setTrailServiceDialogOpen,
    setActiveServiceDialogOpen,
  } = UserContainer.useContainer();

  function BottomText(): React.ReactElement {
    // if (user?.role == Role.Public) {
    //   return (
    //     <span
    //       className={classes.unlockText}
    //       onClick={(): void => {
    //         setInstitutionAuthenticationDialog(true);
    //       }}
    //     >
    //       认证机构
    //     </span>
    //   );
    // }
    // if (user?.role == Role.Basic) {
    //   return (
    //     <span
    //       className={classes.unlockText}
    //       onClick={(): void => {
    //         setTrailServiceDialogOpen(true);
    //       }}
    //     >
    //       申请试用账号
    //     </span>
    //   );
    // }
    return (
      <span
        className={classes.unlockText}
        onClick={(): void => {
          setActiveServiceDialogOpen(true);
        }}
      >
        购买正式账号
      </span>
    );
  }
  return (
    <div className={classes.root}>
      <Typography>
        {BottomText()}
        <span> 查看全量数据，解锁更多功能</span>
      </Typography>
    </div>
  );
}

export default AccessAuthenticationBottomText;
