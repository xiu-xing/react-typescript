import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Check, Plus } from "mdi-material-ui";
import React from "react";
import { RealmSuggestion } from "../../../../../generated/graphql";
import EntityAvatar from "../../../entity-avatar-next/entity-avatar";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      flex: 1,
      display: "flex",
      alignItems: "center",
      flexDirection: "row",
    },
    icon: {
      maxWidth: 20,
      maxHeight: 20,
      margin: 5,
      backgroundColor: "transparent",
    },
    text: {
      flex: 1,
      display: "flex",
      flexDirection: "column",
      overflow: "hidden",
      marginLeft: 10,
    },
    title: {
      fontSize: "0.875rem",
      color: "#333",
      textOverflow: "ellipsis",
      overflow: "hidden",
      display: "-webkit-box",
      WebkitLineClamp: 1,
      WebkitBoxOrient: "vertical",
    },
    subTitle: {
      fontSize: "0.75rem",
      color: "#666",
      textOverflow: "ellipsis",
      overflow: "hidden",
      display: "-webkit-box",
      WebkitLineClamp: 1,
      WebkitBoxOrient: "vertical",
    },
    optionEndIcon: {
      marginLeft: theme.spacing(1),
      fontSize: 16,
      color: theme.palette.primary.main,
    },
  }),
);

interface OptionComponentProps {
  option: RealmSuggestion;
  selected: boolean;
  hideLogo?: boolean;
}

const OptionComponent: React.FunctionComponent<OptionComponentProps> = (props) => {
  const { selected, option, hideLogo } = props;
  const classes = useStyles();
  return (
    <Box className={classes.root}>
      {!hideLogo && <EntityAvatar className={classes.icon} src={option.logo ? option.logo : undefined} />}
      <Box className={classes.text}>
        <Typography className={classes.title}>{option.primaryName}</Typography>
        {option.description && <Typography className={classes.subTitle}>{option.description}</Typography>}
      </Box>
      {selected ? <Check className={classes.optionEndIcon} /> : <Plus className={classes.optionEndIcon} />}
    </Box>
  );
};

export default OptionComponent;
