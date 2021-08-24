import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import Box from "@material-ui/core/Box";
import { Information, User, Arrow, Team, Trans, Release } from "../../assets";

const useStyles = makeStyles(() => ({
  root: {
    display: "flex",
    alignItems: "center",
  },
  icon: {
    marginRight: "12px",
    marginLeft: "24px",
  },
  content: {
    fontSize: 14,
    color: "#333333",
    marginRight: "24px",
  },
}));

const Process: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  return (
    <Box className={classes.root}>
      <Release className={classes.icon} style={{ fontSize: 24 }} />
      <Typography className={classes.content}>发布需求</Typography>
      <Arrow style={{ fontSize: 32 }} />
      <Team className={classes.icon} style={{ fontSize: 28 }} />
      <Typography className={classes.content}>团队跟进</Typography>
      <Arrow style={{ fontSize: 32 }} />
      <User className={classes.icon} style={{ fontSize: 20 }} color="primary" />
      <Typography className={classes.content}>专家匹配</Typography>
      <Arrow style={{ fontSize: 32 }} />
      <Information className={classes.icon} style={{ fontSize: 24 }} />
      <Typography className={classes.content}>完成约谈</Typography>
      <Arrow style={{ fontSize: 32 }} />
      <Trans className={classes.icon} style={{ fontSize: 24 }} />
      <Typography className={classes.content}>完成约谈</Typography>
    </Box>
  );
};
export default Process;
