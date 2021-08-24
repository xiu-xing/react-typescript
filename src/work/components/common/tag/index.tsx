import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { CSSProperties } from "react";
import { withAlphaHex } from "with-alpha-hex";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "inline-flex",
      borderRadius: 2,
      padding: 4,
      backgroundColor: `${withAlphaHex(theme.palette.primary.main, 0.16)}`,
      cursor: "pointer",
    },
    label: {
      fontSize: 12,
      lineHeight: 1.2,
      color: theme.palette.primary.main,
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

interface TagProps {
  label?: string;
  className?: string;
  labelClass?: string;
  style?: CSSProperties;
  onClick?: VoidFunction;
}

const Tag: React.FunctionComponent<TagProps> = (props) => {
  const classes = useStyles();
  const { label, className, labelClass, ...rest } = props;

  return (
    <Box className={clsx(classes.root, className)} {...rest}>
      <Typography noWrap className={clsx(classes.label, labelClass)}>
        {label}
      </Typography>
    </Box>
  );
};

export default Tag;
