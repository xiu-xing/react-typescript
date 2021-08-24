import { Box, ListItem, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme, useTheme } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "4px 12px",
      justifyContent: "space-between",
    },
    menuItemText: {
      color: "#999",
      lineHeight: "24px",
      fontSize: 14,
    },
    primaryColor: {
      color: theme.palette.primary.main,
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

interface MenuItemProps {
  label: string;
  active?: boolean;
  count?: string;
  onClick?: VoidFunction;
}

const MenuItem: React.FunctionComponent<MenuItemProps> = ({ label, active = false, count, onClick }) => {
  const classes = useStyles();
  const theme = useTheme();

  return (
    <ListItem button alignItems="center" className={classes.root} onClick={onClick}>
      <Box display="inline-flex">
        <svg width="22" height="24">
          <rect y="5" x="12" width="2" height="14" fill={active ? theme.palette.primary.main : "transparent"} />
        </svg>
        <Typography noWrap className={clsx(classes.menuItemText, { [classes.primaryColor]: active })}>
          {label}
        </Typography>
      </Box>
      {count && (
        <Typography noWrap className={clsx(classes.menuItemText, { [classes.primaryColor]: active })}>
          {count}
        </Typography>
      )}
    </ListItem>
  );
};

export default MenuItem;
