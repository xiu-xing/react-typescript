import { ButtonBase, SvgIcon, Typography } from "@material-ui/core";
import _ from "lodash";
import React, { ReactNode, useMemo } from "react";
import { OrderColumn } from "../../../../../generated/graphql";
import { RichTextModel } from "../../../../../models/richText/index-next";
import { CommonGridColumn } from "../../../common-grid-components/grid/types";
import RichTextNext from "../../../rich-text-next";
import { SVGFix, SVGFixed, SVGSortAscending, SVGSortDefault, SVGSortDescending } from "../../assets";
import { GridCellRenderingPlugin } from "../../core/plugin";
import { GridColumn, GridRow } from "../../core/types";

export default class RichTextCellRenderingPlugin implements GridCellRenderingPlugin {
  rowSelectionMenu?: ReactNode;

  renderingHeaderCell(row: GridRow, column: GridColumn): React.ReactNode {
    const columnModel = column as CommonGridColumn;
    const alignment = _.get(column, "align") ?? "left";
    const insights = _.get(column, "insights");
    const fixable = _.get(column, "fixable");
    const sortable = _.get(column, "sortable");
    const hasInsights = insights && insights.length > 0;
    const anyIcon = hasInsights || fixable || sortable;

    let alignmentStyle = "flex-start";
    switch (alignment) {
      case "left":
        alignmentStyle = "flex-start";
        break;
      case "right":
        alignmentStyle = "flex-end";
        break;
      case "middle":
        alignmentStyle = "center";
        break;
    }

    const fixButtonHandler = () => {
      columnModel.setColumns &&
        columnModel.setColumns((prevColumns) => {
          const gridColumns: GridColumn[] = [];

          prevColumns.forEach((item) => {
            const columnItem = item as CommonGridColumn;
            if (columnItem.name === columnModel.name) {
              columnItem.isFixed = !columnModel.isFixed;
              columnItem.isFixed
                ? columnModel.onColumnFixed?.(columnModel.name)
                : columnModel.onColumnUnfixed?.(columnModel.name);
            }
            gridColumns.push(columnItem);
          });

          return gridColumns;
        });
    };

    const sortButtonHandler = () => {
      columnModel.setColumns &&
        columnModel.setColumns((prevColumns) => {
          const columns = Array.from(prevColumns);
          const gridColumns: GridColumn[] = [];

          columns.forEach((item) => {
            const columnItem = item as CommonGridColumn;
            const sortColumn = {} as OrderColumn;
            sortColumn.columnId = columnItem.name;
            if (columnItem.name === columnModel.name) {
              switch (columnModel.sortType) {
                case "none":
                  sortColumn.isDesc = false;
                  columnItem.sortType = "ascending";
                  break;
                case "ascending":
                  sortColumn.isDesc = true;
                  columnItem.sortType = "descending";
                  break;
                case "descending":
                  sortColumn.isDesc = undefined;
                  columnItem.sortType = "none";
                  break;
                default:
                  break;
              }
              if (columnModel.sortType === "none") {
                columnModel.onSortChange && columnModel.onSortChange([]);
                gridColumns.push(columnItem);
                return;
              }
              columnModel.onSortChange && columnModel.onSortChange([sortColumn]);
              gridColumns.push(columnItem);
              return;
            }

            columnItem.sortType = "none";
            gridColumns.push(columnItem);
          });

          return gridColumns;
        });
    };

    const chartButtonHandler = () => {
      columnModel.setColumns &&
        columnModel.setColumns((prevColumns) => {
          const gridColumns: GridColumn[] = [];

          prevColumns.forEach((item) => {
            const columnItem = item as CommonGridColumn;
            if (columnItem.name === columnModel.name) {
              columnItem.showChart = !columnItem.showChart;
              columnItem.showChart
                ? columnModel.showChartHandler && columnModel.showChartHandler(columnModel.insights)
                : columnModel.showChartHandler && columnModel.showChartHandler([]);
              gridColumns.push(columnItem);
              return;
            }
            columnItem.showChart = false;
            gridColumns.push(columnItem);
          });

          return gridColumns;
        });
    };

    return (
      <div style={{ justifyContent: alignmentStyle, display: "flex", width: "100%", flexWrap: "nowrap" }}>
        {anyIcon && alignmentStyle === "flex-end" && <div style={{ flexGrow: 1 }} />}
        <Typography
          style={{
            fontSize: "12px",
            color: "#333",
            overflow: "hidden",
            whiteSpace: "nowrap",
            textOverflow: "ellipsis",
          }}
        >
          {columnModel.title}
        </Typography>
        {anyIcon && alignmentStyle === "flex-start" && <div style={{ flexGrow: 1 }} />}
        <>
          {hasInsights && (
            <ButtonBase style={{ marginLeft: 4 }} onClick={chartButtonHandler}>
              {columnModel.showChart ? (
                <SvgIcon viewBox="0 0 16 16" color="primary" style={{ fontSize: 16 }}>
                  <path d="M3.524 3.316V12.8h10.8V14h-12V3.316h1.2zm6.25-.466v6h-1.8v-6h1.8m-3 3.4v5h-1.8v-5h1.8" />
                  <path d="M13.074 5.25v5h-1.8v-5h1.8" />
                </SvgIcon>
              ) : (
                <SvgIcon viewBox="0 0 16 16" style={{ color: "#666", fontSize: 16 }}>
                  <path d="M3.524 3.316V12.8h10.8V14h-12V3.316h1.2zm6.25-.466v6h-1.8v-6h1.8m-3 3.4v5h-1.8v-5h1.8" />
                  <path d="M13.074 5.25v5h-1.8v-5h1.8" />
                </SvgIcon>
              )}
            </ButtonBase>
          )}
          {fixable && (
            <ButtonBase onClick={fixButtonHandler}>
              {columnModel.isFixed ? (
                <SVGFixed style={{ pointerEvents: "none" }} />
              ) : (
                <SVGFix style={{ pointerEvents: "none" }} />
              )}
            </ButtonBase>
          )}
          {sortable && (
            <ButtonBase onClick={sortButtonHandler}>
              {columnModel.sortType === "none" ? (
                <SVGSortDefault style={{ pointerEvents: "none" }} />
              ) : columnModel.sortType === "ascending" ? (
                <SVGSortAscending style={{ pointerEvents: "none" }} />
              ) : (
                <SVGSortDescending style={{ pointerEvents: "none" }} />
              )}
            </ButtonBase>
          )}
        </>
      </div>
    );
  }

  renderingCell(row: GridRow, column: GridColumn): ReactNode {
    const columnModel = column as CommonGridColumn;
    const cellValues: unknown[] = _.get(row, columnModel.name) ?? [];
    const models = useMemo(() => {
      return cellValues.map((cellValue) => RichTextModel.fromJSON(cellValue));
    }, [cellValues]);

    return (
      <div style={{ margin: "8px 16px" }}>
        <RichTextNext models={models} alignment={columnModel.align} />
      </div>
    );
  }

  renderingStubHeaderCell(): ReactNode {
    return this.rowSelectionMenu;
  }
}
