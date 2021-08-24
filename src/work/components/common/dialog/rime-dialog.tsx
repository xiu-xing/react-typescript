import {
  Dialog,
  DialogClassKey,
  DialogProps,
  DialogTitle,
  IconButton,
  StyledComponentProps,
  Theme
} from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import CloseIcon from "@material-ui/icons/Close";
import clsx from "clsx";
import { omit } from "lodash";
import React, { useEffect, useState } from "react";
import { LogoSVG } from "./assets";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      minWidth: 300,
      maxWidth: 479,
    },
    dialogTitle: {
      background: theme.palette.primary.main,
      color: "#ffffff",
      paddingBottom: "12px",
    },
    closeIconButton: {
      position: "absolute",
      right: 0,
      top: 4,
      color: "#ffffff",
    },
  }),
);

type RimeDialogClassKey = DialogClassKey | "title";

interface RimeDialogProps extends Omit<DialogProps, "classes">, StyledComponentProps<RimeDialogClassKey> {
  showCloseButton?: boolean;
  onCloseButtonClick?: () => void;
}

const RimeDialog: React.FunctionComponent<RimeDialogProps> = (props) => {
  const classes = useStyles();

  const { children, showCloseButton, open, classes: externalClasses, ...restProps } = props;

  const [dialogOpen, setDialogOpen] = useState(open);

  useEffect(() => {
    setDialogOpen(open);
  }, [open]);

  return (
    <Dialog
      open={dialogOpen}
      classes={{
        ...omit(externalClasses, "title"),
        paper: clsx(classes.root, externalClasses?.paper),
      }}
      {...restProps}
    >
      <DialogTitle classes={{ root: clsx(classes.dialogTitle, externalClasses?.title) }}>
        <LogoSVG />
        {showCloseButton && (
          <IconButton
            aria-label="close"
            className={classes.closeIconButton}
            onClick={(event): void => {
              props.onClose?.(event, "backdropClick");
            }}
          >
            <CloseIcon />
          </IconButton>
        )}
      </DialogTitle>
      {children}
    </Dialog>
  );
};

export default RimeDialog;
