import { Box, createStyles, makeStyles } from "@material-ui/core";
import Typography from "@material-ui/core/Typography";
import React, { ReactNode } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      margin: "0 44px",
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      minWidth:218,
    },
    title: {
      fontSize: 16,
      color: "#333333",
      fontWeight: 500,
      marginBottom: "12px",
      marginTop: "16px",
    },
    content: {
      maxWidth: "180px",
      textAlign: "center",
      fontSize: 14,
      fontWeight: 500,
      color: "#666666",
    },
  }),
);

interface AboutUsProps {
  title: string;
  subtitle: string[];
  children: ReactNode;
}

const AboutUs: React.FunctionComponent<AboutUsProps> = (props) => {
  const classes = useStyles();

  return (
    <Box className={classes.root}>
      {props.children}
      <Typography className={classes.title}>{props.title}</Typography>
      {props.subtitle.length > 0 &&
        props.subtitle.map((item, index) => {
          return (
            <Typography className={classes.content} key={index}>
              {item}
            </Typography>
          );
        })}
    </Box>
  );
};

export default AboutUs;
