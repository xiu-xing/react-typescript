import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import router from "next/router";
import React, { useEffect, useState } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    title: {
      fontSize: 14,
      color: "#666666",
    },
    iconBox: {
      minWidth: 24,
    },
    active: {
      color: theme.palette.primary.main,
      background: "none",
      fontWeight: 500,
    },
  }),
);

export interface DrawerItemProps {
  title: string;
  href?: string;
  onClick?: () => void;
}

const DrawerItem: React.FunctionComponent<DrawerItemProps> = (props) => {
  const classes = useStyles();
  const { title, href, onClick } = props;
  const [isActive, setIsActive] = useState(false);

  useEffect(() => {
    const active = router.asPath === href;

    setIsActive(active);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [href, router.asPath]);

  return (
    <Typography className={clsx(classes.title, isActive ? classes.active : undefined)} onClick={onClick}>
      {title}
    </Typography>
  );
};

export default DrawerItem;
