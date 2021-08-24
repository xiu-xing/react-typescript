import {  createStyles, createTheme, makeStyles, Theme } from "@material-ui/core";
import { CreateCSSProperties } from "@material-ui/core/styles/withStyles";
import { GridColumnWidth } from "./types";

export const gridTheme = createTheme({
  palette: {
    primary: {
      main: "#4F709B",
    },
    secondary: {
      main: "#4F709B",
    },
  },
});

export const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "relative",
    },
  }),
);

export const useMiscStyles = makeStyles((theme: Theme) =>
  createStyles({
    disableAnimation: {
      transform: "none !important",
    },
    scrollbar: {
      height: "100%",
      maxHeight: "100%",
      "& .simplebar-horizontal .simplebar-scrollbar::before": {
        opacity: 0.5,
      },
    },
  }),
);

export const useGridStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "100%",
    },
    mask: {
      position: "absolute",
      inset: 0,
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
      justifyContent: "center",
    },
  }),
);

export const useGridMaskStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "100%",
    },
  }),
);

export const useTableColumnWidthResizingStyles = makeStyles(() =>
  createStyles({
    root: (columnWidths: GridColumnWidth[]) => {
      const styles: CreateCSSProperties<GridColumnWidth[]> = {
        "& tbody tr:nth-of-type(odd) td": {
          backgroundColor: "#F5F6F9",
        },
        "& tbody tr:nth-of-type(even) td": {
          backgroundColor: "#fff",
        },
      };
      if (columnWidths.length === 0) {
        return styles;
      }

      let lastFixColumnId: string | null = null;
      columnWidths.forEach((columnWidth) => {
        if (columnWidth.fixed) {
          lastFixColumnId = columnWidth.id;
        }
      });

      columnWidths.forEach((columnWidth, index) => {
        styles[`& colgroup col:nth-child(${index + 1})`] = {
          width: `${columnWidth.width}px !important`,
          color: "white !important",
        };
        if (columnWidth.fixed) {
          styles[`& tbody tr td:nth-of-type(${index + 1})`] = {
            position: "sticky",
            left: columnWidth.leftSpace,
            ...(lastFixColumnId === columnWidth.id
              ? {
                  borderRight: "1px solid rgba(224, 224, 224, 1)",
                }
              : {
                  borderRight: "none",
                }),
          };
          styles[`& thead tr th:nth-of-type(${index + 1})`] = {
            position: "sticky",
            left: columnWidth.leftSpace,
            zIndex: 500,
            ...(lastFixColumnId === columnWidth.id
              ? {
                  borderRight: "1px solid rgba(224, 224, 224, 1)",
                }
              : {
                  borderRight: "none",
                }),
          };
        } else {
          styles[`& tbody tr td:nth-of-type(${index + 1})`] = {
            position: "static",
            left: columnWidth.leftSpace,
            borderRight: "none",
          };
          styles[`& thead tr th:nth-of-type(${index + 1})`] = {
            position: "sticky",
            left: "unset",
            zIndex: 200,
            borderRight: "none",
          };
        }
      });
      styles["backgroundColor"] = "white";
      return styles;
    },
  }),
);

export const useTableStyles = makeStyles(() =>
  createStyles({
    headerFixed: {
      "& thead th": {
        // zIndex: 1000,
        position: "sticky",
        top: 0,
      },
    },
    cell: {
      transform: "none !important",
      padding: "0 !important",
      height: "36px !important",
      minHeight: "36px !important",
      fontFamily: "Noto Sans SC",
      fontSize: 14,
      fontWeight: 500,
      color: "#333",
      borderBottom: "none",
      zIndex: 1,
    },
    stubHeaderCell: {
      backgroundColor: "#fff",
      zIndex: 500,
      borderBottom: "1px solid #eee !important",
      textAlign: "center",
    },
    row: {},
    highlightRow: {
      // "& td": {
      //   borderTop: "2px solid #4F709B",
      //   borderBottom: "2px solid #4F709B",
      // },
      // "& td:nth-child(0n+1)": {
      //   borderLeft: "2px solid #4F709B",
      //   borderRadius: "6px 0px 0px 6px",
      // },
      // "& td:last-child": {
      //   borderRight: "2px solid #4F709B !important",
      //   borderRadius: "0px 6px 6px 0px",
      // },
    },
  }),
);

export const useTableHeaderRowStyles = makeStyles((theme: Theme) =>
  createStyles({
    row: {},
    cell: {
      transform: "none !important",
      backgroundColor: "#fff",
      borderBottom: "1px solid #eee !important",
      fontFamily: "Noto Sans SC",
      fontSize: 12,
      padding: "0px 16px !important",
      color: "#333",
      height: 30,
      zIndex: 200,
    },
  }),
);

export const useTableFixedColumnsStyles = makeStyles((theme: Theme) =>
  createStyles({
    cell: {
      backgroundColor: "#fff",
      borderBottom: "none",
      fontFamily: "Noto Sans SC",
      fontSize: 12,
      fontWeight: 500,
      padding: "0px 16px !important",
      color: "#333",
    },
    headerCell: {
      zIndex: 500,
    },
  }),
);

// Table Selection
export const useTableSelectionStyles = makeStyles((theme: Theme) =>
  createStyles({
    cell: {
      backgroundColor: "#fff",
      borderBottom: "none",
      fontFamily: "Noto Sans SC",
      fontSize: 12,
      fontWeight: 500,
      color: "#333",
      padding: "0px !important",
      zIndex: 1,
    },
    headerCell: {
      zIndex: 500,
    },
  }),
);
