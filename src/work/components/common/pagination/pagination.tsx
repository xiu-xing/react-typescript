import { IconButton, StyledComponentProps, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { ChevronLeft, ChevronRight } from "mdi-material-ui";
import React from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      alignItems: "center",
    },
    page: {
      marginLeft: theme.spacing(2),
      marginRight: theme.spacing(2),
      fontSize: "14px",
      whiteSpace: "nowrap",
      color: "#333",
    },
  }),
);

type PaginationClassKey = "preButton" | "page" | "nextButton" | "preIcon" | "nextIcon" | "root";

interface PaginationProps extends StyledComponentProps<PaginationClassKey> {
  disable?: boolean;
  loading?: boolean;
  currentPage: number;
  totalPage: number;
  onPrePageButtonClick?: () => void;
  onNextPageButtonClick?: () => void;
}

const Pagination: React.FunctionComponent<PaginationProps> = (props) => {
  const classes = useStyles();

  const { disable, loading, currentPage, totalPage, onPrePageButtonClick, onNextPageButtonClick } = props;

  return (
    <div className={clsx(classes.root, props.classes?.root)}>
      <IconButton
        disabled={disable || loading || currentPage === 1}
        onClick={(): void => {
          onPrePageButtonClick?.();
        }}
        className={props.classes?.preButton}
        size="small"
      >
        <ChevronLeft className={props.classes?.preIcon} />
      </IconButton>
      <Typography className={clsx(classes.page, props.classes?.page)}>{`${currentPage} / ${totalPage}`}</Typography>
      <IconButton
        disabled={disable || loading || currentPage >= totalPage}
        onClick={(): void => {
          onNextPageButtonClick?.();
        }}
        className={props.classes?.nextButton}
        size="small"
      >
        <ChevronRight className={props.classes?.nextIcon} />
      </IconButton>
    </div>
  );
};

export default Pagination;
