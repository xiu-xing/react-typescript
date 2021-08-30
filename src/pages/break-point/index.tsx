import {
  Box,
  Button,
  createStyles,
  makeStyles,
  Typography,
} from "@material-ui/core";
import { green } from "@material-ui/core/colors";
import React from "react";
import Audio from "../../components/audio";

const useStyles = makeStyles((theme) => createStyles({
  root:{
    color:theme.palette.primary.main,
    padding: theme.spacing(1),
    [theme.breakpoints.down('sm')]: {
      backgroundColor: green[500],
    },
    [theme.breakpoints.only('md')]: {
      backgroundColor: "red",
    },
    [theme.breakpoints.down('lg')]: {
      backgroundColor: theme.palette.background.default,
    },
  },
  btn:{
    color:theme.palette.primary.main,
  }
}));
const BreakPoint: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  return (
    <Box className={classes.root}>
      <Typography>{"down(sm): red"}</Typography>
      <Typography>{"up(md): blue"}</Typography>
      <Typography>{"up(lg): green"}</Typography>
      {/* <Button variant="contained" className={classes.btn}>Overrides CSS</Button> */}
      <Audio/>
    </Box>
  );
};

export default BreakPoint;
