import React from "react";
import Snackbar from "../../common/snackbar/snackbar";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";

const GlobalMessage: React.FunctionComponent<{}> = () => {
  const snackbarProps = SnackbarContainer.useContainer();

  return (
    <>
      <Snackbar {...snackbarProps} />
    </>
  );
};

export default GlobalMessage;
