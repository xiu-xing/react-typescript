import { Box, Button, createStyles, Dialog, makeStyles, Slide, Theme, Typography } from "@material-ui/core";
import { Provider as MuseProvider } from "@momentum-valley/muse-js";
import { Provider } from "jotai";
import { ChevronRight } from "mdi-material-ui";
import { useRouter } from "next/router";
import { destroyCookie } from "nookies";
import React, { ReactNode, useEffect, useState } from "react";
// import AppbarContainer from "../../../containers/appbarContainer";
import AppContainer from "../../../containers/appContainer";
import UserContainer from "../../../containers/userContainer";
import { Role, UserInformation } from "../../../generated/graphql";
import { muse } from "../../../muse";
import { SVGBackground } from "../../authorization/assets/svg";
import AuthorizationContent from "../../authorization/authorization";
import AuthorizationContainer from "../../authorization/authorizationContainer";
import ContactInformation from "../../common/contact-information";
import ActiveServiceDialog from "../../common/dialog/active-service-dialog";
import EmailVerificationDialogs from "../../common/dialog/email-verification-dialog/email-verification-dialog";
import GlobalMessageDialog from "../../common/dialog/global-message-dialog/global-message-dialog";
import DrawerContainer from "../../common/drawer/drawerContainer";
import UserProfileContainer from "../../common/user-profile-dialog/userProfileContainer";
import TeamVerification from "../../team-verification/team-verification";
import { Logo } from "./components/appbar-next/assets";
import AppBar from "./components/appbar-next/index-next";
// import AppBar from "./components/appbar-next";
import AppDrawer from "./components/drawer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    disableScroll: {
      height: "100vh",
      overflow: "hidden",
    },
    body: {
      transition: "padding-left 200ms ease-out",
    },
    dialog: {
      "& .MuiDialogContent-root:first-child": {
        paddingTop: 0,
      },
    },
    paper: {
      minWidth: 940,
      minHeight: 67,
    },
    backgroundImg: {
      width: "100%",
      height: "100%",
      position: "absolute",
      pointerEvents: "none",
      backgroundColor: "#fcfcfc",
      zIndex: -1,
    },
    content: {
      width: 480,
      backgroundColor: "white",
      borderRadius: "4px",
      overflow: "auto",
      boxShadow:
        "0px 1px 8px 0px rgba(0, 0, 0, 0.2), 0px 3px 3px -2px rgba(0, 0, 0, 0.12), 0px 3px 4px 0px rgba(0, 0, 0, 0.14)",
    },
    title: {
      backgroundColor: theme.palette.primary.main,
      color: "white",
      padding: "21px 32px",
      display: "flex",
      alignItems: "center",
    },
    description: {
      fontSize: 18,
      lineHeight: "26px",
      fontWeight: 500,
      color: theme.palette.grey[800],
    },
    subDescription: {
      margin: "4px 0 16px 0",
      fontSize: 16,
      lineHeight: "24px",
      color: "#737373",
      fontWeight: 400,
    },
    qrImg: {
      width: 100,
      height: 100,
    },
    contactInfoTitle: {
      marginBottom: "8px",
      fontWeight: 500,
      fontSize: "16px",
      color: "#333333",
    },
    contactInfo: {
      marginBottom: "1px",
      fontWeight: 400,
      fontSize: "14px",
      color: "#666666",
    },
  }),
);

