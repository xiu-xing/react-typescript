import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect } from "react";
import AppDownload from "../app-download/app-download";
import Android from "./assets/android.webp";
import Ios from "./assets/ios.webp";

export enum Platform {
  Ios = "IOS",
  Android = "ANDROID",
  Web = "WEB",
}

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100vw",
      height: "100vh",
      background: "#343434",
      padding: "20px",
    },
  }),
);

interface ShareProps {
  innerLink: string;
  platform: Platform;
  isWeChat: boolean;
}

const Share: React.FunctionComponent<ShareProps> = (props: ShareProps) => {
  const classes = useStyles();

  useEffect(() => {
    window.onload = (): void => {
      window.location.href = `rimedata://rimedata/${props.innerLink}`;
    };
  }, [props.innerLink]);

  return props.isWeChat ? (
    <Box className={classes.root}>
      <img style={{ width: "100%" }} src={props.platform == Platform.Ios ? Ios : Android} />
    </Box>
  ) : (
    <AppDownload />
  );
};

export default Share;
