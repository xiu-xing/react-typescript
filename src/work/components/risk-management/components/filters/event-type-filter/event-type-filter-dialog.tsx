import { makeStyles } from "@material-ui/core";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import MuiDialogActions from "@material-ui/core/DialogActions";
import MuiDialogContent from "@material-ui/core/DialogContent";
import MuiDialogTitle from "@material-ui/core/DialogTitle";
import { createStyles, Theme, withStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import React, { FunctionComponent } from "react";
import RiskManagementContainer from "../../../riskManagementContainer";
import FirstLevelList from "./components/first-level-list";
import SecondLevelList from "./components/second-level-list";
import SelectedItemList from "./components/selected-list";
import EventTypeFilterContainer from "./eventTypeFilterContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      margin: 0,
      padding: theme.spacing(2),
    },
    closeButton: {
      position: "absolute",
      right: theme.spacing(1),
      top: theme.spacing(1),
      color: theme.palette.grey[500],
    },
    dialogContent: {
      display: "flex",
      flexDirection: "row",
      padding: "0 !important",
      margin: 0,
    },
    commonListStyles: {
      width: 300,
      height: 360,
      padding: 0,
      overflow: "auto",
    },
    dialogRoot: {
      maxWidth: 900,
    },
    listItem: {
      height: 40,
      display: "flex",
      justifyContent: "space-between",
    },
    closeIcon: {
      fontSize: 16,
      color: "rgba(0, 0, 0, 0.54)",
    },
    iconButton: {
      width: 21,
      height: 21,
      padding: 14,
      marginLeft: "2rem",
    },
    filterIcon: {
      width: 18,
      height: 18,
    },
    dialogTitle: {
      color: "#737373",
      fontSize: 16,
      fontWeight: 500,
    },
    dialogAction: {
      justifyContent: "space-between",
    },
  }),
);

export interface DialogTitleProps {
  children: React.ReactNode;
}

export const DialogTitle: FunctionComponent<DialogTitleProps> = (props: DialogTitleProps) => {
  const classes = useStyles();

  const { children } = props;
  return (
    <MuiDialogTitle disableTypography className={classes.root}>
      <Typography variant="body1" className={classes.dialogTitle}>
        {children}
      </Typography>
    </MuiDialogTitle>
  );
};

const DialogContent = withStyles((theme: Theme) => ({
  root: {
    padding: theme.spacing(2),
  },
}))(MuiDialogContent);

const DialogActions = withStyles((theme: Theme) => ({
  root: {
    margin: 0,
    padding: theme.spacing(1),
  },
}))(MuiDialogActions);

const EventTypeFilterDialogDisplay: FunctionComponent = () => {
  const classes = useStyles();
  const {
    eventFilterDialogOpen: open,
    setEventFilterDialogOpen: setOpen,
    selectedTagIds,
    setSelectedTagIds,
    selectedTagParentIds,
    setSelectedTagParentIds,
    tagParentIds,
    tagIds,
  } = RiskManagementContainer.useContainer();
  const {
    selectedTagIds: selectedTagIdsTemp,
    setSelectedTagIds: setSelectedTagIdsTemp,
    selectedTagParentIds: selectedTagParentIdsTemp,
    setSelectedTagParentIds: setSelectedTagParentIdsTemp,
  } = EventTypeFilterContainer.useContainer();

  function onCancelButtonClick(): void {
    setOpen(false);
    setSelectedTagIdsTemp(selectedTagIds);
    setSelectedTagParentIdsTemp(selectedTagParentIds);
  }

  function onConfirmButtonClick(): void {
    setOpen(false);
    if (selectedTagIdsTemp.length == selectedTagIds.length) {
      // 判断是否有改动
      const changeId = selectedTagIdsTemp.find((value) => selectedTagIds.indexOf(value) == -1);
      if (!changeId) {
        return;
      }
    }
    setSelectedTagIds(selectedTagIdsTemp);
    setSelectedTagParentIds(selectedTagParentIdsTemp);
  }

  function onCancelAllButtonClick(): void {
    setSelectedTagParentIdsTemp([]);
    setSelectedTagIdsTemp([]);
  }

  function onResetButtonClick(): void {
    if (selectedTagParentIdsTemp.length == tagParentIds.length) {
      return;
    }
    setSelectedTagParentIdsTemp(Array.from(tagParentIds));
    setSelectedTagIdsTemp(Array.from(tagIds));
  }

  return (
    <>
      <Dialog
        classes={{
          paper: classes.dialogRoot,
        }}
        onClose={(): void => {
          setOpen(false);
        }}
        aria-labelledby="customized-dialog-title"
        open={open}
      >
        <DialogTitle>{"事件类型"}</DialogTitle>
        <DialogContent
          classes={{
            root: classes.dialogContent,
          }}
          dividers
        >
          <FirstLevelList />
          <SecondLevelList />
          <SelectedItemList />
        </DialogContent>
        <DialogActions className={classes.dialogAction}>
          <div>
            {selectedTagParentIdsTemp.length == tagParentIds.length ? (
              <Button color="primary" onClick={onCancelAllButtonClick}>
                全部取消
              </Button>
            ) : (
              <Button color="primary" onClick={onResetButtonClick}>
                恢复默认
              </Button>
            )}
          </div>
          <div>
            <Button autoFocus onClick={onCancelButtonClick} color="primary">
              取消
            </Button>
            <Button autoFocus onClick={onConfirmButtonClick} color="primary">
              保存
            </Button>
          </div>
        </DialogActions>
      </Dialog>
    </>
  );
};

const EventTypeFilterDialog: FunctionComponent = () => {
  return (
    <EventTypeFilterContainer.Provider>
      <EventTypeFilterDialogDisplay />
    </EventTypeFilterContainer.Provider>
  );
};

export default EventTypeFilterDialog;
