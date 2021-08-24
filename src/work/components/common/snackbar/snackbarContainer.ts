import { useState } from "react";
import { createContainer } from "unstated-next";
import { SnackbarType } from "./snackbar";

export type OpenSnackbar = (message: string, type: SnackbarType) => void

interface UseSnackMessageReturnType {
  open: boolean;
  snackbarMessage: string;
  snackbarType: SnackbarType;
  openSnackbar: OpenSnackbar;
  closeSnackbar(): void;
}

export function useSnackMessage(): UseSnackMessageReturnType {
  const [snackbarMessage, setSnackbarMessage] = useState<string | null>(null);
  const [snackbarType, setSnackbarType] = useState<SnackbarType>("default");
  const openSnackbar = (message: string, type: SnackbarType = "default"): void => {
    setSnackbarMessage((): string => message);
    setSnackbarType((): SnackbarType => type);
  };

  return {
    open: snackbarMessage !== null,
    snackbarMessage: snackbarMessage || "",
    snackbarType,
    openSnackbar,
    closeSnackbar: (): void => {
      setSnackbarMessage(null);
    },
  };
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
const SnackbarContainer = createContainer(useSnackMessage);
export default SnackbarContainer;
