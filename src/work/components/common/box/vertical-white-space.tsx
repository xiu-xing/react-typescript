import { Box, BoxProps } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import clsx from "clsx";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: (props: WhiteSpaceProps): number => theme.spacing(props.spacing) + props.height,
      backgroundColor: (props: WhiteSpaceProps): React.CSSProperties["backgroundColor"] =>
        props.backgroundColor ?? "transparent",
    },
  }),
);

interface WhiteSpaceProps extends BoxProps {
  spacing: number;
  height: number;
  backgroundColor?: React.CSSProperties["backgroundColor"];
}

const WhiteSpace: React.FunctionComponent<WhiteSpaceProps> = ({ spacing, height, backgroundColor, ...leftProps }) => {
  const classes = useStyles({ spacing, height, backgroundColor });
  return <Box {...leftProps} className={clsx(leftProps.className, classes.root)} />;
};

export default WhiteSpace;
