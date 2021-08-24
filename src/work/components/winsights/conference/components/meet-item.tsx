import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import { Box } from "@material-ui/core";
import { InsightSource } from "..";

const useStyles = makeStyles(() => ({
  root: {
    display: "flex",
    marginRight: "16px",
    marginBottom: "16px",
    alignItems: "center",
    height: "152px",
    cursor: "pointer",
  },
  image: {
    width: 90,
    height: 120,
    borderRadius: "4px",
    margin: "16px",
    objectFit: "cover",
    objectPosition: "center",
  },
  content: {
    // width: "284px",
    minWidth: 10,
  },
  title: {
    fontSize: 16,
    fontWeight: 500,
    color: "#333333",
    marginTop: "4px",
    whiteSpace: "nowrap",
    overflow: "hidden",
    textOverflow: "ellipsis",
    textAlign: "start",
  },
  subtitle: {
    fontSize: 14,
    fontWeight: 500,
    color: "#666666",
    marginTop: "6px",
    whiteSpace: "nowrap",
    overflow: "hidden",
    textOverflow: "ellipsis",
    textAlign: "start",
  },
  time: {
    marginTop: "34px",
    display: "flex",
  },
  date:{
    fontSize: 14,
    fontWeight: 500,
    color: "#666666",
  },
  play: {
    fontSize: 14,
    fontWeight: 500,
    color: "#666666",
    marginLeft: "16px",
    textAlign: "start",
  },
}));

const MeetItem: React.FunctionComponent<{ data: InsightSource }> = (props) => {
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
        window.open("/winsights/detail?insId=" + props.data.insId);
      }}
    >
      <img
        className={classes.image}
        src={`${process.env.NEXT_PUBLIC_WINSIGHTS}/attachment/${props.data.imgShowPath}`}
      />
      <Box className={classes.content}>
        <Box minWidth={10}>
          <Typography className={classes.title}>{props.data.insTitle}</Typography>
          <Typography className={classes.subtitle}>{props.data.insSubTitle}</Typography>
        </Box>
        <Box className={classes.time}>
          <Typography className={classes.date}>{timestampToTime(props.data.date)}</Typography>
          <Typography className={classes.play}>{props.data.insMediaLen} 分钟</Typography>
        </Box>
      </Box>
    </Box>
  );
};

export default MeetItem;
