import { Box, CircularProgress, DialogProps as MuiDialogProps, TextField, Tooltip } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Autocomplete } from "@material-ui/lab";
import React, { ReactNode, useState } from "react";
import ActionButton from "../button/action-button";
import Dialog from "./dialog";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    highlightText: {
      fontWeight: 600,
    },
    option: {
      whiteSpace: "nowrap",
      overflow: "hidden",
      textOverflow: "ellipsis",
      width: "100%",
    },
    tooltipText: {
      padding: 4,
      lineHeight: 2,
      fontSize: 14,
    },
  }),
);

export interface Option {
  title: string;
  id: string;
}

interface SelectOptionsDialogProps extends MuiDialogProps {
  options: Option[];
  onClose(): void;
  onConfirm(option: Option | null): void;
  noOptionText: ReactNode;
  textFieldPlaceholder: string;
  textFieldAutoFocus?: boolean;
  optionsLoading?: boolean;
  confirmButtonLoading?: boolean;
}

const SelectOptionsDialog: React.FunctionComponent<SelectOptionsDialogProps> = (props) => {
  const classes = useStyles();
  const [selectedOption, setSelectedOption] = useState<Option | null>(null);
  return (
    <Dialog
      onClick={(e): void => e.stopPropagation()}
      open={props.open}
      title={props.title}
      onClose={props.onClose}
      width={345}
      minHeight={170}
      useBaseContentPadding
      disabledContentTopDivider
      disabledContentBottomDivider
      disableScrollLock={false}
      actions={
        <>
          <ActionButton actionType="cancel" onClick={props.onClose} />
          <ActionButton
            actionType="save"
            onClick={(): void => props.onConfirm(selectedOption)}
            disabled={selectedOption === null || props.optionsLoading}
            loading={props.confirmButtonLoading ?? false}
          />
        </>
      }
    >
      <Autocomplete
        debug
        options={props.optionsLoading ? [] : props.options}
        getOptionLabel={({ title }): string => title}
        noOptionsText={props.optionsLoading ? "加载中..." : props.noOptionText}
        clearOnEscape
        blurOnSelect
        autoHighlight
        onChange={(event: { persist(): void }, option: Option | null): void => {
          event.persist();
          setSelectedOption(option);
        }}
        renderInput={(params): ReactNode => (
          <TextField
            {...params}
            label={props.textFieldPlaceholder}
            fullWidth
            autoFocus={!!props.textFieldAutoFocus}
            variant="outlined"
            InputProps={{
              ...params.InputProps,
              endAdornment: (
                <>
                  {props.optionsLoading ? <CircularProgress color="primary" size={20} disableShrink /> : null}
                  {params.InputProps.endAdornment}
                </>
              ),
            }}
          />
        )}
        renderOption={({ title }): ReactNode => {
          return (
            <Tooltip enterDelay={600} enterNextDelay={600} title={<Box className={classes.tooltipText}>{title}</Box>}>
              <Box className={classes.option}>{title}</Box>
            </Tooltip>
          );
        }}
      />
    </Dialog>
  );
};

export default SelectOptionsDialog;
