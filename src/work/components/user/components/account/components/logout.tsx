import { createStyles, makeStyles } from "@material-ui/core/styles";
import { ExitToApp } from "mdi-material-ui";
import { destroyCookie } from "nookies";
import React from "react";
import Card from "../../card";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    icon: {
      color: "#66778B",
      fontSize: "56px",
    },
  }),
);

const Logout: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  return (
    <Card
      showSubtitle={false}
      icon={<ExitToApp className={classes.icon} />}
      title="退出登录"
      onClick={(): void => {
        destroyCookie(null, "access_token", {
          path: "/",
        });
        window.location.href = "/login";
      }}
    />
  );
};

export default Logout;
