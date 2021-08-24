import React from "react";
import { makeStyles, createStyles, Typography } from "@material-ui/core";

interface TitleProps {
  title: string;
}

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      alignItems: "center",
      marginTop: "22px",
      marginBottom: "22px",
    },
    title: {
      textAlign: "center",
      fontSize: "20px",
      color: "#5F6368",
      marginLeft: "18px",
      marginRight: "18px",
    },
    lDivider: {
      flex: 1,
      height: "1px",
      background: "linear-gradient(45deg,#fff,rgba(0,0,0,.3))",
    },
    rDivider: {
      flex: 1,
      height: "1px",
      background: "linear-gradient(45deg,rgba(0,0,0,.3),#fff)",
    },
  }),
);

const Title: React.FC<TitleProps> = props => {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <div className={classes.lDivider} />
      <Typography className={classes.title} noWrap>
        {props.title}
      </Typography>
      <div className={classes.rDivider} />
    </div>
  );
};

export default Title;
