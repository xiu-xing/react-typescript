/* eslint-disable react-hooks/exhaustive-deps */
import { TableColumnWidthInfo as DxTableColumnWidthInfo } from "@devexpress/dx-react-grid";
import { Table as DxTable, TableHeaderRow as DxTableHeaderRow } from "@devexpress/dx-react-grid-material-ui";
import { createStyles, makeStyles } from "@material-ui/core";
import _ from "lodash";
import React, {
  ComponentType,
  forwardRef,
  MutableRefObject,
  ReactNode,
  useCallback,
  useEffect,
  useMemo,
  useRef,
  useState,
} from "react";
import { RichTextModel } from "../../../models/richText/index-next";
import { TableColumnModel } from "../../../models/table/tableColumn";
import { TableColumnNextModel } from "../../../models/table/tableColumnNext";
import RichTextNext from "../rich-text-next";
import TableNext from "../table-next";
import TableContainer from "../table-next/tableContainer";
import { TableProps } from "../table/table";
import TableColumnConfigurationDialog from "../table/table-column-configuration-dialog/table-column-configuration-dialog";

const SELECTION_CELL_WIDTH = 58;

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "relative",
    },
    cell: {
      height: 30,
      borderBottom: "none",
      padding: "8px 16px !important",
    },
    table: {
      height: "100%",
    },
    backDrop: {
      position: "absolute",
      backgroundColor: "#fff",
      opacity: 0.5,
      width: "100%",
      height: "100%",
      zIndex: 501,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
    loadingContainer: {
      position: "absolute",
      zIndex: 301,
      top: 30,
      left: 0,
      bottom: 0,
      right: 0,
      display: "flex",
      justifyContent: "center",
    },
    loading: {
      marginTop: 30,
    },
  }),
);

interface TableCellProps {
  cellValues: RichTextModel[];
  blur?: boolean;
  columnModel?: TableColumnModel;
  rowExtraData?: unknown[];
}

export interface CommonTableNextProps extends TableProps {
  proMaskComponent?: ReactNode;
  proMaskContainerClassName?: string;
  columnsEditable?: boolean;
  // 容器的宽度
  width?: number;
  TableCell?: ComponentType<TableCellProps>;
}

export type CommonTableRef = MutableRefObject<{
  resizeHandler: () => void;
}>;

const CommonTableNext = forwardRef<CommonTableRef, CommonTableNextProps>(function CommonTableNext(props, ref) {
  const classes = useStyles();
  const tableContainer = TableContainer.useContainer();
  const { columnsEditable, width, ...leftProps } = props;
  const [tableWidth, setTableWidth] = useState(width || 0);
  const [tableColumnWidths, setTableColumnWidths] = useState<DxTableColumnWidthInfo[]>([]);
  const rootRef = useRef<HTMLDivElement | null>(null);
  const resizeHandler: () => void = useCallback(() => {
    if (rootRef.current) {
      if (tableWidth !== rootRef.current.clientWidth) {
        setTableWidth(rootRef.current.clientWidth);
      }
    }
  }, []);

  const CommonTableCellComponent = useCallback((cellProps: DxTable.DataCellProps) => {
    const columnModel = cellProps.column as TableColumnNextModel;
    const cellValues = cellProps.row[columnModel.name] ?? [];

    return (
      <DxTable.Cell {...cellProps} className={classes.cell}>
        <RichTextNext models={cellValues} alignment={columnModel.align} />
      </DxTable.Cell>
    );
  }, []);

  const CommonTableHeaderRowContentComponent = useCallback((props) => {
    const alignment = _.get(props, "column.align") ?? "left";
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

    return <DxTableHeaderRow.Content {...props} style={{ justifyContent: alignmentStyle }} />;
  }, []);

  useEffect(() => {
    window.addEventListener("resize", resizeHandler);
    return (): void => {
      window.removeEventListener("resize", resizeHandler);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    const rowSelectableColumnWidth = props.rowSelectable ? SELECTION_CELL_WIDTH : 0;
    const totalColumnWidth = _.sum(tableContainer.columns.map((column) => column.minWidth));
    const columnWidths: DxTableColumnWidthInfo[] = [];

    if (totalColumnWidth < tableWidth - rowSelectableColumnWidth) {
      tableContainer.columns.forEach((column) => {
        const columnWidth = `${Math.round((column.minWidth / totalColumnWidth) * 100)}%`;
        columnWidths.push({
          columnName: column.name,
          width: columnWidth,
        });
      });
    } else {
      tableContainer.columns.forEach((column) => {
        columnWidths.push({
          columnName: column.name,
          width: column.minWidth,
        });
      });
    }
    if (!_.isEqual(columnWidths, tableColumnWidths)) {
      setTableColumnWidths(columnWidths);
    }
  }, [tableContainer.id, tableContainer.columns, props.rowSelectable, tableWidth]);

  const noData = Boolean(!tableContainer.loading && !tableContainer.rows.length);

  return useMemo(() => {
    return (
      <>
        {columnsEditable ? <TableColumnConfigurationDialog /> : null}
        <TableNext
          {...leftProps}
          className={classes.table}
          cellComponent={CommonTableCellComponent}
          headerRowContentComponent={CommonTableHeaderRowContentComponent}
          // columnExtensions={commonTableColumnExtensions}
          // columnsSortableExtension={columnsSortableExtension}
          columnWidths={tableColumnWidths}
          noData={noData}
        />
      </>
    );
  }, [tableContainer.loading, tableColumnWidths]);
});

export default CommonTableNext;
