import { Grid, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import qr from "../../profile/content/tab-panel/assets/qr.jpeg";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
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
    gridItem: {
      display: "flex",
      flexDirection: "column",
      justifyContent: "center",
    },
  }),
);

const ContactInformation: React.FunctionComponent = () => {
  const classes = useStyles();
  return (
    <Grid container spacing={3}>
      <Grid item className={classes.gridItem}>
        <img className={classes.qrImg} src={qr} />
        <Typography className={classes.contactInfo} style={{ textAlign: "center" }}>
          客服微信
        </Typography>
      </Grid>
      <Grid item className={classes.gridItem}>
        <Typography className={classes.contactInfoTitle}>联系我们</Typography>
        <Typography className={classes.contactInfo}>周一至周五 09:00 - 18:00</Typography>
        <Typography className={classes.contactInfo}>周六至周日 12:00 - 18:00</Typography>
      </Grid>
    </Grid>
  );
};

export default ContactInformation;
