import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { HTMLProps } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
    },
    title: {
      fontSize: 20,
      color: "#5F6368",
      margin: "12px 8px",
    },
    content: {},
  }),
);

interface DashboardSectionProps extends HTMLProps<HTMLDivElement> {
  heading: string;
}

const DashboardSection: React.FunctionComponent<DashboardSectionProps> = (props) => {
  const classes = useStyles();
  const { heading, children } = props;

  return (
    <div className={classes.root}>
      <Typography className={classes.title}>{heading}</Typography>
      <div className={classes.content}>{children}</div>
    </div>
  );
};

export default DashboardSection;
