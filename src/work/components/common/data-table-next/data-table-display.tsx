import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { forwardRef, ReactNode, useEffect } from "react";
import CommonTableNext from "../common-table-next";
import TableContainer from "../table-next/tableContainer";
import DataTableBottom, { DataTableBottomProps } from "./data-table-bottom";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: (autoHeight): string | undefined => (!autoHeight ? "100%" : undefined),
      display: "flex",
      flexDirection: "column",
    },
    skeletonBox: {
      overflow: "hidden",
      height: "100%",
      width: "100%",
    },
    skeletonRow: {
      display: "grid",
      gridAutoFlow: "row",
      gridTemplateColumns: "1fr 3fr 2fr",
      margin: "8px 16px",
    },
    skeleton: {
      margin: "0 16px",
    },
    table5Rows: {
      height: 180,
    },
    table10Rows: {
      height: 330,
    },
    tableConatiner: {
      display: "flex",
    },
    tableBox: {
      overflow: "hidden",
      width: "100%",
    },
    centerBox: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      width: "100%",
      boxSizing: "border-box",
      borderBottom: "1px solid #EEE",
    },
    bottomLine: {
      boxSizing: "border-box",
      height: 330,
    },
  }),
);

export interface DataTableDisplayProps {
  onTotalCountChange?: (totalCount: number) => void;
  skeletonLineCount?: number;
  tableBottom?: DataTableBottomProps;
  autoHeight?: boolean;
  showMaxRows?: boolean;
  getResizeTableHandler?(fun: () => void): void;
}

const DataTableDisplay = forwardRef<HTMLDivElement, DataTableDisplayProps>(function DataTableDisplay(
  { autoHeight = false, ...props },
  ref,
) {
  const classes = useStyles(autoHeight);

  // const skeletonRowCount = props.skeletonLineCount || 5;
  const tableContainer = TableContainer.useContainer();

  // function skeletonComponent(): ReactNode {
  //   return (
  //     <>
  //       {_.range(0, skeletonRowCount).map((value) => (
  //         <div className={classes.skeletonRow} key={`row_${value}`}>
  //           {_.range(0, 3).map((value) => (
  //             <Skeleton key={value} classes={{ root: classes.skeleton }} variant="text" />
  //           ))}
  //         </div>
  //       ))}
  //     </>
  //   );
  // }

  useEffect(() => {
    props.onTotalCountChange?.(tableContainer.rowCount);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [tableContainer.rowCount]);

  function contentComponent(): ReactNode {
    if (tableContainer.id) {
      return (
        <div className={classes.root} ref={ref}>
          <CommonTableNext
            ref={(commonTableRef): void => {
              const fun = commonTableRef?.current?.resizeHandler;
              if (fun) {
                props.getResizeTableHandler?.(fun);
              }
            }}
          />
          {!tableContainer.showUpgradeOverlay && tableContainer.rowCount != 0 && props.tableBottom && (
            <DataTableBottom {...props.tableBottom} />
          )}
        </div>
      );
    } else {
      return null;
    }
  }

  return <>{contentComponent()}</>;
});

export default DataTableDisplay;
