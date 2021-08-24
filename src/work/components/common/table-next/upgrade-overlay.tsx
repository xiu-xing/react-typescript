import { Button, Typography, useTheme } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { HTMLProps } from "react";
import UserContainer from "../../../containers/userContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
      position: "absolute",
      width: "100%",
      bottom: 0,
      left: 0,
      right: 0,
      top: 0,
      zIndex: 1000,
      backgroundColor: "rgba(255, 255, 255, 0.8)",
      alignItems: "center",
      justifyContent: "center",
    },
  }),
);

type UpgradeOverlayProps = HTMLProps<HTMLDivElement>;

const UpgradeOverlay: React.FunctionComponent<UpgradeOverlayProps> = (props) => {
  const classes = useStyles();
  const theme = useTheme();
  const { setActiveServiceDialogOpen } = UserContainer.useContainer();

  return (
    <div {...props} className={classes.root}>
      <Typography
        style={{
          color: "#333",
          fontSize: 14,
          fontWeight: theme.typography.fontWeightMedium,
        }}
      >
        购买正式账号，查看全量数据，解锁全部功能
      </Typography>
      <Typography
        style={{
          color: "#666",
          fontSize: 12,
          marginTop: 4,
        }}
      >
        Rime Data 拥有丰富的一级市场研究数据，助您全面掌握市场新动态
      </Typography>
      <Button
        style={{
          marginTop: 8,
        }}
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

export default UpgradeOverlay;