const SkeletonDisplay: React.FunctionComponent<{}> = (props) => {
  const classes = useStyles();
  const { showHeader, showDrawer, disableScroll, showBody, globalDialogStatus, closeDialog, tipsProps } =
    AppContainer.useContainer();

  const { drawerWidth } = DrawerContainer.useContainer();
  const { children } = props;
  const { institutionAuthenticationDialog, setInstitutionAuthenticationDialog } = UserContainer.useContainer();
  function onClose(): void {
    setInstitutionAuthenticationDialog(false);
  }

  return (
    <div className={disableScroll ? classes.disableScroll : ""} style={{ height: "100vh" }}>
      <GlobalMessageDialog />
      {showHeader ? <AppBar /> : null}
      {showDrawer ? <AppDrawer /> : null}
      {/* <Body /> */}
      <div
        className={showDrawer ? classes.body : undefined}
        style={{
          paddingLeft: showDrawer ? drawerWidth : 0,
          display: showBody ? "block" : "none",
          position: "relative",
        }}
      >
        {children}
      </div>
      {/* <BusinessCardVerificationDialog open={institutionAuthenticationDialog} onClose={onClose} initialStep={0} /> */}
      <ActiveServiceDialog />
      {/* <TrailServiceDialog /> */}
      <Dialog className={classes.dialog} onClose={closeDialog} {...globalDialogStatus} />
      {/* <Snackbar {...snackbarProps} /> */}
      <Slide direction="up" in={tipsProps.show} mountOnEnter unmountOnExit>
        <Box
          position="fixed"
          bottom="32px"
          boxShadow="0px 1px 4px 0px rgba(0, 0, 0, 0.2)"
          left="32%"
          right="32%"
          borderRadius={4}
          bgcolor="#F8F8F8"
          zIndex={99999}
          padding="8px 16px"
          display="inline-flex"
          alignItems="center"
        >
          <Typography noWrap style={{ fontSize: 14, fontWeight: 500, flex: 1 }}>
            {tipsProps.msg}
          </Typography>
          <Box
            onClick={() => window.open(tipsProps.link)}
            style={{ display: "inline-flex", alignItems: "center", cursor: "pointer" }}
          >
            <Typography color="primary" style={{ fontSize: 14, fontWeight: 500 }}>
              {tipsProps.linkMsg}
            </Typography>
            <ChevronRight style={{ fontSize: 16 }} color="primary" />
          </Box>
        </Box>
      </Slide>
      <EmailVerificationDialogs />
    </div>
  );
};

interface SkeletonProps {
  user?: UserInformation;
}

const Skeleton: React.FunctionComponent<SkeletonProps> = (props) => {
  const classes = useStyles();
  const router = useRouter();
  const [drawerOpen, setDrawerOpen] = useState<boolean>();

  useEffect(() => {
    const drawerOpenLocalState = sessionStorage.getItem("drawerOpen");

    setDrawerOpen(drawerOpenLocalState === "true" || drawerOpenLocalState === null);
  }, []);

  function contentComponent(): ReactNode {
    if (!props.user) {
      if (process.browser) {
        history.replaceState(null, "RIME", "/login");
      }
      return (
        <AuthorizationContainer.Provider>
          <AuthorizationContent />
        </AuthorizationContainer.Provider>
      );
    }

    // 没有绑定机构;
    if (props.user.role === Role.IndividualFree || props.user.role === Role.IndividualPremium) {
      return (
        <UserContainer.Provider
          initialState={{
            user: props.user,
          }}
        >
          <TeamVerification />
        </UserContainer.Provider>
      );
    }

    // 绑定过机构但过期或是未购买;
    if (props.user.role === Role.Expired || props.user.role === Role.Basic) {
      return (
        <Box
          display="grid"
          position="relative"
          alignItems="center"
          justifyContent="center"
          height="100vh"
          width="100vw"
        >
          <SVGBackground className={classes.backgroundImg} />
          <div className={classes.content}>
            <div className={classes.title}>
              <Logo />
            </div>
            <Box paddingX="32px" paddingY="24px">
              <Box display="flex" justifyContent="space-between" alignItems="center">
                <Typography className={classes.description}>添加下方客服微信，购买正式账号</Typography>
                <Button
                  variant="text"
                  color="primary"
                  onClick={() => {
                    destroyCookie(null, "access_token", {
                      path: "/",
                    });
                    router.push("/login");
                  }}
                >
                  换个账号？
                </Button>
              </Box>
              <Typography className={classes.subDescription}>
                Rime Data 拥有丰富的一级市场研究数据，助您全面掌握市场新动态
              </Typography>
              <ContactInformation />
            </Box>
          </div>
        </Box>
      );
    }

    return (
      <MuseProvider value={muse}>
        <UserContainer.Provider
          initialState={{
            user: props.user,
          }}
        >
          <UserProfileContainer.Provider>
            <Provider>
              {drawerOpen != undefined && (
                <DrawerContainer.Provider initialState={{ drawerOpen: drawerOpen }}>
                  <SkeletonDisplay {...props} />
                </DrawerContainer.Provider>
              )}
            </Provider>
          </UserProfileContainer.Provider>
        </UserContainer.Provider>
      </MuseProvider>
    );
  }

  return <>{contentComponent()}</>;
};

export default Skeleton;
