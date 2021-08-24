import { Button, CircularProgress, fade, Paper, TextField, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Add } from "@material-ui/icons";
import { Entity, useClient as useMuseClient } from "@momentum-valley/muse-js";
import Tippy from "@tippyjs/react";
import _ from "lodash";
import { Check, Magnify } from "mdi-material-ui";
import React, { useEffect, useMemo, useState } from "react";
import SimpleBar from "simplebar-react";
import { OperationResult, useClient } from "urql";
import {
  EntityInput,
  EntityType,
  TrackerSuggestion,
  TrackerSuggestionsDocument,
  TrackerSuggestionsQuery,
  TrackerSuggestionsQueryVariables,
  useTrackEntityMutation,
  useUnTrackEntityMutation,
} from "../../../../../../generated/graphql";
import CommonGridContainer from "../../../../../common/common-grid-components/grid/container";
import SnackbarContainer from "../../../../../common/snackbar/snackbarContainer";
import TrackContainer from "../../../../container";
import TrackGridTabContainer from "../../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: 186,
      "& .MuiInputBase-root": {
        height: 32,
        fontSize: 14,
        paddingLeft: 12,
        borderRadius: 4,
        backgroundColor: "#F5F6F9",
      },
      "& .MuiOutlinedInput-input": {
        padding: "6px 8px",
        height: 24,
      },
      "& .MuiInputBase-root::before": {
        content: "none",
      },
      "& .MuiInputBase-root::after": {
        content: "none",
      },
    },
    paper: {
      minWidth: 186,
      paddingTop: 8,
    },
    noSuggestion: {
      color: "#999",
      fontSize: 16,
      fontWeight: 500,
      textAlign: "center",
    },
    suggestionButton: {
      width: "100%",
      display: "flex",
      justifyContent: "space-between",
      padding: "6px 10px 6px 16px",
    },
    suggestionIcon: {
      color: "#666",
      fontSize: 24,
    },
    suggestionText: {
      fontSize: 14,
      color: "#333",
      maxWidth: 112,
      textOverflow: "ellipsis",
      whiteSpace: "nowrap",
      overflow: "hidden",
    },
    addButton: {
      width: "100%",
      height: 34,
      backgroundColor: fade(theme.palette.primary.main, 0.04),
    },
    addText: {
      textAlign: "center",
      color: theme.palette.primary.main,
      fontSize: 12,
      fontWeight: 500,
      padding: "9px 0",
    },
  }),
);

