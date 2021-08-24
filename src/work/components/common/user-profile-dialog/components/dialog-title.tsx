import { DialogTitle as MuiDialogTitle, IconButton, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Close } from "mdi-material-ui";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
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
    closeBtn: {
      padding: 8,
      color: theme.palette.text.primary,
    },
  }),
);

interface DialogTitleProps {
  title: string;
  closeButton?: boolean;
  onClickCloseButton?: () => void;
}

const DialogTitle: React.FunctionComponent<DialogTitleProps> = (props) => {
  const classes = useStyles();

  const { title, closeButton, onClickCloseButton } = props;

  return (
    <MuiDialogTitle className={classes.titleBar} disableTypography>
      <Typography className={classes.title}>{title}</Typography>
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
  );
};

export default DialogTitle;
