import { Box, ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import { Vertical } from ".";
import { EntityType } from "../../../../generated/graphql";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "14px 0",
    },
    button: {
      borderRadius: 4,
      padding: 8,
      width: "100%",
      background: "#97B1CE",
    },
    subButton: {
      borderRadius: 4,
      padding: 8,
      background: "#F0F4F8",
      flexDirection: "column",
    },
    title: {
      fontSize: 14,
      fontWeight: theme.typography.fontWeightMedium,
    },
    white: {
      color: "#fff",
    },
    primary: {
      color: theme.palette.primary.main,
    },
    subTitile: {
      fontSize: 14,
      fontWeight: theme.typography.fontWeightMedium,
    },
    subSubTitle: {
      fontSize: 12,
    },
  }),
);

interface SubdivisionProps {
  vertical: Vertical;
}

const Subdivision: React.FunctionComponent<SubdivisionProps> = ({ vertical }) => {
  const classes = useStyles();

  const jumpToProfile = (id: string) => {
    window.location.href = `js://webview/profile?id=${id}&type=${EntityType.Vertical}`;
  };

  return (
    <Box className={classes.root}>
      <ButtonBase className={classes.button} onClick={() => jumpToProfile(vertical.UnionID)}>
        <Typography className={clsx(classes.title, classes.white)}>{vertical.Name}</Typography>
        <Box width={8} />
        <Typography className={clsx(classes.title, classes.white)}>{vertical.NumberOfEnterprise}</Typography>
      </ButtonBase>
      <Box height={20} />
      <Box display="grid" gridGap="20px" gridTemplateColumns="repeat(2,1fr)">
        {vertical.NextLevel.map((n) => (
          <ButtonBase key={n.UnionID} className={classes.subButton} onClick={() => jumpToProfile(n.UnionID)}>
            <Typography className={clsx(classes.subTitile, classes.primary)}>{n.Name}</Typography>
            <Box height={4} />
            <Typography className={clsx(classes.subSubTitle, classes.primary)}>{n.NumberOfEnterprise}</Typography>
          </ButtonBase>
        ))}
      </Box>
    </Box>
  );
};

export default Subdivision;
