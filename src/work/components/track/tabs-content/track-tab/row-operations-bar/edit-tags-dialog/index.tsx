import { Box, ButtonBase, Divider, fade, TextField, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Add } from "@material-ui/icons";
import { useClient } from "@momentum-valley/muse-js";
import clsx from "clsx";
import _ from "lodash";
import { Magnify } from "mdi-material-ui";
import React, { useCallback, useEffect, useMemo, useState } from "react";
import SimpleBar from "simplebar-react";
import { OperationResult } from "urql";
import {
  TrackerTagWithAddToTrackingFlag,
  TrackerTagWithTrackedCount,
  useAddTagsToTrackedEntitiesMutation,
  useRemoveTagsFromTrackedEntitiesMutation,
  useTagsWithTrackedCountQuery,
} from "../../../../../../generated/graphql";
import CommonGridContainer from "../../../../../common/common-grid-components/grid/container";
import Dialog, { DialogProps } from "../../../../../common/dialog/dialog";
import SnackbarContainer from "../../../../../common/snackbar/snackbarContainer";
import Space from "../../../../../common/space";
import TrackContainer from "../../../../container";
import DialogTitle from "./dialog-title";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    dialog: {
      "& .MuiDialogTitle-root": {
        backgroundColor: theme.palette.primary.main,
        padding: "17px 32px",
      },
      "& .MuiIconButton-label": {
        color: "#fff",
      },
      "& .MuiIconButton-root": {
        padding: 0,
      },
      "& .MuiDialog-paperScrollPaper": {
        maxHeight: "unset",
      },
    },
    input: {
      width: "416px",
      margin: "24px 32px",
      marginBottom: 8,
      "& .MuiInputBase-root": {
        fontSize: "14px",
        paddingLeft: "12px",
      },
      "& .MuiOutlinedInput-input": {
        padding: "6px 8px",
        height: "24px",
      },
      "& .MuiOutlinedInput-notchedOutline": {
        borderColor: "#EEE",
      },
    },
    tagBox: {
      padding: "0 32px 16px",
      minHeight: "142px",
      boxSizing: "border-box",
      maxWidth: 480,
    },
    tag: {
      backgroundColor: "#fff",
      padding: "4px 23px",
      borderRadius: "20px",
      display: "flex",
      alignItems: "center",
      height: "32px",
      border: "1px solid #EEEEEE",
      "& p": {
        color: "#666",
      },
    },
    tagColorTipText: {
      color: "#333",
      fontSize: "14px",
    },
    dialogBottom: {
      height: "56px",
      padding: "16px 32px",
      display: "flex",
      justifyContent: "flex-end",
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
    tagTypeSelected: {
      backgroundColor: theme.palette.primary.main,
      "& p": {
        color: "#fff",
      },
    },
    tagTypeOutline: {
      backgroundColor: fade(theme.palette.primary.main, 0.12),
    },
    tagLengthTipText: {
      fontSize: 12,
      color: "#e00000",
      paddingLeft: 32,
    },
    simplerBar: {
      maxHeight: 150,
      paddingTop: 8,
    },
    maxHeight: {
      maxHeight: 132,
    },
    minHeight: {
      minHeight: 132,
    },
  }),
);

interface EditTagsDialogProps extends DialogProps {
  closeDialog: () => void;
  updateTags: () => void;
}

