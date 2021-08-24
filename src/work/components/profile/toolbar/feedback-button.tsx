import { Button, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { SquareEditOutline } from "mdi-material-ui";
import React from "react";
import AppContainer from "../../../containers/appContainer";
import { EntityType, Tab } from "../../../generated/graphql";
import FeedbackContent from "./feedback-content";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    label: {
      fontSize: 14,
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

interface FeedbackButtonProps {
  tabs: Tab[];
  entity: {
    id: string;
    name: string;
    type: EntityType;
  };
}

const FeedbackButton: React.FunctionComponent<FeedbackButtonProps> = (props) => {
  const classes = useStyles();
  const { showDialog } = AppContainer.useContainer();

  return (
    <Button
      className={classes.root}
      size="medium"
      variant="outlined"
      color="primary"
      startIcon={<SquareEditOutline />}
      onClick={() =>
        showDialog({
          fullWidth: true,
          maxWidth: "xs",
          children: <FeedbackContent tabs={props.tabs} entity={props.entity} />,
        })
      }
    >
      <Typography noWrap className={classes.label}>
        反馈
      </Typography>
    </Button>
  );
};

export default FeedbackButton;
