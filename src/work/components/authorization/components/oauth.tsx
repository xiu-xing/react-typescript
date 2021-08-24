import React from "react";
import { Grid } from "@material-ui/core";
// import { Grid, IconButton } from "@material-ui/core";
// import { makeStyles, createStyles } from "@material-ui/core/styles";

// // TODO Icon placeholder
// import FacebookIcon from "@material-ui/icons/Facebook";

// const useStyles = makeStyles(() =>
//   createStyles({
//     authIcon: {
//       backgroundColor: "#d5d5d5",
//     },
//   }),
// );

const OAuth: React.FunctionComponent = () => {
  // const classes = useStyles();

  return (
    <>
      {/* OAuth */}
      <Grid justify="center" alignItems="center" direction="row" container spacing={4}>
        {/* <Grid item>
          <IconButton className={classes.authIcon} aria-label="upload picture" component="span">
            <FacebookIcon />
          </IconButton>
        </Grid> */}

        {/* <Grid item>
          <IconButton className={classes.authIcon} aria-label="upload picture" component="span">
            <FacebookIcon />
          </IconButton>
        </Grid> */}
      </Grid>
    </>
  );
};

export default OAuth;
