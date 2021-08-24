import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { HTMLProps } from "react";
import { Placeholder404Mobile } from "../../../../assets/png";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      height: "100%",
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      justifyContent: "center",
    },
    image: {
      width: 244,
      height: 198,
    },
    text: {
      marginTop: 14,
      color: "#A6A6A6",
    },
  }),
);

interface PlaceholderMobileNotFoundProps extends HTMLProps<HTMLDivElement> {}

const PlaceholderMobileNotFound: React.FunctionComponent<PlaceholderMobileNotFoundProps> = ({
  className,
  ...leftProps
}) => {
  const classes = useStyles();

  return (
    <div {...leftProps} className={clsx(classes.root, className)}>
      <img className={classes.image} src={Placeholder404Mobile} />
      <Typography className={classes.text}>啊哦～你想找的内容离你而去了哦</Typography>
    </div>
  );
};

export default PlaceholderMobileNotFound;
