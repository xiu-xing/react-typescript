import {
  Box,
  Dialog as MuiDialog,
  DialogActions as MuiDialogActions,
  DialogContent,
  DialogTitle as MuiDialogTitle,
  IconButton,
  Typography,
} from "@material-ui/core";
import { DialogProps as MuiDialogProps } from "@material-ui/core/Dialog";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { Close } from "mdi-material-ui";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    dialogPaperRoot: {
      minHeight: (props: DialogProps): number | undefined => props.minHeight,
      height: (props: DialogProps): number | undefined => props.height,
      minWidth: (props: DialogProps): number | undefined => props.minWidth,
      width: (props: DialogProps): number | undefined => props.width,
    },
    titleBar: {
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
      height: 56,
    },
    title: {
      fontWeight: 500,
      alignSelf: "center",
      flexGrow: 1,
      color: theme.palette.text.primary,
    },
    content: {
      padding: (props: DialogProps): 0 | undefined => (props.useBaseContentPadding ? undefined : 0),
      borderTop: (props: DialogProps): "none" | undefined => props.disabledContentTopDivider && "none",
      borderBottom: (props: DialogProps): "none" | undefined => props.disabledContentBottomDivider && "none",
    },
    closeBtn: {
      padding: theme.spacing(1),
      color: theme.palette.text.primary,
    },
  }),
);

export interface DialogProps extends MuiDialogProps {
  closeButton?: boolean;
  actions?: React.ReactNode;
  maxHeight?: number;
  minHeight?: number;
  height?: number;
  minWidth?: number;
  width?: number;
  onClickCloseButton?: () => void;
  dialogTitle?: React.ReactNode;
  disabledContentTopDivider?: true;
  disabledContentBottomDivider?: true;
  useBaseContentPadding?: true;
  disableTitle?: boolean;
  disableContentDivider?: boolean;
}

const Dialog: React.FunctionComponent<DialogProps> = (props) => {
  const {
    title,
    dialogTitle,
    closeButton,
    actions,
    minHeight,
    height,
    minWidth,
    width,
    onClickCloseButton,
    disabledContentTopDivider,
    disabledContentBottomDivider,
    useBaseContentPadding,
    disableScrollLock = true,
    disableTitle,
    disableContentDivider,
    ...leftProps
  } = props;
  const classes = useStyles({
    minHeight,
    height,
    minWidth,
    width,
    disabledContentTopDivider,
    disabledContentBottomDivider,
    useBaseContentPadding,
    open: false,
  });
  return (
    <MuiDialog
      {...leftProps}
      className={clsx(classes.root, props.className)}
      classes={{ ...leftProps.classes, paper: classes.dialogPaperRoot }}
      maxWidth={false}
      disableScrollLock={disableScrollLock}
    >
      {disableTitle ? null : (
        <MuiDialogTitle className={classes.titleBar} disableTypography>
          {dialogTitle ? (
            <Box className={classes.title}>{dialogTitle}</Box>
          ) : (
            <Typography className={classes.title}>{title}</Typography>
          )}
          {closeButton ? (
            <IconButton
              size="medium"
              className={classes.closeBtn}
              onClick={(): void => {
                if (onClickCloseButton) {
                  onClickCloseButton();
                }
              }}
            >
              <Close />
            </IconButton>
          ) : null}
        </MuiDialogTitle>
      )}
      {leftProps.children && (
        <DialogContent dividers={!disableContentDivider} className={classes.content}>
          {leftProps.children}
        </DialogContent>
      )}
      {actions && <MuiDialogActions>{actions}</MuiDialogActions>}
    </MuiDialog>
  );
};

export default Dialog;
