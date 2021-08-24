import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import { Box } from "@material-ui/core";
import { ExportSource } from "./idea";

const useStyles = makeStyles(() => ({
  root: {
    display: "flex",
    marginRight: "16px",
    marginBottom: "16px",
    cursor: "pointer",
  },
  image: {
    width: 60,
    height: 88,
    borderRadius: "4px",
    margin: "0 16px",
    objectFit: "cover",
    objectPosition: "center",
  },
  content: {
    maxWidth: "290px",
    marginBottom: "16px",
  },
  title: {
    fontSize: 14,
    fontWeight: 500,
    color: "#333333",
    whiteSpace: "nowrap",
    overflow: "hidden",
    textOverflow: "ellipsis",
  },
  subtitle: {
    fontSize: 12,
    color: "#666666",
    marginTop: "2px",
    whiteSpace: "nowrap",
    overflow: "hidden",
    textOverflow: "ellipsis",
  },
  time: {
    marginTop: "18px",
  },
  date: {
    fontSize: 12,
    color: "#666666",
  },
  play: {
    marginLeft: "12px",
    fontSize: 12,
    color: "#666666",
  },
}));

const MeetCard: React.FunctionComponent<{ data: ExportSource }> = (props) => {
  const classes = useStyles();

  function timestampToTime(timestamp: string) {
    const date = new Date(timestamp);
    const formatDate = `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`;
    return formatDate;
  }

  return (
    <Box
      className={classes.root}
      onClick={() => {
        window.open("/winsights/detail?insId=" + props.data.id);
      }}
    >
      <img
        className={classes.image}
        src={`${process.env.NEXT_PUBLIC_WINSIGHTS}/attachment/${props.data.imgShowPath}`}
      />
      <Grid className={classes.content}>
        <Grid item>
          <Typography className={classes.title}>{props.data.insTitle}</Typography>
          <Typography className={classes.subtitle}>{props.data.insSubTitle}</Typography>
        </Grid>
        <Grid item container className={classes.time}>
          <Typography className={classes.date}>{timestampToTime(props.data.date)}</Typography>
          <Typography className={classes.play}>{props.data.insMediaLen} 分钟</Typography>
        </Grid>
      </Grid>
    </Box>
  );
};

export default MeetCard;
