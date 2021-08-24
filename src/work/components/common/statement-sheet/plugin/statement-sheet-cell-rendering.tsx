import { createStyles, makeStyles, Typography } from "@material-ui/core";
import _ from "lodash";
import React, { ReactNode } from "react";
import { StatementSheetDataConfig } from "../../../../generated/graphql";
import { GridCellRenderingPlugin } from "../../grid/core/plugin";
import { GridColumn } from "../../grid/core/types";

const useStyles = makeStyles(() =>
  createStyles({
    header: {
      justifyContent: "center",
      display: "flex",
      width: "100%",
    },
    headerText: {
      fontSize: "14px",
      color: "#333",
      fontWeight: 500,
      fontFamily: "Noto Sans SC",
    },
  }),
);

export default class StatementSheetCellRenderingPlugin implements GridCellRenderingPlugin {
  private _dataConfig: Map<string, StatementSheetDataConfig>;

  constructor(dataConfig: Map<string, StatementSheetDataConfig>) {
    this._dataConfig = dataConfig;
  }

  renderingHeaderCell(row: unknown, column: GridColumn): React.ReactNode {
    const classes = useStyles();
    return (
      <div className={classes.header}>
        <Typography className={classes.headerText}>{column.title}</Typography>
      </div>
    );
  }

  renderingCell(row: unknown, column: GridColumn): ReactNode {
    const value = _.get(row, column.name);
    const rowId = _.get(row, "id");
    const format = this._dataConfig.get(rowId)?.dataFormat;
    const alignment = this._dataConfig.get(rowId)?.alignment;
    let alignmentStyle = "flex-start";
    let fontColor = "#333";

    switch (alignment) {
      case "ALIGNMENT_LEFT":
        alignmentStyle = "flex-start";
        break;
      case "ALIGNMENT_RIGHT":
        alignmentStyle = "flex-end";
        break;
      case "ALIGNMENT_MIDDLE":
        alignmentStyle = "center";
        break;
    }

    const str = value as string;

    if ((format === "FORMAT_FLOAT" || format === "FORMAT_INT") && str && str.length > 1 && str.startsWith("-")) {
      fontColor = "#E00000";
    }

    return (
      <div style={{ justifyContent: alignmentStyle, display: "flex", width: "100%", padding: "0px 16px" }}>
        <Typography style={{ fontSize: "14px", color: fontColor, fontFamily: "Noto Sans SC" }}>{value}</Typography>
      </div>
    );
  }
}
