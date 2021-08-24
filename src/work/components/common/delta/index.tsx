import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { CSSProperties } from "@material-ui/styles";
import clsx from "clsx";
import { ArrowDownBold, ArrowUpBold } from "mdi-material-ui";
import React, { ReactNode, useMemo } from "react";
import theme from "../../../theme";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "inline-flex",
      alignItems: "center",
      fontSize: "0.875rem",
      lineHeight: 1.71,
    },
    icon: {
      fontSize: "1rem",
    },
  }),
);

interface DeltaProps {
  value?: number;
  formatter?: (prev: number) => string;
  disableIcon?: boolean;
  className?: string;
  style?: CSSProperties;
  icon?: (negative: boolean | undefined) => ReactNode;
}

const isNegative = (value: number): boolean | undefined => {
  if (isNaN(value)) throw new Error("value is invalid");

  if (value < 0) {
    return true;
  } else if (value > 0) {
    return false;
  } else {
    return undefined;
  }
};

const Delta: React.FunctionComponent<DeltaProps> = (props) => {
  const { value = 0, formatter, disableIcon = false, className, style, icon } = props;
  const classes = useStyles();

  const tailIcon = useMemo(() => {
    if (isNegative(value) === true) return <ArrowDownBold className={classes.icon} />;
    if (isNegative(value) === false) return <ArrowUpBold className={classes.icon} />;
    if (isNegative(value) === undefined) return null;
  }, [value]);

  return (
    <Typography
      className={clsx(classes.root, className)}
      style={{
        ...style,
        color: isNegative(value) === undefined ? "" : isNegative(value) ? "#E00000" : theme.palette.primary.main,
      }}
    >
      {formatter ? formatter(value) : value}
      {!disableIcon && (icon ? icon(isNegative(value)) : tailIcon)}
    </Typography>
  );
};

export default Delta;
