import { Button, createStyles, Grid, makeStyles, Typography } from "@material-ui/core";
import { DetailSource } from "..";
import React from "react";
import Information from "../../../../icons/Info";
import Audio from "./audio";
import AppContainer from "../../../../containers/appContainer";
import DemandContent from "../../form/demand-content";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
    },
    image: {
      width: 105,
      height: 140,
      borderRadius: "4px",
      objectFit: "cover",
      objectPosition: "center",
    },
    text: {
      flexDirection: "column",
      marginLeft: "24px",
    },
    title: {
      justifyContent: "space-between",
      alignItems: "center",
    },
    tit: {
      fontSize: 20,
      fontWeight: 500,
      color: "#333333",
    },
    subtitle: {
      fontSize: 16,
      fontWeight: 500,
      color: "#737373",
      marginTop: "10px",
      marginBottom: "40px",
    },
    icon: {
      width: "14px",
      height: "14px",
    },
  }),
);

const Header: React.FunctionComponent<{ detail: DetailSource | undefined }> = (props) => {
  const classes = useStyles();
  const { showDialog } = AppContainer.useContainer();

  return (
    <Grid className={classes.root}>
      <img
        className={classes.image}
        src={`${process.env.NEXT_PUBLIC_WINSIGHTS}/attachment/${props?.detail?.imgShowPath}`}
      />
      <Grid container className={classes.text}>
        <Grid container className={classes.title}>
          <Typography className={classes.tit}>{props?.detail?.insTitle}</Typography>
          <Button
            style={{ boxShadow: "none" }}
            variant="contained"
            color="primary"
            size="small"
            startIcon={<Information className={classes.icon} />}
            onClick={() => {
              showDialog({
                fullWidth: true,
                maxWidth: "sm",
                children: <DemandContent />,
              });
            }}
          >
            咨询
          </Button>
        </Grid>
        <Typography className={classes.subtitle}>{props.detail?.insSubTitle}</Typography>
        {props.detail?.videoId && <Audio videoId={props.detail?.videoId} />}
      </Grid>
    </Grid>
  );
};

export default Header;
