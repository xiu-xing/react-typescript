import { Box, Button, createStyles, makeStyles, Typography } from "@material-ui/core";
import Head from "next/head";
import React from "react";
import CopyToClipboard from "react-copy-to-clipboard";
import { MobileInvitationSVG } from "../../../assets/svg/mobile-invitation";
import { SVGRIMECHINESE } from "../../../assets/svg/rime";
import { baseUrl } from "../../../utils/url";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      justifyContent: "center",
    },
    content: {
      padding: "32px 0px 0px 0px",
      width: "100%",
    },
    title: {
      color: "#333",
      fontSize: "18px",
      textAlign: "center",
    },
    subtitle: {
      color: "#999",
      fontSize: "16px",
      textAlign: "center",
    },
    linkText: {
      color: "#333",
      fontSize: "16px",
      textAlign: "center",
      maxLines: 1,
      textOverflow: "ellipsis",
      overflow: "hidden",
      whiteSpace: "nowrap",
    },
    linkArea: {
      padding: "16px 32px",
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    link: {
      display: "flex",
      padding: "0px 16px 0px 16px",
      backgroundColor: "rgba(102, 140, 157,0.06)",
      borderRadius: 4,
      minWidth: 311,
      height: 44,
      alignItems: "center",
    },
    detailArea: {
      display: "flex",
      margin: "20px 0px 0px 0px",
      alignItems: "center",
      flexFlow: "column",
    },
    detailInfo: {
      width: "80%",
      display: "flex",
      padding: "12px 0px",
      justifyContent: "space-between",
    },
    detailTitleText: {
      color: "rgba(166, 166, 166, 1)",
      fontSize: "16px",
      minWidth: "25%",
    },
    detailInfoText: {
      color: "#333",
      fontSize: "16px",
      overflow: "hidden",
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
      maxLines: 1,
    },
    BtnArea: {
      padding: "0px 32px",
      marginTop: "-30px",

      display: "flex",
      flexFlow: "column",
    },
    BtnText: {
      fontSize: "16px",
    },
    Btn: {
      height: "47px",
    },
    bannerArea: {
      padding: "16px 32px",
      display: "flex",
      width: "100%",
      alignItems: "center",
      justifyContent: "center",
    },
    banner: {
      minWidth: "200px",
      minHeight: "24px",
    },
    imageArea: {
      display: "flex",
      width: "100%",
      padding: "16px 32px 0px 32px",
      alignItems: "center",
      justifyContent: "center",
    },
    backgroundImage: {
      width: "247px",
      height: "135px",
    },
  }),
);

interface InvitationProps {
  invitationCode: string;
}

const MobileInvitationDisplay: React.FunctionComponent<InvitationProps> = (props) => {
  const classes = useStyles();
  const { invitationCode } = props;

  return (
    <>
      <Head>
        <title>RimeData</title>
      </Head>
      <Box className={classes.root}>
        <Box className={classes.content}>
          {/* <RimeDataChineseWebP></RimeDataChineseWebP> */}
          <Box className={classes.bannerArea}>
            <SVGRIMECHINESE className={classes.banner} />
          </Box>
          <Typography className={classes.title}>全面的一级市场数据平台</Typography>
          <Box height="24px" />
          <Typography className={classes.subtitle}>邀请码</Typography>
          <Box className={classes.linkArea}>
            <Box className={classes.link}>
              <Typography className={classes.linkText}>{`${baseUrl()}/invitation/${invitationCode}`}</Typography>
            </Box>
          </Box>

          <Box className={classes.imageArea}>
            <MobileInvitationSVG className={classes.backgroundImage} />
          </Box>

          <Box className={classes.BtnArea}>
            <CopyToClipboard text={`${process.env.NEXT_PUBLIC_WEB_HOST}/invitation/${invitationCode}`}>
              <Button
                className={classes.Btn}
                variant="contained"
                color="primary"
                onClick={(): void => {
                  window.location.href = `${process.env.NEXT_PUBLIC_APP_DOWNLOAD}`;
                }}
                disableElevation
              >
                <Typography noWrap className={classes.BtnText}>
                  复制链接加入机构
                </Typography>
              </Button>
            </CopyToClipboard>
            <Box height="24px" />

            <Button
              className={classes.Btn}
              variant="outlined"
              color="primary"
              onClick={(): void => {
                window.location.href = `${process.env.NEXT_PUBLIC_APP_DOWNLOAD}`;
              }}
            >
              <Typography noWrap className={classes.BtnText}>
                下载 RIME DATA APP
              </Typography>
            </Button>
          </Box>
        </Box>
      </Box>
    </>
  );
};

export default MobileInvitationDisplay;
