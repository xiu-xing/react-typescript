import {
  Box,
  Paper,
  ListItemProps,
  ListItem,
  ListItemAvatar,
  ListItemText,
  Tooltip,
  Typography,
} from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import { PlusCircleOutline } from "mdi-material-ui";
import EntityAvatar from "../entity-avatar/entity-avatar";
import { EntityType } from "../../../generated/graphql";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    listItem: {
      padding: 0,
      paddingRight: 26,
      width: "100%",
      overflow: "hidden",
    },
    listItemAvatar: {
      minWidth: 30,
      marginRight: 8,
      marginLeft: 8,
    },
    logoPaper: {
      width: 30,
      height: 30,
      display: "inline-flex",
      alignItems: "center",
      justifyContent: "center",
    },
    logoImg: {
      maxWidth: "100%",
      maxHeight: "100%",
      objectFit: "contain",
      background: "none",
    },
    addIconBox: {
      position: "absolute",
      top: "50%",
      right: 4,
      transform: "translate(0, -50%)",
    },
    addIcon: {
      fontSize: 20,
      right: 8,
    },
    primary: {
      color: "#333",
      fontSize: 16,
      whiteSpace: "nowrap",
      overflow: "hidden",
      textOverflow: "ellipsis",
    },
    secondary: {
      color: "#333",
      fontSize: 12,
      whiteSpace: "nowrap",
      overflow: "hidden",
      textOverflow: "ellipsis",
    },
    tooltipBox: {
      padding: 4,
    },
    tooltipTitle: {
      fontSize: 16,
      fontWeight: 500,
    },
    tooltipSubtitle: {
      fontSize: 14,
    },
  }),
);

interface EntityItemProps extends ListItemProps {
  logoSrc: string;
  title: string;
  subtitle: string;
  entityType: EntityType;
}

const EntityItem: React.FunctionComponent<EntityItemProps> = (props) => {
  const classes = useStyles();
  const [loadedFail, setLoadedFail] = useState(false);

  return (
    <ListItem button className={classes.listItem}>
      <ListItemAvatar className={classes.listItemAvatar}>
        <Paper className={classes.logoPaper}>
          {!loadedFail && props.logoSrc ? (
            <img
              className={classes.logoImg}
              onError={(): void => {
                setLoadedFail(true);
              }}
              src={props.logoSrc}
              alt=""
            />
          ) : (
            <EntityAvatar entityType={props.entityType} />
          )}
        </Paper>
      </ListItemAvatar>
      <Tooltip
        title={
          <Box className={classes.tooltipBox}>
            <Typography className={classes.tooltipTitle}>{props.title}</Typography>
            <Typography className={classes.tooltipSubtitle}>{props.subtitle}</Typography>
          </Box>
        }
        enterDelay={600}
        enterNextDelay={600}
      >
        <ListItemText
          classes={{ primary: classes.primary, secondary: classes.secondary }}
          primary={props.title}
          secondary={props.subtitle}
        />
      </Tooltip>
      <Box className={classes.addIconBox}>
        <PlusCircleOutline className={classes.addIcon} color="primary" />
      </Box>
    </ListItem>
  );
};

export default EntityItem;
