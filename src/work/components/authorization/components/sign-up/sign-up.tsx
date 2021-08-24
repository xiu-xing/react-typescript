import { Box, createStyles, makeStyles, Tab, Tabs } from "@material-ui/core";
import React, { ChangeEvent, ReactNode, useState } from "react";
import PasswordSetting from "./components/password-setting";
import SignUpWithInvitationCode from "./components/sign-up-with-invitation-code";
import SignUpWithVerificationCode from "./components/sign-up-with-verification-code";
import SignUpContainer from "./signUpContainer";

export const useStyles = makeStyles(
  createStyles({
    root: {
      marginTop: 8,
    },
    tabsRoot: {
      minHeight: 40,
    },
    tabRoot: {
      minWidth: 107,
      minHeight: 40,
      fontSize: 14,
    },
    pannelBox: {
      marginTop: 32,
    },
  }),
);

const SignUpDisplay: React.FunctionComponent = () => {
  const classes = useStyles();

  const { signUpStep } = SignUpContainer.useContainer();
  const [selectedTabIndex, setSelectedTabIndex] = useState(0);

  function onTabsChange(event: ChangeEvent<{}>, newValue: number): void {
    setSelectedTabIndex(newValue);
  }

  function contentComponent(): ReactNode {
    switch (signUpStep) {
      case "verification": {
        return (
          <Box className={classes.root}>
            <Tabs
              classes={{ root: classes.tabsRoot }}
              textColor="primary"
              indicatorColor="primary"
              value={selectedTabIndex}
              onChange={onTabsChange}
            >
              <Tab label="新用户注册" classes={{ root: classes.tabRoot }} />
              <Tab label="我有邀请码" classes={{ root: classes.tabRoot }} />
            </Tabs>
            <Box className={classes.pannelBox} display={selectedTabIndex === 0 ? "" : "none"}>
              <SignUpWithVerificationCode />
            </Box>
            <Box className={classes.pannelBox} display={selectedTabIndex === 1 ? "" : "none"}>
              <SignUpWithInvitationCode />
            </Box>
          </Box>
        );
      }
      case "settingPassword":
        return <PasswordSetting />;
    }
  }

  return <>{contentComponent()}</>;
};

const SignUp: React.FunctionComponent = () => {
  return (
    <SignUpContainer.Provider>
      <SignUpDisplay />
    </SignUpContainer.Provider>
  );
};

export default SignUp;