const TrackSuggestionsSearchInput: React.FunctionComponent = () => {
  const classes = useStyles();
  const client = useClient();
  const muse = useMuseClient();
  const { setTimelineEntity } = TrackGridTabContainer.useContainer();
  const { setRowSelections, setUseQueryEndCursor, setPage, setUpdateGridRow } = CommonGridContainer.useContainer();

  const { trackTheme } = TrackContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();

  const [inputValue, setInputValue] = useState("");
  const [open, setOpen] = useState(false);
  const [fetching, setFetching] = useState(true);
  const [suggestions, setSuggestions] = useState<TrackerSuggestion[]>([]);
  const [isTrackedList, setIsTrackedList] = useState<string[]>([]);
  const [addTrackList, setAddTrackList] = useState<EntityInput[]>([]);
  const [unTrackList, setUnTrackList] = useState<string[]>([]);

  const [, executeTrackEntityMutation] = useTrackEntityMutation();
  const [, executeUnTrackEntityMutation] = useUnTrackEntityMutation();

  const getSuggestions = () => {
    client
      .query<TrackerSuggestionsQuery, TrackerSuggestionsQueryVariables>(
        TrackerSuggestionsDocument,
        {
          trackerTheme: trackTheme,
          keyword: inputValue,
          first: 50,
        },
        {
          requestPolicy: "network-only",
        },
      )
      .toPromise()
      .then((res) => {
        const data = res.data?.trackerSuggestions?.nodes;
        const list = (data ?? []) as TrackerSuggestion[];
        const isTrackedList: string[] = [];
        list.forEach((item) => item.isTracked && isTrackedList.push(item.entityID));

        setIsTrackedList(isTrackedList);
        return setSuggestions(list);
      })
      .finally(() => {
        setFetching(false);
      });
  };

  const suggestionClick = (item: TrackerSuggestion) => {
    if (item.trackingID && unTrackList.includes(item.trackingID))
      return setUnTrackList((prev) => prev.filter((id) => id !== item.trackingID));

    if (addTrackList.some((i) => i.entityId === item.entityID))
      return setAddTrackList((prev) => prev.filter((i) => i.entityId !== item.entityID));

    const isTracked = isTrackedList.includes(item.entityID);

    if (isTracked) {
      const newUnTrackList = [...unTrackList, item.trackingID ?? ""];
      return setUnTrackList(newUnTrackList);
    }

    const newAddTrackList = [
      ...addTrackList,
      { entityId: item.entityID, entityType: item.entityType ?? EntityType.Organization },
    ];
    setAddTrackList(newAddTrackList);
    return;
  };

  useEffect(() => {
    if (!inputValue || inputValue.length <= 1) {
      setOpen(false);
      setSuggestions([]);
      return;
    }

    setFetching(true);
    setOpen(true);
    getSuggestions();
  }, [inputValue]);

  const apply = () => {
    const promiseList: Promise<OperationResult>[] = [];
    const musePromises: Promise<void>[] = [];
    if (addTrackList.length > 0) {
      const addPromise = executeTrackEntityMutation({
        trackerTheme: trackTheme,
        entities: addTrackList,
      });
      promiseList.push(addPromise);

      // Muse Tracking
      musePromises.push(
        muse.sendTrackingEvent("tracker.track_entities", {
          "tracker_theme": trackTheme,
          "tracker_entities": addTrackList.map<Entity>((child) => ({
            id: child.entityId,
            type: child.entityType,
          })),
        }),
      );
    }

    if (unTrackList.length > 0) {
      const unTrackPromise = executeUnTrackEntityMutation({
        trackingIds: unTrackList,
      });
      promiseList.push(unTrackPromise);

      // Muse Tracking
      musePromises.push(
        muse.sendTrackingEvent("tracker.untrack_entities", {
          "tracker_theme": trackTheme,
          "tracking_ids": unTrackList,
        }),
      );
    }

    if (promiseList.length > 0) {
      Promise.all(promiseList).then((res) => {
        if (res.some((item) => item.error)) return openSnackbar("操作失败", "error");

        setTimelineEntity(undefined);
        setUpdateGridRow((prev) => (prev ? false : true));
        setUnTrackList([]);
        setIsTrackedList([]);
        setAddTrackList([]);
        setRowSelections([]);
        setInputValue("");
        openSnackbar("操作成功", "success");
      });

      Promise.all(musePromises);
    }

    return setInputValue("");
  };

  const getIcon = (item: TrackerSuggestion) => {
    if (item.trackingID && unTrackList.includes(item.trackingID)) return <Add color="primary" />;

    if (addTrackList.some((i) => i.entityId === item.entityID) || isTrackedList.includes(item.entityID)) {
      return <Check color="primary" />;
    }

    return <Add color="primary" />;
  };

  const tippyContentComponent = useMemo(() => {
    if (suggestions.length === 0) return <Typography className={classes.noSuggestion}>无建议</Typography>;

    return (
      <>
        <SimpleBar style={{ maxHeight: 200 }}>
          {suggestions.map((item) => (
            <Button key={item.entityID} className={classes.suggestionButton} onClick={() => suggestionClick(item)}>
              <Typography className={classes.suggestionText}>{item.primaryName}</Typography>
              {getIcon(item)}
            </Button>
          ))}
          {fetching && (
            <div style={{ justifyContent: "center", textAlign: "center", height: 40 }}>
              <CircularProgress size={30} />
            </div>
          )}
        </SimpleBar>
        <Button className={classes.addButton} onClick={apply}>
          <Typography className={classes.addText}>确认</Typography>
        </Button>
      </>
    );
  }, [fetching, suggestions, isTrackedList, addTrackList, unTrackList]);

  return (
    <>
      <Tippy
        visible={open}
        content={<Paper className={classes.paper}>{tippyContentComponent}</Paper>}
        interactive
        offset={[0, 0]}
        duration={0}
        placement="bottom"
        appendTo={document.body}
        popperOptions={{
          strategy: "fixed",
          modifiers: [
            {
              name: "preventOverflow",
              enabled: true,
            },
          ],
        }}
        onClickOutside={() => {
          setInputValue("");
          setAddTrackList([]);
          setUnTrackList([]);
        }}
      >
        <TextField
          className={classes.root}
          value={inputValue}
          onChange={_.throttle((e) => {
            setInputValue(e.target.value);
          }, 20)}
          InputProps={{
            startAdornment: <Magnify style={{ color: "#CCC" }} />,
          }}
          placeholder={"快速添加"}
        />
      </Tippy>
    </>
  );
};

export default TrackSuggestionsSearchInput;
