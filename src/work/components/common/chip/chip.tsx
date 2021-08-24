import { Chip as MuiChip, ChipProps as MuiChipProps, Theme } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    chipRoot: {
      margin: 5,
      padding: "4px 20px",
      fontSize: 14,
      border: "none",
      color: "#333",
      background: "rgba(102, 140, 157, 0.14)",
    },
    icon: {
      width: 18,
      height: 18,
      color: theme.palette.primary.main,
      pointerEvents: "none",
    },
  }),
);

type ChipProps = MuiChipProps;

/**
 * 通用的 chip 组件，用法与 material-ui 的 chip 相同
 * 这里只是封装了一些样式，避免每次用到都复制一遍样式
 * @param props
 */
const Chip: React.FunctionComponent<ChipProps> = (props) => {
  const classes = useStyles();

  return (
    <MuiChip
      {...props}
      classes={{
        ...props.classes,
        root: clsx(classes.chipRoot, props.classes?.root),
      }}
      clickable={false}
    />
  );
};

export default Chip;
