import { ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import { TrackerTag, useTrackerTagsQuery } from "../../../../../generated/graphql";
import { SVGMark } from "../../../../realm/assets";
import TrackContainer from "../../../container";
import ManageTagsDialog from "./manage-tags-dialog";
import TrackSuggestionsSearchInput from "./track-suggestions-search-input";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    icon: {
      fontSize: 16,
      marginRight: 4,
      color: "#666",
    },
    operationText: {
      fontSize: 14,
      display: "flex",
      alignItems: "center",
      whiteSpace: "pre",
    },
    operationButton: {
      borderRadius: 4,
      padding: "0 8px",
    },
  }),
);

const TrackerSuffix: React.FunctionComponent = () => {
  const classes = useStyles();
  const [showDialog, setShowDialog] = useState(false);
  const { setUserTagList, trackTheme } = TrackContainer.useContainer();

  const [trackerTagsResult, executeTrackerTagsQuery] = useTrackerTagsQuery({
    variables: {
      trackerTheme: trackTheme,
    },
  });

  useEffect(() => {
    const data = trackerTagsResult.data?.trackerTags;
    setUserTagList((data ?? []) as TrackerTag[]);
  }, [trackerTagsResult]);

  const updateUserTagList = () => {
    executeTrackerTagsQuery();
  };

  return (
    <>
      <ButtonBase className={classes.operationButton} onClick={() => setShowDialog(true)}>
        <SVGMark className={classes.icon} />
        <Typography className={classes.operationText}>管理标签</Typography>
      </ButtonBase>
      <TrackSuggestionsSearchInput />
      <ManageTagsDialog
        open={showDialog}
        closeDialog={() => setShowDialog(false)}
        updateUserTagList={updateUserTagList}
      />
    </>
  );
};

export default TrackerSuffix;
