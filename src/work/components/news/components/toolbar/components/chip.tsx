import { Chip as MuiChip, ChipProps as MuiChipProps, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import { withAlphaHex } from "with-alpha-hex";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    chipRoot: {
      margin: 5,
      padding: "4px 20px",
      fontSize: 14,
      border: "none",
      color: "#333",
      background: withAlphaHex(theme.palette.primary.main, 0.14),
    },
    icon: {
      width: 18,
      height: 18,
      color: theme.palette.primary.main,
      pointerEvents: "none",
    },
  }),
);

interface ChipProps extends MuiChipProps {
  onCheck?: (activated: boolean) => void;
}

const Chip: React.FunctionComponent<ChipProps> = (props) => {
  const classes = useStyles();

  return (
    <MuiChip
      classes={{
        root: clsx(classes.chipRoot, props.classes?.root),
      }}
      {...props}
      clickable={false}
    />
  );
};

export default Chip;
