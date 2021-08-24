import { Button, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import UserContainer from "../../../../../../../../../containers/userContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      display: "flex",
      zIndex: 998,
      alignItems: "center",
      justifyContent: "center",
      flexDirection: "column",
      padding: "24px 0px",
      backgroundColor: "rgba(255, 255, 255, 0.6)",
    },
    title: {
      color: theme.palette.grey[800],
      fontSize: 20,
      fontWeight: 500,
      marginBottom: 8,
    },
    subtitle: {
      color: "#737373",
      fontSize: 16,
      marginBottom: 16,
    },
    button: {
      height: 46,
      width: 100,
      fontSize: 16,
    },
  }),
);

export const AccessControlPlaceholder: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const { setActiveServiceDialogOpen } = UserContainer.useContainer();

  return (
    <div className={classes.root}>
      <Typography className={classes.title}>购买正式账号，查看全量数据，解锁全部功能</Typography>
      <Typography className={classes.subtitle}>Rime Data 拥有丰富的一级市场研究数据，助您全面掌握市场新动态</Typography>
      <Button
        size="small"
        className={classes.button}
        variant="contained"
        disableElevation
        color="primary"
        onClick={() => setActiveServiceDialogOpen(true)}
      >
        点击购买
      </Button>
    </div>
  );
};
