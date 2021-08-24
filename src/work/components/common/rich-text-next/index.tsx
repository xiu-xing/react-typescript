import { Typography } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import _ from "lodash";
import React, { ReactNode, useEffect, useMemo, useState } from "react";
import { RichTextModel } from "../../../models/richText/index-next";
import { TableColumnAlign } from "../../../models/table/tableColumnNext";
import { CommonGridColumnAlign } from "../common-grid-components/grid/types";
import RichTextFutureItem from "./item";

const useStyles = makeStyles({
  root: {
    whiteSpace: "normal",
    display: "flex",
    flexDirection: "column",
    rowGap: "4px",
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
    fontWeight: 400,
    display: "inline-flex",
    alignItems: "center",
    flexWrap: "wrap",
    fontSize: 14,
    whiteSpace: "normal",
    // "& div:nth-child(1)": {
    //   marginTop: 0,
    // },
  },
});

interface RichTextNextProps {
  models: RichTextModel[];
  alignment?: TableColumnAlign | CommonGridColumnAlign;
}

/**
 * CommonTableCell TableCell 一个 cell 支持多种不同类型的 element
 * @param props
 */
const RichTextNext: React.FunctionComponent<RichTextNextProps> = (props) => {
  const classes = useStyles();

  const { models, alignment } = props;

  const [modelsMemo, setModelsMemo] = useState(models);

  useEffect(() => {
    if (!_.isEqual(models, modelsMemo)) {
      setModelsMemo(models);
    }
  }, [models]);

  const rows = useMemo<React.ReactNode[][]>(() => {
    const rowsArray: ReactNode[][] = [];

    let rowChildren: ReactNode[] = [];
    modelsMemo &&
      modelsMemo.forEach((model, index) => {
        switch (model.pattern) {
          case "break_line":
            rowsArray.push(Array.from(rowChildren));
            rowChildren = [];
            break;
          default:
            rowChildren.push(<RichTextFutureItem key={index} model={model} />);
            break;
        }
      });

    rowsArray.push(rowChildren);
    return rowsArray;
  }, [modelsMemo]);

  function columnAlign() {
    switch (alignment) {
      case TableColumnAlign.Left:
        return "flex-start";
      case TableColumnAlign.Right:
        return "flex-end";
      case TableColumnAlign.Middle:
        return "center";
    }
    return "flex-start";
  }

  function content() {
    if (!modelsMemo || modelsMemo.length === 0) {
      return (
        <div
          className={classes.row}
          style={{
            alignSelf: columnAlign(),
          }}
        >
          <Typography>-</Typography>
        </div>
      );
    }
    return rows.map((rowChildren, index) => (
      <div
        className={classes.row}
        key={index}
        style={{
          alignSelf: columnAlign(),
        }}
      >
        {rowChildren}
      </div>
    ));
  }

  return <div className={clsx(classes.root)}>{content()}</div>;
};

export default RichTextNext;
