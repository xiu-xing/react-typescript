import { Chip as MuiChip, ChipProps as MuiChipProps, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { CheckCircle, Star } from "mdi-material-ui";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    chipRoot: {
      margin: "8px 6px",
      padding: "6px 6px",
      color: "rgba(51, 51, 51, 0.73)",
      fontSize: 14,
      fontWeight: 500,
      boxShadow: "0px 1px 4px 0px rgba(0, 0, 0, 0.2)",
      border: "none",
      cursor: "pointer",
      backgroundColor: "#fff",
    },
    checked: {
      background: "rgba(102, 140, 157, 0.14)",
    },
    icon: {
      width: 18,
      height: 18,
      color: theme.palette.primary.main,
      pointerEvents: "none",
    },
    label: {
      paddingLeft: 8,
    },
  }),
);

interface CheckChipProps extends MuiChipProps {
  checked: boolean;
}

const CheckChip: React.FunctionComponent<CheckChipProps> = (props) => {
  const classes = useStyles();

  const { checked, classes: overwriteClasses, ...restProps } = props;

  return (
    <MuiChip
      classes={{
        root: clsx(classes.chipRoot, checked ? classes.checked : undefined, overwriteClasses?.root),
        label: clsx(classes.label, overwriteClasses?.label),
      }}
      icon={
        checked ? (
          <CheckCircle className={classes.icon} fontSize="small" />
        ) : (
          <Star fontSize="small" className={classes.icon} />
        )
      }
      {...restProps}
      clickable={false}
    />
  );
};

export default CheckChip;
