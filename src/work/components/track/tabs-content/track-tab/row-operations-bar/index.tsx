import { Box, ButtonBase, Divider, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import EditIcon from "@material-ui/icons/Edit";
import HighlightOffIcon from "@material-ui/icons/HighlightOff";
import { useClient } from "@momentum-valley/muse-js";
import clsx from "clsx";
import { TrashCanOutline } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import NumberFormat from "react-number-format";
import { TrackerTag, useTrackerTagsQuery, useUnTrackEntityMutation } from "../../../../../generated/graphql";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import Dialog from "../../../../common/dialog/dialog";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import TrackContainer from "../../../container";
import TrackGridTabContainer from "../container";
import EditTagsDialog from "./edit-tags-dialog";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: 48,
      backgroundColor: "#F5F6F9",
      padding: "0 16px",
      display: "flex",
      alignItems: "center",
      flexDirection: "row",
      transition: "height 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms",
      color: "#333",
    },
    hidden: {
      height: 0,
      overflow: "hidden",
    },
    button: {
      display: "flex",
      alignItems: "center",
      padding: "0 12px",
      flexDirection: "row",
      justifyContent: "center",
      height: "100%",
      color: "#333",
      border: 4,
    },
    text: {
      fontSize: 14,
      display: "flex",
      alignContent: "center",
    },
    totalCountIcon: {
      color: "#333",
      marginInlineEnd: 4,
      marginBottom: 2,
      marginRight: 12,
    },
    totalCount: {
      fontSize: 14,
    },
    buttonIcon: {
      fontSize: 16,
      color: "#666",
      marginRight: 4,
    },
    dialog: {
      "& .MuiDialogTitle-root": {
        backgroundColor: theme.palette.primary.main,
        padding: "17px 32px",
      },
      "& .MuiIconButton-label": {
        color: "#fff",
      },
    },
    dialogTitle: {
      color: "#fff",
      fontSize: "18px",
      fontWeight: 500,
    },
    dialogBottom: {
      height: "56px",
      padding: "16px 32px",
      display: "flex",
      justifyContent: "flex-end",
    },
    dialogContent: {
      padding: 32,
    },
    dialogText: {
      fontSize: "14px",
      fontWeight: 500,
      color: "#666",
      cursor: "pointer",
    },
    color: {
      color: theme.palette.primary.main,
    },
  }),
);

const RowOperationsBar: React.FunctionComponent = () => {
  const classes = useStyles();
  const muse = useClient();
  const { setTimelineEntity } = TrackGridTabContainer.useContainer();
  const { rowSelections, setRowSelections, setUpdateGridRow } = CommonGridContainer.useContainer();

  const { openSnackbar } = SnackbarContainer.useContainer();
  const { setUserTagList, trackTheme } = TrackContainer.useContainer();
  const [showEditDialog, setShowEditDialog] = useState(false);
  const [showUnTrackDialog, setShowUnTrackDialog] = useState(false);

  const [trackerTagsResult, executeTrackerTagsQuery] = useTrackerTagsQuery({
    variables: {
      trackerTheme: trackTheme,
    },
  });

  useEffect(() => {
    const data = trackerTagsResult.data?.trackerTags;
    setUserTagList((data ?? []) as TrackerTag[]);
  }, [trackerTagsResult]);

  const [, executeUnTrackMutation] = useUnTrackEntityMutation();

  const removeTrack = () => {
    executeUnTrackMutation({
      trackingIds: rowSelections,
    }).then((res) => {
      if (res.error) return openSnackbar("取消追踪失败", "error");

      setRowSelections([]);
      setTimelineEntity(undefined);
      setUpdateGridRow((prev) => (prev ? false : true));
      openSnackbar("取消追踪成功", "success");
    });

    muse.sendTrackingEvent("tracker.untrack_entities", {
      "tracking_ids": rowSelections,
    });
  };

  const apply = () => {
    removeTrack();
    setUpdateGridRow((prev) => (prev ? false : true));
    setShowUnTrackDialog(false);
  };

  return (
    <div className={clsx(classes.root, rowSelections.length === 0 && classes.hidden)}>
      <Typography className={classes.text} style={{ paddingRight: 12 }}>
        已选中&nbsp;
        <NumberFormat
          value={rowSelections.length}
          displayType="text"
          thousandSeparator
          className={classes.totalCount}
        />
        &nbsp;项
      </Typography>
      <ButtonBase
        className={classes.button}
        onClick={() => {
          setShowEditDialog(true);
        }}
      >
        <EditIcon className={classes.buttonIcon} />
        <Typography className={classes.text}>编辑标签</Typography>
      </ButtonBase>
      <ButtonBase className={classes.button} onClick={() => setShowUnTrackDialog(true)}>
        <TrashCanOutline className={classes.buttonIcon} />
        <Typography className={classes.text}>放弃追踪</Typography>
      </ButtonBase>
      <ButtonBase
        className={classes.button}
        onClick={() => {
          setRowSelections([]);
        }}
      >
        <HighlightOffIcon className={classes.buttonIcon} />
        <Typography className={classes.text}>取消选择</Typography>
      </ButtonBase>
      <EditTagsDialog
        open={showEditDialog}
        updateTags={() => executeTrackerTagsQuery()}
        closeDialog={() => setShowEditDialog(false)}
      />
      <Dialog
        open={showUnTrackDialog}
        className={classes.dialog}
        minWidth={380}
        minHeight={100}
        dialogTitle={<Typography className={classes.dialogTitle}>追踪</Typography>}
      >
        <Typography className={classes.dialogContent}>确认取消追踪？</Typography>
        <Divider />
        <Box className={classes.dialogBottom}>
          <Typography
            className={classes.dialogText}
            style={{ marginRight: 32 }}
            onClick={() => {
              setShowUnTrackDialog(false);
            }}
          >
            取消
          </Typography>
          <Typography className={clsx(classes.dialogText, classes.color)} onClick={apply}>
            确认
          </Typography>
        </Box>
      </Dialog>
    </div>
  );
};

export default RowOperationsBar;
