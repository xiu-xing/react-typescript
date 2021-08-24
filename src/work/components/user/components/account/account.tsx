import { Box, createStyles, makeStyles, Theme } from "@material-ui/core";
import React from "react";
import CounterContainer from "../../../../containers/counterContainer";
import Title from "../title";
import Logout from "./components/logout";
import UserAvatar from "./components/user-avatar/user-avatar";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      maxWidth: "1285px",
      margin: "auto",
      marginTop: 24,
    },
    cards: {
      display: "grid",
      gridTemplateColumns: "repeat(2,1fr)",
      gridGap: "16px 24px",
      [theme.breakpoints.down("sm")]: {
        gridTemplateColumns: "1fr",
      },
    },
  }),
);

const Account: React.FC = () => {
  const classes = useStyles();

  return (
    <Box className={classes.root}>
      <Title title="账号信息" />
      <Box className={classes.cards}>
        {/* <Basic /> */}
        <CounterContainer.Provider>
          <UserAvatar />
        </CounterContainer.Provider>
        {/* <CounterContainer.Provider>
          <Phone />
        </CounterContainer.Provider> */}
        {/* <CounterContainer.Provider>
          <Mail />
        </CounterContainer.Provider> */}
        {/* <CounterContainer.Provider>
          <Password />
        </CounterContainer.Provider> */}
        <Logout />
        {/* <Binding />
        <Notification /> */}
      </Box>
    </Box>
  );
};

export default Account;
