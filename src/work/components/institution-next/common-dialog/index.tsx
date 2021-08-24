import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { ReactNode } from "react";
import Dialog, { DialogProps } from "../../common/dialog/dialog";

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
      "& .MuiDialogActions-root": {
        justifyContent: "space-between",
        padding: "0 32px",
      },
    },
    dialogBottom: {
      height: "56px",
      display: "flex",
      alignItems: "center",
    },
    dialogText: {
      fontSize: "14px",
      fontWeight: 500,
      color: "#666",
      cursor: "pointer",
    },
    dialogTitleText: {
      color: "#fff",
      fontSize: "18px",
      fontWeight: 500,
    },
    color: {
      color: theme.palette.primary.main,
    },
    disableText: {
      color: "#999",
      cursor: "default",
    },
  }),
);

interface CommonDialogProps extends DialogProps {
  closeDialog: () => void;
  title?: string;
  content: ReactNode;
  showConfirmButton?: boolean;
  showCancelButton?: boolean;
  actionsPrefixButton?: ReactNode;
  actionsSuffixButton?: ReactNode;
  onConfirmButtonClick?: () => void;
  onCancelButtonClick?: () => void;
  disableConfirmButton?: boolean;
}

const CommonDialog: React.FunctionComponent<CommonDialogProps> = (props) => {
  const classes = useStyles();
  const {
    closeDialog,
    open,
    title,
    content,
    showConfirmButton,
    showCancelButton,
    actionsPrefixButton,
    actionsSuffixButton,
    onConfirmButtonClick,
    onCancelButtonClick,
    minWidth,
    minHeight,
    disableConfirmButton,
    ...leftProps
  } = props;

  const actionsComponent = () => {
    if (showConfirmButton || showCancelButton || actionsPrefixButton || actionsSuffixButton) {
      return (
        <>
          <div>{actionsPrefixButton}</div>
          <Box className={classes.dialogBottom}>
            {showConfirmButton && (
              <Typography
                className={classes.dialogText}
                style={{ marginRight: 32 }}
                onClick={() => {
                  closeDialog();
                  onCancelButtonClick && onCancelButtonClick();
                }}
              >
                取消
              </Typography>
            )}
            {showConfirmButton && (
              <Typography
                className={clsx(classes.dialogText, classes.color, disableConfirmButton && classes.disableText)}
                onClick={disableConfirmButton ? undefined : onConfirmButtonClick}
              >
                确认
              </Typography>
            )}
          </Box>
          {actionsSuffixButton}
        </>
      );
    }

    return undefined;
  };

  return (
    <Dialog
      {...leftProps}
      open={open}
      className={classes.dialog}
      minWidth={minWidth ?? 400}
      minHeight={minHeight ?? 250}
      dialogTitle={<Typography className={classes.dialogTitleText}>{title}</Typography>}
      closeButton
      onClickCloseButton={() => {
        closeDialog();
      }}
      actions={actionsComponent()}
    >
      {content}
    </Dialog>
  );
};

export default CommonDialog;