const EditTagsDialog: React.FunctionComponent<EditTagsDialogProps> = ({
  closeDialog,
  updateTags,
  open,
  ...leftProps
}) => {
  const classes = useStyles();
  const museClient = useClient();
  const { rowSelections, setUpdateGridRow } = CommonGridContainer.useContainer();

  const { openSnackbar } = SnackbarContainer.useContainer();
  const { trackTheme } = TrackContainer.useContainer();

  const [tagsWithTrackedCount, setTagsWithTrackedCount] = useState<TrackerTagWithTrackedCount[]>([]);
  const [inputValue, setInputValue] = useState<string>("");
  const [selectTags, setSelectTags] = useState<string[]>([]);
  const [unSelectTags, setUnSelectTags] = useState<string[]>([]);
  const [addTags, setAddTags] = useState<TrackerTagWithAddToTrackingFlag[]>([]);
  const [showTip, setShowTip] = useState(false);
  const [isComposition, setIsComposition] = useState(false);

  const [, executeAddTagsToTrackedEntitiesMutation] = useAddTagsToTrackedEntitiesMutation();
  const [, executeRemoveTagsFromTrackedEntitiesMutation] = useRemoveTagsFromTrackedEntitiesMutation();

  const [tagsWithTrackedCountQueryResult, executeTagsWithTrackedCountQuery] = useTagsWithTrackedCountQuery({
    variables: {
      trackerTheme: trackTheme,
      trackingIds: rowSelections,
    },
    requestPolicy: "network-only",
    pause: true,
  });

  useEffect(() => {
    const data = tagsWithTrackedCountQueryResult.data?.tagsWithTrackedCount;

    if (!data) {
      setTagsWithTrackedCount([]);
      return;
    }

    setTagsWithTrackedCount(data as TrackerTagWithTrackedCount[]);
  }, [tagsWithTrackedCountQueryResult]);

  useEffect(() => {
    if (open) {
      setInputValue("");
      setSelectTags([]);
      setUnSelectTags([]);
      setTagsWithTrackedCount([]);
      setAddTags([]);

      executeTagsWithTrackedCountQuery();
    }
  }, [open]);

  const tagType = (TagID?: string | null) => {
    if (!TagID) return "normal";

    if (selectTags.includes(TagID)) return "selected";
    if (unSelectTags.includes(TagID)) return "normal";

    let type = "normal";

    tagsWithTrackedCount.some((item) => {
      if (item.id === TagID) {
        if (item.count === 0) return true;

        if (item.count === rowSelections.length) {
          type = "selected";
          return true;
        }

        type = "outline";
        return true;
      }
      return false;
    });

    return type;
  };

  const onTagButtonClick = (type: string, tagID?: string | null) => {
    if (!tagID) return;
    const newSelectTags = [...selectTags];
    const newUnselectTags = [...unSelectTags];

    switch (type) {
      case "selected": {
        if (!newUnselectTags.includes(tagID)) newUnselectTags.push(tagID);
        const index = newSelectTags.findIndex((id) => id === tagID);
        if (index != -1) newSelectTags.splice(index, 1);
        break;
      }
      default: {
        newSelectTags.push(tagID);
        break;
      }
    }

    setSelectTags(newSelectTags);
    setUnSelectTags(newUnselectTags);
  };

  const addTag = () => {
    setAddTags((prev) =>
      prev.concat({
        tagName: inputValue,
        isAdding: true,
      }),
    );
    setInputValue("");
  };

  const onAddTagButtonClick = (name: string) => {
    const newAddTags = [...addTags];

    for (const i in newAddTags) {
      if (newAddTags[i].tagName === name) newAddTags[i].isAdding = !newAddTags[i].isAdding;
    }

    setAddTags(newAddTags);
  };

  const getColor = (type: string) => {
    switch (type) {
      case "selected":
        return classes.tagTypeSelected;
      case "outline":
        return classes.tagTypeOutline;
      default:
        return null;
    }
  };

  const apply = () => {
    if (addTags.length === 0 && selectTags.length === 0 && unSelectTags.length === 0) return closeDialog();

    const promiseList: Promise<OperationResult>[] = [];
    const musePromises: Promise<void>[] = [];

    if (selectTags.length > 0 || addTags.length > 0) {
      const addMutation = executeAddTagsToTrackedEntitiesMutation({
        trackerTheme: trackTheme,
        trackingIds: rowSelections,
        tagIds: selectTags,
        newTags: addTags,
      });
      promiseList.push(addMutation);

      // Muse Tracking
      musePromises.push(
        museClient.sendTrackingEvent("tracker.add_tags_to_entities", {
          "tag_ids": selectTags,
          "tracker_theme": trackTheme.toString(),
          "tracking_ids": rowSelections,
        }),
      );
    }

    if (unSelectTags.length > 0) {
      const removeMutation = executeRemoveTagsFromTrackedEntitiesMutation({
        trackingIds: rowSelections,
        tagIds: unSelectTags,
      });
      promiseList.push(removeMutation);

      // Muse Tracking
      musePromises.push(
        museClient.sendTrackingEvent("tracker.delete_tags_from_entities", {
          "tag_ids": unSelectTags,
          "tracking_ids": rowSelections,
        }),
      );
    }

    Promise.all(promiseList).then((res) => {
      if (res.some((item) => item.error)) return openSnackbar("编辑标签失败", "error");

      openSnackbar("编辑标签成功", "success");
      setUpdateGridRow((prev) => (prev ? false : true));

      if (addTags.length > 0) updateTags();
      closeDialog();
    });

    // Muse Tracking
    Promise.all(musePromises);
  };

  const hasTag = useCallback(() => {
    const hasTag =
      tagsWithTrackedCount.some((tag) => tag.name === inputValue) ||
      addTags.some((item) => item.tagName === inputValue);
    return hasTag;
  }, [tagsWithTrackedCount]);

  const TagList = useMemo(() => {
    let disPlayTagList = [...tagsWithTrackedCount];
    let disPlayAddTags = [...addTags];
    if (inputValue) {
      const reg = new RegExp("[" + inputValue + "]", "g");
      disPlayTagList = disPlayTagList.filter((tag) => tag.name?.search(reg) !== -1);
      disPlayAddTags = disPlayAddTags.filter((tag) => tag.tagName.search(reg));
    }

    return (
      <>
        {_.reverse(disPlayAddTags).map((tag, index) => (
          <ButtonBase
            className={clsx(classes.tag, tag.isAdding && classes.tagTypeSelected)}
            key={index}
            onClick={() => onAddTagButtonClick(tag.tagName)}
          >
            <Typography className={classes.tagColorTipText}>{tag.tagName}</Typography>
          </ButtonBase>
        ))}
        {disPlayTagList.map((tag, index) => {
          const type = tagType(tag.id);
          return (
            <ButtonBase
              className={clsx(classes.tag, getColor(type))}
              key={index}
              onClick={() => onTagButtonClick(type, tag.id)}
            >
              <Typography className={classes.tagColorTipText}>{tag.name}</Typography>
            </ButtonBase>
          );
        })}
      </>
    );
  }, [inputValue, addTags, selectTags, unSelectTags, tagsWithTrackedCount]);

  const getEndAdornment = useCallback(() => {
    if (hasTag() || !inputValue) return undefined;

    if (inputValue.length > 10) return <Add style={{ color: "#999", cursor: "default" }} />;

    return <Add color="primary" onClick={addTag} style={{ cursor: "pointer" }} />;
  }, [inputValue]);

  return (
    <Dialog
      {...leftProps}
      open={open}
      className={classes.dialog}
      minWidth={480}
      minHeight={325}
      dialogTitle={<DialogTitle />}
      closeButton
      onClickCloseButton={() => {
        setShowTip(false);
        closeDialog();
      }}
    >
      <TextField
        className={classes.input}
        variant="outlined"
        value={inputValue}
        onCompositionStart={() => setIsComposition(true)}
        onCompositionEnd={() => {
          setIsComposition(false);
          if (inputValue.length > 10) return setShowTip(true);
          setShowTip(false);
        }}
        onChange={(e) => {
          setInputValue(e.target.value.trim());
          if (isComposition) return;
          if (e.target.value.trim().length > 10) return setShowTip(true);

          setShowTip(false);
        }}
        onKeyDown={(e) => {
          if (e.keyCode === 13 && inputValue.trim() && inputValue.trim().length <= 10 && !hasTag()) addTag();
        }}
        placeholder={"搜索添加标签"}
        InputProps={{
          startAdornment: <Magnify style={{ color: "#CCC" }} />,
          endAdornment: getEndAdornment(),
        }}
      />
      {showTip && <Typography className={classes.tagLengthTipText}>标签长度不超过 10 个字</Typography>}
      <SimpleBar className={clsx(classes.simplerBar, showTip && classes.maxHeight)}>
        <Box className={clsx(classes.tagBox, showTip && classes.minHeight)}>
          <Space wrap size={12}>
            {TagList}
          </Space>
        </Box>
      </SimpleBar>
      <Divider />
      <Box className={classes.dialogBottom}>
        <Typography
          className={classes.dialogText}
          style={{ marginRight: 32 }}
          onClick={() => {
            setShowTip(false);
            closeDialog();
          }}
        >
          取消
        </Typography>
        <Typography className={clsx(classes.dialogText, classes.color)} onClick={apply}>
          确认
        </Typography>
      </Box>
    </Dialog>
  );
};

export default EditTagsDialog;
