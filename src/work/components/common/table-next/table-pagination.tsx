import { Box, ButtonBase, IconButton, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import _ from "lodash";
import { ChevronLeft, ChevronRight } from "mdi-material-ui";
import React, { ReactNode, useEffect, useMemo, useState } from "react";
import TableContainer from "./tableContainer";
const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
      justifyContent: "space-between",
    },
    pageItem: {
      height: 32,
      minWidth: 32,
      borderRadius: 2,
    },
    pageItemSelect: {
      background: "rgba(79, 112, 155, 0.12)",
    },
    pageItemText: {
      color: "#999999",
      margin: "0px 4px",
    },
    pageItemTextSelect: {
      color: theme.palette.primary.main,
    },
    iconButton: {
      // padding: theme.spacing(1),
      color: theme.palette.primary.main,
    },
  }),
);

type TablePaginationItemType = number | "ellipsis";

interface TablePaginationProps {
  pageSize: number;
  page: number;
  onChange: (page: number) => void;
  disabled?: boolean;
}

const TablePagination: React.FunctionComponent<TablePaginationProps> = (props) => {
  const classes = useStyles();
  const tableContainer = TableContainer.useContainer();

  const visibleSize = 2;
  const ellipsisSize = 3;
  const [items, setItems] = useState<TablePaginationItemType[]>([]);
  // const [pageCount, setPageCount] = useState<number>(0);

  const pageCount = useMemo(() => {
    return Math.ceil(tableContainer.rowCount / props.pageSize);
  }, [tableContainer.rowCount, props.pageSize]);

  function generateItems(page: number): TablePaginationItemType[] {
    let resultItems: TablePaginationItemType[] = [];
    if (pageCount === 0) {
      return resultItems;
    }
    if (pageCount < visibleSize + ellipsisSize + 1) {
      resultItems = _.concat(resultItems, _.range(0, pageCount));
      return resultItems;
    }

    if (page - visibleSize > ellipsisSize) {
      resultItems.push(0);
      resultItems.push("ellipsis");
      resultItems.push(page - 2);
      resultItems.push(page - 1);
    } else {
      if (page > 0) {
        resultItems = _.concat(resultItems, _.range(0, page));
      }
    }

    resultItems.push(page);

    if (page + visibleSize < pageCount - ellipsisSize) {
      resultItems.push(page + 1);
      resultItems.push(page + 2);
      resultItems.push("ellipsis");
      resultItems.push(pageCount - 1);
    } else {
      if (page < pageCount - 1) {
        resultItems = _.concat(resultItems, _.range(page + 1, pageCount));
      }
    }
    return resultItems;
  }

  // useEffect(() => {
  //   setPageCount(Math.ceil(tableContainer.rowCount / props.pageSize));
  // }, [tableContainer.rowCount, props.pageSize]);

  useEffect(() => {
    setItems(generateItems(props.page));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [props.page, pageCount]);

  function item(key: number, type: TablePaginationItemType): ReactNode {
    switch (type) {
      case "ellipsis":
        return (
          <Typography
            key={key}
            style={{
              width: 32,
              margin: "0px 4px",
              textAlign: "center",
              color: "#999999",
            }}
          >
            ...
          </Typography>
        );
      default:
        return (
          <ButtonBase
            disableRipple
            disabled={props.disabled}
            className={clsx(classes.pageItem, props.page === type ? classes.pageItemSelect : null)}
            key={key}
            onClick={(): void => {
              props.onChange(type);
            }}
          >
            <Typography className={clsx(classes.pageItemText, props.page === type ? classes.pageItemTextSelect : null)}>
              {type + 1}
            </Typography>
          </ButtonBase>
        );
    }
  }

  return (
    <Box className={classes.root}>
      <IconButton
        className={classes.iconButton}
        size="small"
        disabled={props.page <= 0}
        onClick={(): void => {
          props.onChange(props.page - 1);
        }}
      >
        <ChevronLeft />
      </IconButton>
      {items.map((itemType, index) => item(index, itemType))}
      <IconButton
        className={classes.iconButton}
        size="small"
        disabled={props.page >= pageCount - 1}
        onClick={(): void => {
          props.onChange(props.page + 1);
        }}
      >
        <ChevronRight />
      </IconButton>
    </Box>
  );
};

export default TablePagination;
