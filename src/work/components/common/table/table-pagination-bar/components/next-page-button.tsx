import { IconButton } from "@material-ui/core";
import { ChevronRight } from "mdi-material-ui";
import React from "react";

interface NextPageButtonProps {
  disabled?: boolean;
  loading: boolean;
  currentPage: number;
  totalPage: number;
  onClick(prePage: number): void;
}

const NextPageButton: React.FunctionComponent<NextPageButtonProps> = (props) => {
  return (
    <IconButton
      disabled={props.disabled || props.loading || props.currentPage + 1 >= props.totalPage}
      onClick={(): void => {
        props.onClick(props.currentPage + 1);
      }}
    >
      <ChevronRight />
    </IconButton>
  );
};

export default NextPageButton;
