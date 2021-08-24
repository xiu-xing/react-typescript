import { Box, ButtonBase, DialogProps, Divider, fade, TextField, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import AddIcon from "@material-ui/icons/Add";
import CloseIcon from "@material-ui/icons/Close";
import { useClient } from "@momentum-valley/muse-js";
import { OperationResult } from "@urql/core";
import clsx from "clsx";
import _ from "lodash";
import { Magnify } from "mdi-material-ui";
import React, { useCallback, useEffect, useMemo, useState } from "react";
import SimpleBar from "simplebar-react";
import {
  TrackerTag,
  useCreateTrackerTagsMutation,
  useDeleteTrackerTagsMutation,
} from "../../../../../../generated/graphql";
import CommonGridContainer from "../../../../../common/common-grid-components/grid/container";
import Dialog from "../../../../../common/dialog/dialog";
import SnackbarContainer from "../../../../../common/snackbar/snackbarContainer";
import Space from "../../../../../common/space";
import TrackContainer from "../../../../container";
import TrackGridTabContainer from "../../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    simpleBar: {
      maxHeight: 240,
      overflow: "auto",
    },
    tagBox: {
      padding: "0 32px 16px",
      minHeight: "142px",
      boxSizing: "border-box",
      maxWidth: "480px",
    },
    tag: {
      backgroundColor: fade(theme.palette.primary.main, 0.12),
      padding: "4px 12px",
      borderRadius: "20px",
      display: "flex",
      alignItems: "center",
      height: "32px",
    },
    tagText: {
      color: "#333",
      fontSize: 14,
    },
    closeIcon: {
      backgroundColor: theme.palette.primary.main,
      color: "#fff",
      marginLeft: 4,
      fontSize: 16,
      borderRadius: "50%",
      cursor: "pointer",
    },
    dialogTitle: {
      color: "#fff",
      fontSize: 18,
      fontWeight: 500,
    },
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
      width: 416,
      margin: "24px 32px",
      marginBottom: 8,
      "& .MuiInputBase-root": {
        fontSize: 14,
        paddingLeft: 12,
      },
      "& .MuiOutlinedInput-input": {
        padding: "6px 8px",
        height: 24,
      },
      "& .MuiOutlinedInput-notchedOutline": {
        borderColor: "#EEE",
      },
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
    tagLengthTip: {
      backgroundColor: theme.palette.common.white,
      margin: 0,
      marginTop: 8,
      padding: 0,
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

interface ManageTagDialogProps extends DialogProps {
  closeDialog: () => void;
  updateUserTagList: () => void;
}

const ManageTagsDialog: React.FunctionComponent<ManageTagDialogProps> = ({
  updateUserTagList,
  closeDialog,
  ...leftProps
}) => {
  const classes = useStyles();
  const muse = useClient();
  const { setUpdateGridRow } = CommonGridContainer.useContainer();

  const { userTagList, trackTheme } = TrackContainer.useContainer();
  const { filterTag, setFilterTag } = TrackGridTabContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const [tags, setTags] = useState<TrackerTag[]>([]);
  const [inputValue, setInputValue] = useState<string>("");
  const [showTip, setShowTip] = useState(false);
  const [isComposition, setIsComposition] = useState(false);

  const [, executeCreateTrackerTagsMutation] = useCreateTrackerTagsMutation();
  const [, executeDeleteTrackerTagsMutation] = useDeleteTrackerTagsMutation();

  useEffect(() => {
    setTags(userTagList);
  }, [userTagList]);

  const updateTag = (value: string) => {
    const newTags = _.clone(tags);
    const index = newTags.findIndex((item) => item.name === value);

    if (index === -1) {
      newTags.push({
        __typename: "TrackerTag",
        id: "",
        name: value,
      });
      return setTags(newTags);
    }

    newTags.splice(index, 1);
    return setTags(newTags);
  };

  const apply = () => {
    const addList = _.difference(tags, userTagList);
    const deleteList = _.difference(userTagList, tags);
    const promiseList: Promise<OperationResult>[] = [];
    const musePromises: Promise<void>[] = [];

    if (addList.length > 0) {
      const tagNames: string[] = [];
      addList.forEach((item) => {
        item.name && tagNames.push(item.name);
      });
      const createMutation = executeCreateTrackerTagsMutation({
        tagNames: tagNames,
        trackerTheme: trackTheme,
      });
      promiseList.push(createMutation);

      // Muse Tracking
      musePromises.push(
        muse.sendTrackingEvent("tracker.create_tag", {
          "tags": tagNames,
        }),
      );
    }

    if (deleteList.length > 0) {
      const tagIds: string[] = [];
      deleteList.forEach((item) => {
        item.id && tagIds.push(item.id);
      });
      const deleteMutation = executeDeleteTrackerTagsMutation({
        tagIds: tagIds,
      });
      promiseList.push(deleteMutation);

      // Muse Tracking
      musePromises.push(
        muse.sendTrackingEvent("tracker.delete_tag", {
          "tag_ids": tagIds,
        }),
      );
    }

    Promise.all(promiseList).then((res) => {
      if (res.some((item) => item.error)) return openSnackbar("管理标签失败", "error");
      if (deleteList.length > 0) {
        deleteList.forEach((tag) => {
          tag.id === filterTag && setFilterTag("");
        });
        setUpdateGridRow((prev) => (prev ? false : true));
      }

      setInputValue("");
      updateUserTagList();
      openSnackbar("管理标签成功", "success");
      closeDialog();
    });

    Promise.all(musePromises);
  };

  const TagList = useMemo(() => {
    let disPlayTagList = _.clone(tags);
    if (inputValue) {
      const reg = new RegExp("[" + inputValue + "]", "g");
      disPlayTagList = disPlayTagList.filter((tag) => tag.name?.search(reg) !== -1);
    }
    disPlayTagList = _.reverse(disPlayTagList);
    return (
      <>
        {disPlayTagList.map((tag, index) => (
          <span className={classes.tag} key={index}>
            <Typography className={classes.tagText}>{tag.name}</Typography>
            <CloseIcon className={classes.closeIcon} onClick={() => updateTag(tag.name ?? "")} />
          </span>
        ))}
      </>
    );
  }, [tags, inputValue]);

  const getEndAdornment = useCallback(() => {
    if (!inputValue || tags.some((item) => item.name === inputValue)) return undefined;

    if (inputValue.length > 10) return <AddIcon style={{ color: "#999" }} />;

    return (
      <ButtonBase
        onClick={() => {
          updateTag(inputValue);
          setInputValue("");
        }}
      >
        <AddIcon className={classes.color} />
      </ButtonBase>
    );
  }, [inputValue]);

  return (
    <Dialog
      {...leftProps}
      className={classes.dialog}
      minWidth={480}
      minHeight={325}
      dialogTitle={<Typography className={classes.dialogTitle}>管理标签</Typography>}
      closeButton
      onClickCloseButton={() => {
        setInputValue("");
        setTags(userTagList);
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
          if (
            e.keyCode === 13 &&
            inputValue.trim() &&
            inputValue.trim().length <= 10 &&
            !tags.some((item) => item.name === inputValue)
          ) {
            updateTag(inputValue);
            setInputValue("");
            setShowTip(false);
          }
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
            setTags(userTagList);
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

export default ManageTagsDialog;
