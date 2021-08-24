import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";

export const TABLE_PAGINATION_BAR_HEIGHT = 48;

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: TABLE_PAGINATION_BAR_HEIGHT,
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
      backgroundColor: "#fff",
    },
  }),
);

export type PaginationButtonType = "pre" | "next";

// eslint-disable-next-line @typescript-eslint/no-empty-interface
export interface TablePaginationBarProp {}

const TablePaginationBar: React.FunctionComponent<TablePaginationBarProp> = (props) => {
  const classes = useStyles();

  return <Box className={classes.root}>{props.children}</Box>;
};

export default TablePaginationBar;
export { default as EditColumnsButton } from "./components/edit-columns-button";
export { default as NextPageButton } from "./components/next-page-button";
export { default as PrePageButton } from "./components/pre-page-button";
export { default as PageDetails } from "./components/page-details";
export { default as PaginationWidget } from "./components/pagination-widget";
export { default as SeperableVerticalBar } from "./components/seperable-vertical-bar";
