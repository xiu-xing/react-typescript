import { Button, ButtonBase, Snackbar, Typography, useMediaQuery } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Alert } from "@material-ui/lab";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import React, { useMemo, useState } from "react";
import { useClient } from "urql";
import {
  EntityType,
  Recommendation,
  TrackEntityDocument,
  TrackEntityMutation,
  TrackEntityMutationVariables,
  TrackerTheme,
  useTrackerRecommendationsQuery,
} from "../../generated/graphql";
import { parseError } from "../../utils/error";
import { CheckboxChecked, CheckboxNormal } from "./assets";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      height: "calc(100vh - 48px)",
      justifyContent: "center",
    },
    items: {
      display: "grid",
      width: 1040,
      gridTemplateColumns: "repeat(5, 1fr)",
      gridRowGap: 36,
      marginBottom: 64,
      justifyItems: "center",
    },
    item: {
      width: 112,
      height: 112,
      borderRadius: 8,
      border: "1px solid #eee",
      display: "flex",
      flexDirection: "column",
      "& #checkbox-area": {
        width: 20,
        height: 20,
        position: "absolute",
        right: 8,
        top: 8,
      },
      "& #image": {
        width: 40,
        height: 40,
        objectFit: "contain",
        pointerEvents: "none",
        marginBottom: 8,
      },
      "& #text": {
        color: "#666",
        fontSize: 14,
      },
      "& svg": {
        fontSize: 20,
      },
    },
    trackButton: {
      width: 128,
    },
  }),
);

interface TrackRecommendationsProps {
  trackerType: TrackerTheme;
}

const TrackRecommendations: React.FunctionComponent<TrackRecommendationsProps> = ({ trackerType }) => {
  const [snackbarOpen, setSnackbarOpen] = useState(false);
  const classes = useStyles();
  const muse = useMuseClient();
  const client = useClient();
  const [snackbarMessage, setSnackbarMessage] = useState("发生错误");
  const isWidthMatched = useMediaQuery("(min-width:1040px)");
  const [trackerRecommendationsResult] = useTrackerRecommendationsQuery({
    variables: {
      trackerTheme: trackerType,
    },
  });
  const [selectedItems, setSelectedItems] = useState<Recommendation[]>([]);

  const getTitle = useMemo(() => {
    let title = "";
    switch (trackerType) {
      case TrackerTheme.TrackerThemeEnterprise:
        title = "项目企业";
        break;
      case TrackerTheme.TrackerThemeInstitution:
        title = "投资机构";
        break;
      case TrackerTheme.TrackerThemeVertical:
        title = "行业赛道";
        break;
    }

    return (
      <Typography
        style={{
          fontSize: 20,
          fontWeight: 500,
          marginBottom: 20,
          color: "#333",
        }}
      >
        追踪一个{title}试试
      </Typography>
    );
  }, [trackerType]);

  function recommendationItem(recommendation: Recommendation) {
    const isChecked = selectedItems.findIndex(
      (child) => child.entityID === recommendation.entityID && child.entityType === recommendation.entityType,
    );
    return (
      <ButtonBase
        className={classes.item}
        key={`${recommendation.entityID}-${recommendation.entityType}`}
        onClick={() => {
          if (
            selectedItems.findIndex(
              (child) => child.entityID === recommendation.entityID && child.entityType === recommendation.entityType,
            ) === -1
          ) {
            setSelectedItems((oldValue) => {
              const newValue = Array.from(oldValue);
              newValue.push(recommendation);
              return newValue;
            });
            return;
          }
          setSelectedItems((oldValue) => {
            const newValue = oldValue.filter(
              (child) => child.entityID != recommendation.entityID || child.entityType != recommendation.entityType,
            );
            return newValue;
          });
        }}
      >
        <div id="checkbox-area">{isChecked === -1 ? <CheckboxNormal /> : <CheckboxChecked />}</div>
        <img id="image" src={recommendation.logoURI} />
        <Typography id="text">{recommendation.primaryName}</Typography>
      </ButtonBase>
    );
  }

  return (
    <>
      <div className={classes.root}>
        {getTitle}
        <Typography
          style={{
            fontSize: 16,
            color: "#737373",
            marginBottom: 32,
          }}
        >
          追踪后您将实时获得行业动态提醒，包括投融事件、企业上市、新闻等
        </Typography>
        <div
          className={classes.items}
          style={{
            width: isWidthMatched ? "1040px" : "100%",
          }}
        >
          {trackerRecommendationsResult.data?.trackerRecommendations?.map((child) => {
            if (child) {
              return recommendationItem(child);
            }
            return null;
          })}
        </div>
        <Button
          className={classes.trackButton}
          variant="outlined"
          color="primary"
          disabled={selectedItems.length === 0}
          onClick={() => {
            client
              .mutation<TrackEntityMutation, TrackEntityMutationVariables>(TrackEntityDocument, {
                trackerTheme: trackerType,
                entities: selectedItems.map((child) => ({
                  entityId: child.entityID,
                  entityType: child.entityType ?? EntityType.Organization,
                })),
              })
              .toPromise()
              .then((result) => {
                if (result.error) {
                  if (parseError(result.error).code === "201009") {
                    setSnackbarMessage("追踪失败，超过追踪上限，请重新选择");
                    setSnackbarOpen(true);
                    return;
                  }
                  return;
                }

                muse.sendTrackingEvent("tracker.track_entities", {
                  "tracker_theme": trackerType,
                  "tracker_entities": selectedItems.map((child) => ({
                    entityId: child.entityID,
                    entityType: child.entityType ?? EntityType.Organization,
                  })),
                });

                window.location.reload();
              })
              .catch(() => {
                setSnackbarMessage("发生错误");
                setSnackbarOpen(true);
              });
          }}
        >
          追踪
        </Button>
      </div>
      <Snackbar
        open={snackbarOpen}
        autoHideDuration={2000}
        onClose={() => {
          setSnackbarOpen(false);
        }}
      >
        <Alert severity="error">{snackbarMessage}</Alert>
      </Snackbar>
    </>
  );
};

export default TrackRecommendations;
