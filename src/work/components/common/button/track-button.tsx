import { Button, ButtonProps, CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import clsx from "clsx";
import { Check, CloseCircleOutline, Plus } from "mdi-material-ui";
import React, { ReactNode, useEffect, useState } from "react";
import {
  EntityType,
  TrackerTheme,
  useTrackableThemeQuery,
  useTrackEntityMutation,
  useUnTrackEntityByEntityIdMutation,
} from "../../../generated/graphql";
import SnackbarContainer from "../snackbar/snackbarContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    hover: {
      "&:hover": {
        color: "red",
      },
    },
    buttonIcon: {
      maxWidth: 16,
      maxHeight: 16,
      marginTop: 1,
    },
  }),
);

interface TrackButtonProps extends ButtonProps {
  entityId: string;
  entityType: EntityType;
  stopPropagation?: boolean;
}

const TrackButton: React.FunctionComponent<TrackButtonProps> = (props) => {
  const classes = useStyles();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const { entityId, entityType, stopPropagation, ...restProps } = props;
  const muse = useClient();
  const [isHover, setIsHover] = useState(false);
  // 点击关注后，并且鼠标没有离开按钮，不应出现取消的功能
  const [isTrackedJustNow, setIsTrackedJustNow] = useState(false);
  const [fetching, setFetching] = useState(false);
  const [isTracked, setIsTracked] = useState(false);

  const [, executeTrackEntityMutation] = useTrackEntityMutation();

  const [, executeUnTrackEntityByEntityIDMutation] = useUnTrackEntityByEntityIdMutation();

  const [showTrackButton, setShowTrackButton] = useState(false);
  const [trackTheme, setTrackTheme] = useState<TrackerTheme>(TrackerTheme.TrackerThemeEnterprise);

  const [trackableThemeQueryResult] = useTrackableThemeQuery({
    variables: {
      entityID: entityId,
      entityType: entityType,
    },
  });

  useEffect(() => {
    const trackerTheme = trackableThemeQueryResult.data?.trackableTheme?.trackerTheme;
    const isTracked = trackableThemeQueryResult.data?.trackableTheme?.isTracked ?? false;

    switch (trackerTheme) {
      case undefined:
      case TrackerTheme.TrackerThemeUnspecified:
        setShowTrackButton(false);
        setIsTracked(isTracked);
        break;
      default:
        setIsTracked(isTracked);
        setShowTrackButton(true);
        setTrackTheme(trackerTheme);
        break;
    }
  }, [trackableThemeQueryResult]);

  async function onButtonClick(event: React.MouseEvent<HTMLButtonElement, MouseEvent>): Promise<void> {
    stopPropagation && event.stopPropagation();
    if (fetching) {
      return;
    }
    if (isTrackedJustNow) {
      return;
    }
    setFetching(true);
    if (isTracked) {
      muse.sendTrackingEvent("tracker.untrack_entity", {
        "tracker_theme": trackTheme,
        "tracker_entities": { entityId, entityType },
      });
      const result = await executeUnTrackEntityByEntityIDMutation({ entity: { entityId, entityType } });
      if (result.data?.unTrackEntityByEntityID) {
        setIsTracked(false);
        setFetching(false);
        return;
      }
      openSnackbar("取消关注失败", "error");
      setFetching(false);
      return;
    }

    muse.sendTrackingEvent("tracker.track_entities", {
      "tracker_theme": trackTheme,
      "tracker_entities": [{ entityId, entityType }],
    });
    const result = await executeTrackEntityMutation({ trackerTheme: trackTheme, entities: [{ entityId, entityType }] });
    if (result.data?.trackEntity) {
      setIsTracked(true);
      setIsTrackedJustNow(true);
      setFetching(false);
      return;
    }
    openSnackbar("关注失败", "error");
    setFetching(false);
  }

  function iconComponent(): ReactNode {
    if (fetching) {
      return <CircularProgress size={12} />;
    }
    if (isTracked) {
      if (isHover && !isTrackedJustNow) {
        return <CloseCircleOutline className={classes.buttonIcon} />;
      } else {
        return <Check className={classes.buttonIcon} />;
      }
    }

    return <Plus className={classes.buttonIcon} />;
  }

  function textComponent(): ReactNode {
    if (fetching) {
      return "加载中...";
    }

    if (!isTracked) {
      return "关注";
    }

    if (isHover && !isTrackedJustNow) {
      return "取消关注";
    }

    return "已关注";
  }

  return showTrackButton ? (
    <Button
      {...restProps}
      onMouseEnter={(): void => setIsHover(true)}
      onMouseLeave={(): void => {
        setIsHover(false);
        setIsTrackedJustNow(false);
      }}
      onClick={onButtonClick}
      disabled={fetching}
      startIcon={iconComponent()}
      className={clsx(props.className, isTracked && isHover && !isTrackedJustNow ? classes.hover : undefined)}
    >
      {textComponent()}
    </Button>
  ) : (
    <></>
  );
};

export default TrackButton;
