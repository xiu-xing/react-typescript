import { makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { ReactNode, useMemo } from "react";
import { RichTextModel } from "../../../models/richText/index-next";
import { TableColumnAlign, TableColumnNextModel } from "../../../models/table/tableColumnNext";
import CommonTableCellItem from "./common-table-cell-item";

const useStyles = makeStyles({
  root: {
    padding: "8px 16px",
    whiteSpace: "normal",
    position: "relative",
  },
  cellOverflow: {
    whiteSpace: "normal",
    wordBreak: "break-all",
    textOverflow: "ellipsis",
    overflow: "hidden",
  },
  cellBlur: {
    filter: "blur(4px)",
    pointerEvents: "none",
    userSelect: "none",
  },
  row: {
    display: "flex",
    flexDirection: "row",
    flexWrap: "wrap",
    alignItems: "center",
  },
});

interface CommonTableCellNextProps {
  models: RichTextModel[];
  blur?: boolean;
  columnModel?: TableColumnNextModel;
  rowExtraData?: unknown[];
}

/**
 * CommonTableCell TableCell 一个 cell 支持多种不同类型的 element
 * @param props
 */
const CommonTableCellNext: React.FunctionComponent<CommonTableCellNextProps> = (props) => {
  const classes = useStyles();

  const { models, columnModel } = props;

  const rows = useMemo<React.ReactNode[][]>(() => {
    const rowsArray: ReactNode[][] = [];

    let rowChildren: ReactNode[] = [];
    models.forEach((model, index) => {
      switch (model.pattern) {
        case "break_line":
          rowsArray.push(Array.from(rowChildren));
          rowChildren = [];
          break;
        default:
          rowChildren.push(<CommonTableCellItem key={index} model={model} />);
          break;
      }
    });

    rowsArray.push(rowChildren);
    return rowsArray;
  }, [models]);

  function columnAlign() {
    switch (columnModel?.align) {
      case TableColumnAlign.Left:
        return "flex-start";
      case TableColumnAlign.Right:
        return "flex-end";
      case TableColumnAlign.Middle:
        return "center";
    }
    return "flex-start";
  }

  return (
    <div className={clsx(classes.root)}>
      {rows.map((rowChildren, index) => (
        <div
          className={classes.row}
          key={index}
          style={{
            justifyContent: columnAlign(),
          }}
        >
          {rowChildren}
        </div>
      ))}
    </div>
  );
};

export default CommonTableCellNext;
