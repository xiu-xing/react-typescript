import { Box, fade, Tooltip, TooltipProps, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { HelpCircleOutline } from "mdi-material-ui";
import React from "react";

const useStylesBootstrap = makeStyles((theme: Theme) => ({
  arrow: {
    color: "#fff",
  },
  tooltip: {
    backgroundColor: "#fff",
    padding: 16,
    display: "grid",
    gridRowGap: 8,
    boxShadow: "0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 1px 3px 0px rgb(0 0 0 / 12%)",
  },
}));

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    dialogTitle: {
      display: "flex",
      alignItems: "center",
    },
    dialogTitleText: {
      color: "#fff",
      fontSize: "18px",
      fontWeight: 500,
    },
    dialogTitleIcon: {
      fontSize: 20,
      marginLeft: 6,
      color: "#fff",
    },
    paper: {
      backgroundColor: "#fff",
      padding: 16,
      display: "grid",
      gridRowGap: 8,
    },
    exampleBox: {
      display: "flex",
      alignItems: "center",
      flexWrap: "nowrap",
    },
    example: {
      display: "inline-box",
      width: 12,
      height: 12,
      borderRadius: 2,
      marginRight: 10,
    },
    tagTypeSelected: {
      backgroundColor: theme.palette.primary.main,
      "& p": {
        color: "#fff",
      },
    },
    tagTypeOutline: {
      backgroundColor: fade(theme.palette.primary.main, 0.12),
    },
    text: {
      fontSize: 12,
      color: "#333",
    },
  }),
);

const DialogTitle: React.FunctionComponent = () => {
  const classes = useStyles();

  const content = () => {
    return (
      <>
        <Box className={classes.exampleBox}>
          <span className={clsx(classes.example, classes.tagTypeSelected)} />
          <Typography className={classes.text}>所有已选项均包含此标签</Typography>
        </Box>
        <Box className={classes.exampleBox}>
          <span className={clsx(classes.example, classes.tagTypeOutline)} />
          <Typography className={classes.text}>部分已选项均包含此标签</Typography>
        </Box>
        <Box className={classes.exampleBox}>
          <span
            className={classes.example}
            style={{
              border: "1px solid #EEEEEE",
            }}
          />
          <Typography className={classes.text}>所有已选项均不包含此标签</Typography>
        </Box>
      </>
    );
  };

  function BootstrapTooltip(props: TooltipProps) {
    const classes = useStylesBootstrap();
    return <Tooltip arrow classes={classes} {...props} />;
  }

  return (
    <Box className={classes.dialogTitle}>
      <Typography className={classes.dialogTitleText}>编辑标签</Typography>
      <BootstrapTooltip title={content()} placement="bottom-start">
        <HelpCircleOutline className={classes.dialogTitleIcon} />
      </BootstrapTooltip>
    </Box>
  );
};

export default DialogTitle;
