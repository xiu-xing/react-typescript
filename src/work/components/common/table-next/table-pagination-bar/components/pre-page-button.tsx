import { IconButton } from "@material-ui/core";
import { ChevronLeft } from "mdi-material-ui";
import React from "react";

interface PrePageButtonProps {
  disabled?: boolean;
  loading: boolean;
  currentPage: number;
  onClick(prePageNumber: number): void;
}

const PrePageButton: React.FunctionComponent<PrePageButtonProps> = (props) => {
  return (
    <IconButton
      disabled={props.disabled || props.loading || props.currentPage === 0}
      onClick={(): void => {
        props.onClick(props.currentPage - 1);
      }}
    >
      <ChevronLeft />
    </IconButton>
  );
};

export default PrePageButton;
