import { Paper, Button, Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import Tippy from "@tippyjs/react";

import { contactService, rimeLogo, RimeDataLogo, ContactUs } from "../assets";
import { AppQrcodePNG } from "../../../assets/png";

import React, { HTMLAttributes } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "fixed",
      top: 0,
      left: 0,
      width: "100%",
      height: "48px",
      backgroundColor: "#fff",
      padding: "0 24px",
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
    },
    logoSvg: {
      width: "110px",
      height: "18px",
    },
    btnGroup: {
      display: "flex",
      alignItems: "center",
    },
    content: {
      width: "auto",
      padding: "12px 16px",
      display: "flex",
      flexDirection: "column",
    },
    qrcode: {
      width: 152,
      height: 152,
    },
    contactCont: {
      padding: "18px 23px 18px 18px",
      display: "flex",
      color: "#666666",
      fontSize: "14px",
      "& img": {
        width: "100px",
        height: "100px",
      },
    },
    contactLeft: {
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
    },
    contactRight: {
      marginLeft: "12px",
      lineHeight: "24px",
      display: "flex",
      flexDirection: "column",
      justifyContent: "flex-start",
      whiteSpace: "nowrap",
      "& h5": {
        margin: 0,
        fontSize: "16px",
        color: "#333",
      },
    },
    rimeAppLogo: {
      width: "24px",
      height: "24px",
      borderRadius: "4px",
    },
    headerLogoLabel: {
      marginLeft: "4px",
    },
    contactUsLogo: {
      width: "24px",
      height: "24px",
    },
  }),
);

type HeaderProps = HTMLAttributes<HTMLDivElement>;

const Header: React.FunctionComponent<HeaderProps> = () => {
  const classes = useStyles();

  function renderContactContent() {
    return (
      <Paper>
        <Box className={classes.contactCont}>
          <div className={classes.contactLeft}>
            <img src={contactService} alt="" />
            <span>客服微信</span>
          </div>
          <div className={classes.contactRight}>
            <h5>联系我们</h5>
            <div>客服微信: rimedata_service</div>
            <div>试用及采购: sales@rimepevc.com</div>
            <div>客户服务: service@rimepevc.com</div>
          </div>
        </Box>
      </Paper>
    );
  }

  return (
    <div className={classes.root}>
      <RimeDataLogo className={classes.logoSvg} />
      <div className={classes.btnGroup}>
        <Tippy
          duration={0}
          content={
            <Box className={classes.content}>
              <img src={AppQrcodePNG} alt="" className={classes.qrcode} />
            </Box>
          }
          interactive={true}
          trigger="mouseenter"
          hideOnClick={false}
          maxWidth="none"
        >
          <Button color="primary" size="small" style={{ marginRight: "10px" }}>
            <img src={rimeLogo} alt="" className={classes.rimeAppLogo} />
            <span className={classes.headerLogoLabel}>下载 RIME APP</span>
          </Button>
        </Tippy>
        <Tippy
          duration={0}
          content={renderContactContent()}
          interactive={true}
          trigger="mouseenter"
          hideOnClick={false}
          maxWidth="none"
        >
          <Button color="primary" size="small">
            <ContactUs className={classes.contactUsLogo} />
            <span className={classes.headerLogoLabel}>联系我们</span>
          </Button>
        </Tippy>
      </div>
    </div>
  );
};

export default Header;
