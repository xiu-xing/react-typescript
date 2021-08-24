import { Box, BoxProps } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import clsx from 'clsx'

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      flexGrow: 1,
    },
  }),
);


const FlexGrowBox: React.FunctionComponent<BoxProps> = ({className, ...props}) => {
  const classes = useStyles();
  return <Box {...props} className={clsx(className, classes.root)} />;
}

export default FlexGrowBox;
