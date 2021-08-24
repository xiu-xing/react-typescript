import { createStyles, makeStyles } from "@material-ui/core";
import IconButton from "@material-ui/core/IconButton";
import MuiSnackbar from "@material-ui/core/Snackbar";
import Alert from "@material-ui/lab/Alert";
import { CheckCircle, Close as CloseIcon } from "mdi-material-ui";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      color: "#fff",
    },
  }),
);

export type SnackbarType = "default" | "success" | "error" | "warning";

interface SnackbarProps {
  snackbarMessage: string;
  closeSnackbar(): void;
  open: boolean;
  snackbarType: SnackbarType;
  onClick?(event: React.MouseEvent<HTMLElement, MouseEvent>): void;
}

const Snackbar: React.FunctionComponent<SnackbarProps> = ({
  snackbarMessage,
  closeSnackbar,
  open,
  snackbarType,
  onClick,
}) => {
  const iconClasses = useStyles();
  const snackbarProps = {
    open,
    onClose: closeSnackbar,
    autoHideDuration: 2000,
    action: (
      <IconButton onClick={closeSnackbar}>
        <CloseIcon classes={iconClasses} />
      </IconButton>
    ),
  };

  function content() {
    if (snackbarType === "default") {
      return <MuiSnackbar {...snackbarProps} message={snackbarMessage} onClick={onClick} />;
    }

    if (snackbarType === "success")
      return (
        <MuiSnackbar {...snackbarProps} onClick={onClick}>
          <Alert onClose={closeSnackbar} severity={snackbarType} icon={<CheckCircle />}>
            {snackbarMessage}
          </Alert>
        </MuiSnackbar>
      );

    return (
      <MuiSnackbar {...snackbarProps} onClick={onClick}>
        <Alert onClose={closeSnackbar} severity={snackbarType}>
          {snackbarMessage}
        </Alert>
      </MuiSnackbar>
    );
  }

  return content();
};

export default Snackbar;
