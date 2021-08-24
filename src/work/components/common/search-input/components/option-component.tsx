import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Check, PlusCircleOutline } from "mdi-material-ui";
import React from "react";
import { Suggestion } from "../../../../generated/graphql";
import EntityAvatar from "../../entity-avatar-next/entity-avatar";

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
  option: Suggestion;
  selected?: boolean;
}

const OptionComponent: React.FunctionComponent<OptionComponentProps> = (props) => {
  const { selected, option } = props;
  const classes = useStyles();
  return (
    <Box className={classes.root}>
      <EntityAvatar className={classes.icon} src={option.logo} />
      <Box className={classes.text}>
        <Typography className={classes.title}>{option.primaryName}</Typography>
        {option.label && <Typography className={classes.subTitle}>{option.label}</Typography>}
      </Box>
      {selected ? <Check className={classes.optionEndIcon} /> : <PlusCircleOutline className={classes.optionEndIcon} />}
    </Box>
  );
};

export default OptionComponent;
