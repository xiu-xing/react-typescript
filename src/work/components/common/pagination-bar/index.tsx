import { ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { ChevronLeft, ChevronRight } from "mdi-material-ui";
import React, { ReactNode, useMemo } from "react";
import NumberFormat from "react-number-format";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexWrap: "wrap",
      columnGap: 16,
    },
    buttonBox: {
      alignItems: "center",
      width: "fit-content",
      display: "flex",
    },
    button: {
      height: 20,
      borderRadius: 20,
    },
    normal: {
      color: theme.palette.primary.main,
    },
    disable: {
      color: "#999",
    },
  }),
);

interface PaginationBarProps {
  prefix?: ReactNode;
  suffix?: ReactNode;
  count: number;
  pageSize: number;
  page: number;
  disableBackwardButton?: boolean;
  disableForwardButton?: boolean;
  onPageChanged?: (page: number) => void;
  onClickPreviousPage?: () => void;
  onClickNextPage?: () => void;
}

const PaginationBar: React.FunctionComponent<PaginationBarProps> = (props) => {
  const classes = useStyles();
  const {
    prefix,
    suffix,
    count,
    pageSize,
    page,
    onClickPreviousPage,
    onClickNextPage,
    disableBackwardButton,
    disableForwardButton,
  } = props;
  const totalPage = Math.ceil(count / pageSize);
  const disableBackwardButtonMemo = useMemo(() => {
    if (disableBackwardButton != undefined) {
      return disableBackwardButton;
    }
    return page <= 1;
  }, [disableBackwardButton, page]);
  const disableForwardButtonMemo = useMemo(() => {
    if (disableForwardButton != undefined) {
      return disableForwardButton;
    }
    return page >= totalPage;
  }, [disableForwardButton, page, totalPage]);

  return (
    <div className={classes.root}>
      {prefix}
      <div className={classes.buttonBox}>
        <ButtonBase
          onClick={onClickPreviousPage}
          disabled={disableBackwardButtonMemo}
          className={clsx(classes.button, disableBackwardButtonMemo ? classes.disable : classes.normal)}
          style={{ marginRight: 5 }}
        >
          <ChevronLeft
            style={{
              fontSize: 20,
            }}
          />
        </ButtonBase>
        <Typography style={{ whiteSpace: "pre", fontSize: 14 }}>
          <NumberFormat value={page <= totalPage ? page : totalPage} displayType="text" thousandSeparator />
          &nbsp;/&nbsp;
          <NumberFormat value={totalPage} displayType="text" thousandSeparator />
        </Typography>
        <ButtonBase
          onClick={onClickNextPage}
          disabled={disableForwardButtonMemo}
          className={clsx(classes.button, disableForwardButtonMemo ? classes.disable : classes.normal)}
          style={{ marginLeft: 5 }}
        >
          <ChevronRight
            style={{
              fontSize: 20,
            }}
          />
        </ButtonBase>
      </div>
      {suffix}
    </div>
  );
};

export default PaginationBar;
