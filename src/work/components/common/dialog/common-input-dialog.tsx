import { Box, Button, CircularProgress, TextField } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useCallback, useEffect, useState } from "react";
import Dialog from "./dialog";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      paddingLeft: theme.spacing(3),
      paddingRight: theme.spacing(3),
      paddingTop: theme.spacing(3),
    },
    titleInput: {
      width: "100%",
    },
    checkboxesWrapper: {
      display: "none",
      // display: "flex",
      flexDireaction: "row",
      alignItems: "center",
      justifyContent: "space-between",
      marginTop: "32px",
      marginBottom: "32px",
    },
    circularProgress: {
      marginRight: 2,
    },
    cancelButton: {
      color: "#666",
    },
  }),
);

type PickedRefreshFrequency = Exclude<{}, "Daily" | "Weekly">;

interface CommonInputDialogProps {
  dialogTitle: string;
  textFieldTitle: string;
  open: boolean;
  handleConfirm: (name: string, searchInvertal?: PickedRefreshFrequency) => void;
  handleClose: () => void;
  defaultRefreshFrequency?: PickedRefreshFrequency;
  defaultName?: string;
  autoFocus?: boolean;
}

const MAX_NAME_LENGTH = 255;

const CommonInputDialog: React.FunctionComponent<CommonInputDialogProps> = ({
  dialogTitle,
  textFieldTitle,
  open,
  handleConfirm,
  handleClose,
  defaultName = "",
  autoFocus = false,
}) => {
  const classes = useStyles();
  const [name, setName] = useState<string>(defaultName ?? "");
  const [saveLoading, setSaveLoading] = useState(false);

  const save = useCallback(() => {
    setSaveLoading(true);
    handleConfirm(name);
    setSaveLoading(false);
  }, [name, setSaveLoading, handleConfirm]);

  useEffect(() => {
    if (open) {
      setName(defaultName)
    }
  }, [defaultName, open])

  useEffect(() => {
    if (open) {
      const onKeyDown = (event: KeyboardEvent): void => {
        if (event.keyCode === 13 && name.length !== 0) {
          event.preventDefault();
          save();
        }
      };
      window.addEventListener("keydown", onKeyDown, false);
      return (): void => window.removeEventListener("keydown", onKeyDown, false);
    }
  }, [open, save, name]);

  useEffect(() => {
    if (!open) {
      setSaveLoading(false);
    }
  }, [open]);

  return (
    <Dialog
      onClick={(e): void => {
        e.stopPropagation();
      }}
      title={dialogTitle}
      width={535}
      height={252}
      open={open}
      onClose={(): void => {
        handleClose();
      }}
      onClickCloseButton={(): void => {
        handleClose();
      }}
      actions={
        <>
          <Button onClick={(): void => handleClose() } className={classes.cancelButton}>
            {"取消"}
          </Button>
          <Button color={"primary"} onClick={save} disabled={name.length === 0 || saveLoading}>
            {saveLoading && <CircularProgress size={14} disableShrink className={classes.circularProgress} />}
            {"确认"}
          </Button>
        </>
      }
    >
      <Box className={classes.root}>
        <TextField
          autoFocus={autoFocus}
          className={classes.titleInput}
          label={textFieldTitle}
          value={name}
          onChange={(event): void => {
            const value = event.target.value;
            if (MAX_NAME_LENGTH >= value.trim().length) {
              setName(value);
            } else {
              return;
            }
            setName(event.target.value);
          }}
        />
      </Box>
    </Dialog>
  );
};

export default CommonInputDialog;
