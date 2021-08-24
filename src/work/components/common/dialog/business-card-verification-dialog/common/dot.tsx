import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: 24,
      height: 24,
      background: "#fff",
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    dot: {
      width: 8,
      height: 8,
      borderRadius: "50%",
      backgroundColor: (props: DotProps): string => (props.color ? props.color : theme.palette.primary.main),
    },
  }),
);

interface DotProps {
  color?: string;
}

const Dot: React.FunctionComponent<DotProps> = (props) => {
  const classes = useStyles(props);
  return (
    <div className={classes.root}>
      <div className={classes.dot} />
    </div>
  );
};

export default Dot;
