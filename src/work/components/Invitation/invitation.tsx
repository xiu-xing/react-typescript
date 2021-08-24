import { Backdrop, Button, CircularProgress, Container, Grid, Paper, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { setCookie } from "nookies";
import React, { ReactNode, useState } from "react";
import { RimeDataChineseWebP } from "../../assets/webp/rime";
import { BannerWebP } from "../../assets/webp/visa";
import { InvitationInformation, TeamInfo, useInvitationCodeVerificationMutation } from "../../generated/graphql";
import { SVGBackground } from "../authorization/assets/svg";
import EntityAvatar from "../common/entity-avatar-next/entity-avatar";
import SnackbarContainer from "../common/snackbar/snackbarContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    backgroundContainerRoot: {
      height: "100vh",
      width: "100vw",
      position: "relative",
    },
    containerRoot: {
      display: "flex",
      height: "100vh",
      position: "relative",
      justifyContent: "center",
    },
    paperContainer: {
      alignItems: "center",
      justifyContent: "space-evenly",
      width: "100%",
      maxWidth: 470,
      minWidth: 470,
      minHeight: 520,
      display: "flex",
      flexDirection: "column",
      position: "absolute",
      top: "50%",
      marginTop: -332,
      boxShadow:
        "0px 5px 6px -3px rgba(247, 247, 247, 0.2), 0px 9px 12px 1px rgba(241, 227, 227, 0.14), 0px 16px 22px 15px rgba(96, 96, 96, 0.12)",
    },
    backgroundImg: {
      width: "100%",
      height: "100%",
      position: "fixed",
      pointerEvents: "none",
    },
    backdrop: {
      zIndex: theme.zIndex.drawer + 1,
      color: "#fff",
    },
    loginPanel: {
      top: 66,
      alignItems: "center",
      display: "flex",
      flexDirection: "column",
      justifyContent: "space-evenly",
    },
    logo: {
      marginBottom: 12,
    },
    descriptionBox: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      flexWrap: "wrap",
      marginBottom: 32,
      maxWidth: "80%",
    },
    descriptionText: {
      fontSize: 18,
      color: "#737373",
    },
    teamLogo: {
      minWidth: 20,
      width: 20,
      height: 20,
      marginLeft: 4,
    },
    name: {
      fontSize: 18,
      // marginLeft: 4,
      // marginRight: 4,
      color: "#333",
      fontWeight: 500,
    },
    button: {
      width: 168,
      borderRadius: 4,
      marginTop: 32,
    },
    error: {
      fontSize: 16,
      color: "#666",
    },
  }),
);

interface InvitationProps {
  invitationInfo?: InvitationInformation;
  team?: TeamInfo;
}

function storeAccessToken(token: string): void {
  setCookie(null, "access_token", token, {
    maxAge: 7 * 24 * 60 * 60,
    path: "/",
  });
}

const Invitation: React.FunctionComponent<InvitationProps> = (props) => {
  const classes = useStyles();
  const { openSnackbar } = SnackbarContainer.useContainer();

  const { invitationInfo, team } = props;

  const [, executeInvitationCodeVerificationMutation] = useInvitationCodeVerificationMutation();

  const [fetching, setFetching] = useState(false);

  function onJoinButtonClick(): void {
    if (!invitationInfo || !invitationInfo.invitationCode) {
      return;
    }
    setFetching(true);
    executeInvitationCodeVerificationMutation({
      code: invitationInfo.invitationCode,
    }).then((res) => {
      if (res.data?.invitationCodeVerification) {
        const token = res.data.invitationCodeVerification.accessTokenString;
        token && storeAccessToken(token);
        setFetching(false);
        window.location.href = "/dashboard";
        return;
      }
      if (res.error) {
        if (res.error.message?.includes("Exhaustion of purchases")) {
          setFetching(false);
          openSnackbar("已达人数上限，请联系管理员！", "error");
          return;
        }
      }
      setFetching(false);
      openSnackbar("加入失败，请稍后再试！", "error");
    });
  }

  function teamComponent(): ReactNode {
    return (
      <Grid container spacing={1} className={classes.loginPanel}>
        <img src={RimeDataChineseWebP} className={classes.logo} />
        <div className={classes.descriptionBox}>
          {team ? (
            <>
              <Typography className={classes.descriptionText}>
                您已经是 <span className={classes.name}>{team.name}</span> 的成员，
              </Typography>
              <Typography className={classes.descriptionText}>不能再加入其他的机构！</Typography>
            </>
          ) : (
            <Typography className={classes.error}>您已经有所属机构，不能加入其他的机构！</Typography>
          )}
        </div>
        <img src={BannerWebP} />
        <Button
          size="medium"
          color="primary"
          variant="contained"
          className={classes.button}
          onClick={(): void => {
            window.location.href = "/team-members";
          }}
        >
          查看机构成员
        </Button>
      </Grid>
    );
  }

  function invitationComponent(): ReactNode {
    return (
      <Grid container spacing={1} className={classes.loginPanel}>
        <img src={RimeDataChineseWebP} className={classes.logo} />
        <div className={classes.descriptionBox}>
          {invitationInfo ? (
            <>
              <Typography className={classes.descriptionText}>
                <span className={classes.name}>{invitationInfo.invitee}</span> 邀请您加入
              </Typography>
              {invitationInfo.logoUrl ? (
                <EntityAvatar src={invitationInfo.logoUrl} className={classes.teamLogo} />
              ) : null}
              <Typography className={classes.name}> {invitationInfo.teamName}</Typography>
            </>
          ) : (
            <Typography className={classes.error}>找不到对应的邀请信息或邀请已过期</Typography>
          )}
        </div>
        <img src={BannerWebP} />
        <Button
          size="medium"
          color="primary"
          variant="contained"
          className={classes.button}
          disabled={!invitationInfo}
          onClick={onJoinButtonClick}
        >
          加入机构
        </Button>
      </Grid>
    );
  }

  return (
    <div className={classes.backgroundContainerRoot}>
      <SVGBackground className={classes.backgroundImg} />
      <Container classes={{ root: classes.containerRoot }}>
        <Paper className={classes.paperContainer}>{team ? teamComponent() : invitationComponent()}</Paper>
      </Container>
      <Backdrop className={classes.backdrop} open={fetching}>
        <CircularProgress color="inherit" size={30} />
      </Backdrop>
    </div>
  );
};

export default Invitation;
