import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState, useEffect } from "react";
import { TextField } from "@material-ui/core";
import Dialog from "./dialog";
import ActionButton from "../button/action-button";
import { useKeyDown } from "../../../utils/hooks";

const useStyles = makeStyles(() =>
  createStyles({
    dialogPaper: {
      width: 360,
      paddingBottom: 10,
    },
  }),
);

interface ModifyTemplateNameDialogProps {
  title: string;
  open: boolean;
  onClose(): void;
  onConfirm(value: string): void;
  defaultValue?: string;
  maxLength?: number;
  // Default true
  trim?: boolean
}

const TextFieldDialog: React.FunctionComponent<ModifyTemplateNameDialogProps> = ({
  open,
  onClose,
  title,
  onConfirm,
  defaultValue = "",
  maxLength,
  trim = true,
}) => {
  const classes = useStyles();
  const [value, setValue] = useState(defaultValue);
  const [savingLoading, setSavingLoading] = useState(false);
  useEffect(() => {
    if (!open) {
      setSavingLoading(() => false);
      setValue(() => "");
    }
  }, [open]);
  const confirm = async (): Promise<void> => {
    const v = trim ? value.trim() : value
    if (savingLoading || v.length === 0) {
      return;
    }
    try {
      setSavingLoading(true);
      await onConfirm(v);
    } finally {
      onClose();
    }
  };
  useKeyDown({
    enter: confirm,
  });
  return !open ? null : (
    <>
      <Dialog
        open={open}
        classes={{ paper: classes.dialogPaper }}
        title={title}
        onClose={onClose}
        width={345}
        minHeight={180}
        useBaseContentPadding
        disabledContentTopDivider
        disabledContentBottomDivider
        actions={
          <>
            <ActionButton actionType="cancel" onClick={onClose} />
            <ActionButton
              actionType="confirm"
              onClick={confirm}
              loading={savingLoading}
              disabled={value.length === 0 || savingLoading}
            />
          </>
        }
      >
        <TextField
          variant="outlined"
          autoFocus
          fullWidth
          value={value}
          onChange={(event): void => {
            const value = event.target.value;
            if (maxLength && value.trim().length > maxLength) {
              return;
            }
            setValue(value);
          }}
        />
      </Dialog>
    </>
  );
};

export default TextFieldDialog;
