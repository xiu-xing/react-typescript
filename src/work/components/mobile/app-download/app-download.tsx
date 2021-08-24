import { Button, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { AndroidTwoTone } from "@material-ui/icons";
import clsx from "clsx";
import { Apple } from "mdi-material-ui";
import Head from "next/head";
import { useRouter } from "next/router";
import React, { useEffect, useMemo, useState } from "react";
import { RimeDataChinesewhiteWebP } from "../../../assets/webp/rime";
import { BrowserPlatform } from "../../../utils/browser";
import { BackgroundPNG, LOGO, RimeData } from "./assets";
import SwiperDisplay from "./components/swiper";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "relative",
      minHeight: "100vh",
    },
    titleBox: {
      display: "flex",
      justifyContent: "center",
      paddingTop: 16,
    },
    subtitle: {
      fontSize: 18,
      marginTop: 12,
      marginBottom: 24,
      textAlign: "center",
    },
    rimeDataTextPrimaryIcon: {
      width: 202,
      height: 24,
    },
    swiperBox: {
      minHeight: 346,
      backgroundImage: `url(${BackgroundPNG})`,
      backgroundSize: "100%",
      backgroundRepeat: "no-repeat",
    },
    bottomBox: {
      position: "absolute",
      zIndex: 1,
      top: "60%",
      bottom: 0,
      left: 0,
      right: 0,

      background: `linear-gradient(180deg, #A2C4F1 0%, #4F709B 100%)`,
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      paddingTop: 32,
    },
    rimeSquareIcon: {
      position: "absolute",
      top: -30,
      width: 64,
      height: 64,
    },
    rimeDataTextIconBox: {
      marginTop: 12,
    },
    rimeDataTextIcon: {
      height: 16,
      width: 134,
    },
    button: {
      backgroundColor: "#fff",
      color: theme.palette.primary.main,
      width: 210,
      borderRadius: 8,
      height: 43,
      textTransform: "none",
    },
    iosButton: {
      marginTop: 24,
    },
    androidButton: {
      marginTop: 16,
    },
    buttonIcon: {
      marginRight: 4,
      maxHeight: 20,
      maxWidth: 20,
    },
  }),
);

const AppDownload: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const router = useRouter();

  const [screenWidth, setScreenWidth] = useState(process.browser ? window.screen.availWidth : 0);

  function onDownloadButtonClick(): void {
    if (process.env.NEXT_PUBLIC_APP_DOWNLOAD) {
      window.open(process.env.NEXT_PUBLIC_APP_DOWNLOAD, "_self");
    }
  }

  function resizeHandler(): void {
    if (!BrowserPlatform.isMobile()) {
      router.push("/");
      return;
    }
    setScreenWidth(window.screen.availWidth);
  }

  useEffect(() => {
    if (!BrowserPlatform.isMobile()) {
      router.push("/");
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    window.addEventListener("resize", resizeHandler);
    return (): void => {
      window.removeEventListener("resize", resizeHandler);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const swiperNode = useMemo(() => {
    return <SwiperDisplay key={screenWidth} />;
  }, [screenWidth]);

  return (
    <>
      <Head>
        <title>RimeData</title>
      </Head>
      <div className={classes.root}>
        <div className={classes.titleBox}>
          <img src={RimeData} className={classes.rimeDataTextPrimaryIcon} />
        </div>
        <div className={classes.swiperBox}>
          <Typography className={classes.subtitle}>全面的一级市场数据平台</Typography>
          {swiperNode}
        </div>
        <div className={classes.bottomBox}>
          <LOGO className={classes.rimeSquareIcon}/>
          <div className={classes.rimeDataTextIconBox}>
            <img src={RimeDataChinesewhiteWebP} className={classes.rimeDataTextIcon} />
          </div>
          <Button
            className={clsx(classes.button, classes.iosButton)}
            variant="contained"
            onClick={onDownloadButtonClick}
          >
            <Apple className={classes.buttonIcon} fontSize="small" />
            iOS 下载
          </Button>
          <Button
            className={clsx(classes.button, classes.androidButton)}
            variant="contained"
            onClick={onDownloadButtonClick}
          >
            <AndroidTwoTone className={classes.buttonIcon} style={{ fontSize: 16 }} />
            Android 下载
          </Button>
        </div>
      </div>
    </>
  );
};

export default AppDownload;
