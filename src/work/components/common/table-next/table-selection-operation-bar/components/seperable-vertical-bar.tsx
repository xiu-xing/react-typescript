import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, {CSSProperties} from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: 1,
      height: 40,
      backgroundColor: "#000",
      opacity: 0.1,
      marginLeft: ({marginLeft}: SeperableVerticalBarProps): CSSProperties['marginLeft'] => marginLeft,
      marginRight: ({marginRight}: SeperableVerticalBarProps): CSSProperties['marginRight'] => marginRight,
    },
  }),
);

interface SeperableVerticalBarProps {
  marginLeft?: number
  marginRight?: number
}

const SeperableVerticalBar: React.FunctionComponent<SeperableVerticalBarProps> = props => {
  const classes = useStyles(props);
  return <Box className={classes.root} />;
}

export default SeperableVerticalBar;
