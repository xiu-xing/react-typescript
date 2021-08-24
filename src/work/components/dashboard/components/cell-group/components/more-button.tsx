import { Button, ButtonProps, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { ChevronRight } from "mdi-material-ui";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
      marginRight: 8,
    },
    label: {
      fontSize: 14,
      fontWeight: 500,
      color: theme.palette.primary.main,
    },
    icon: {
      fontSize: 16,
      color: theme.palette.primary.main,
    },
  }),
);

interface MoreButtonProps extends ButtonProps {}

const MoreButton: React.FunctionComponent<MoreButtonProps> = (props) => {
  const classes = useStyles();

  return (
    <Button {...props} className={classes.root} variant="text">
      <Typography className={classes.label}>更多</Typography>
      <ChevronRight className={classes.icon} />
    </Button>
  );
};

export default MoreButton;
