/* eslint-disable react-hooks/exhaustive-deps */
import {
  SortingState as DxSortingState,
  TableColumnWidthInfo as DxTableColumnWidthInfo,
} from "@devexpress/dx-react-grid";
import { Table as DxTable, TableColumnResizing } from "@devexpress/dx-react-grid-material-ui";
import { Card, CircularProgress, createStyles, makeStyles, Theme, withStyles } from "@material-ui/core";
import { CSSProperties } from "@material-ui/core/styles/withStyles";
import clsx from "clsx";
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
import ConfigContainer from "../../../containers/configContainer";
import UserContainer from "../../../containers/userContainer";
import { Role } from "../../../generated/graphql";
import { RichTextModel } from "../../../models/richText/index";
import { TableColumnAlign, TableColumnModel } from "../../../models/table/tableColumn";
import AccessAuthenticationBottomText from "../../app/access-control/bottom-text";
import Table, { TableProps } from "../table/table";
import TableColumnConfigurationDialog from "../table/table-column-configuration-dialog/table-column-configuration-dialog";
import TableContainer from "../table/tableContainer";
import CommonTableCell from "./components/common-table-cell";

const SELECTION_CELL_WIDTH = 58;

// 扩展，设置列的名称和宽度
interface OptimizedColumnWidth {
  // 设置 column 的 headerName
  columnName: string;
  // 列的宽度以配置的最小宽度为基础，若表格足够宽，则所有列宽实现等比例缩放
  columnWidth: string | number;
  align?: TableColumnAlign;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      overflow: "hidden",
      position: "relative",
      height: "100%"
    },
    cell: {
      padding: "0px !important",
      height: 30,
      borderTop: "1px solid transparent",
      borderBottomColor: "#EEE",
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
    proMask: {
      zIndex: 999,
      position: "absolute",
      left: "50%",
      bottom: "30%",
      background: "rgba(255,255,255,1)",
      padding: "8px 16px",
      transform: "translate(-50%, 0)",
    },
    proMaskDefaultComponent: {
      overflow: "hidden",
      "& p": {
        fontSize: 16,
      },
    },
    unlockText: {
      color: theme.palette.primary.main,
      cursor: "pointer",
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

const commonTableCellComponentStyles = createStyles({
  cell: {
    padding: "0px !important",
    height: 30,
    borderTop: "1px solid transparent",
    borderBottomColor: "#EEE",
  },
});

interface CommonTableColumnProps {
  columnWidths?: DxTableColumnWidthInfo[];
  columnExtensions?: DxTable.ColumnExtension[];
  columnResizeExtension?: TableColumnResizing.ColumnExtension[];
}

interface TableCellProps {
  cellValues: RichTextModel[];
  cellWrap?: boolean;
  blur?: boolean;
  lineClamp?: number;
  columnModel?: TableColumnModel;
  rowExtraData?: unknown[];
}

export interface CommonTableProps extends TableProps {
  cellWrap?: boolean;
  lineClamp?: number;
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

const CommonTable = forwardRef<CommonTableRef, CommonTableProps>(function CommonTable(props, ref) {
  const classes = useStyles();
  const userContainer = UserContainer.useContainer();
  const tableContainer = TableContainer.useContainer();
  const {
    cellWrap,
    lineClamp,
    proMaskComponent,
    proMaskContainerClassName,
    columnsEditable,
    width,
    TableCell,
    ...leftProps
  } = props;
  const [tableWidth, setTableWidth] = useState(width || 0);
  const rootRef = useRef<HTMLDivElement | null>(null);
  const { user } = UserContainer.useContainer();
  const { accessControlConfigs } = ConfigContainer.useContainer();
  const resizeHandler: () => void = useCallback(
    _.debounce(() => {
      if (rootRef.current) {
        if (tableWidth !== rootRef.current.clientWidth) {
          setTableWidth(rootRef.current.clientWidth);
        }
      }
    }, 10),
    [],
  );
  // 用来更新模糊浮层的宽高，因为浮层会覆盖滚动条，所以需要处理
  const [proMaskContainerStyles, setProMaskContainerStyles] = useState<CSSProperties>();

  useEffect(() => {
    if (typeof ref === "function") {
      ref({ current: { resizeHandler } });
    }
  }, [ref]);

  const CommonTableCellComponent = withStyles(commonTableCellComponentStyles, { name: "CommonTableCellComponent" })(
    (cellProps: DxTable.DataCellProps) => {
      const columnModel = cellProps.column as TableColumnModel;
      const cellValues = cellProps.row[columnModel.name] ?? [];
      let blur = false;

      if (userContainer.user) {
        const isBlur = columnModel.blurRoles[userContainer.user.role || Role.IndividualFree];
        if (isBlur && isBlur === true) {
          blur = true;
        }
        if (cellProps.row["isBlur"] === true) {
          blur = true;
        }
      }

      const rowExtraData = _.get(cellProps.row, "row_data", []);

      return (
        <DxTable.Cell {...cellProps}>
          {TableCell ? (
            <TableCell
              cellWrap={cellWrap}
              cellValues={cellValues}
              blur={blur}
              lineClamp={lineClamp ? lineClamp : columnModel.lineClamp}
              columnModel={columnModel}
              rowExtraData={rowExtraData}
            />
          ) : (
            <CommonTableCell
              cellWrap={cellWrap}
              cellValues={cellValues}
              blur={blur}
              lineClamp={lineClamp ? lineClamp : columnModel.lineClamp}
              columnModel={columnModel}
              rowExtraData={rowExtraData}
            />
          )}
        </DxTable.Cell>
      );
    },
  );

  const cellComponent = useMemo(() => {
    return CommonTableCellComponent;
  }, [userContainer.user, lineClamp, cellWrap]);

  useEffect(() => {
    window.addEventListener("resize", resizeHandler);
    // virtual table 中的 column 宽度不能设置百分比，需要根据容器节点重新设置宽度，这样会导致 table 重新刷新一次
    if (rootRef.current && props.virtualTable) {
      if (tableWidth !== rootRef.current.clientWidth) {
        setTableWidth(rootRef.current.clientWidth);
      }
    }
    return (): void => {
      window.removeEventListener("resize", resizeHandler);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const commonTableColumnProps = useMemo<CommonTableColumnProps>(() => {
    if (tableContainer.id) {
      const rowSelectableColumnWidth = props.rowSelectable ? SELECTION_CELL_WIDTH : 0;
      const totalColumnWidth = _.sum(tableContainer.columns.map((column) => column.minWidth));
      const columnWidths: DxTableColumnWidthInfo[] = [];
      const columnExtensions: DxTable.ColumnExtension[] = [];
      const columnResizeExtension: TableColumnResizing.ColumnExtension[] = [];
      // virtualTable 宽度设置不支持百分比
      if (!props.virtualTable) {
        // 百分比设置
        tableContainer.columns.forEach((column) => {
          const columnWidth = `${Math.round((column.minWidth / totalColumnWidth) * 100)}%`;
          columnWidths.push({
            columnName: column.name,
            width: columnWidth,
          });
          columnExtensions.push({
            columnName: column.name,
            width: columnWidth,
            align: column.align,
          });
          columnResizeExtension.push({
            columnName: column.name,
            minWidth: column.minWidth,
          });
        });
      } else {
        if (totalColumnWidth < tableWidth - rowSelectableColumnWidth) {
          tableContainer.columns.forEach((column) => {
            const columnWidth = (column.minWidth / totalColumnWidth) * (tableWidth - rowSelectableColumnWidth);

            columnWidths.push({
              columnName: column.name,
              width: columnWidth,
            });
            columnExtensions.push({
              columnName: column.name,
              width: columnWidth,
              align: column.align,
            });
            columnResizeExtension.push({
              columnName: column.name,
              minWidth: column.minWidth,
            });
          });
        } else {
          tableContainer.columns.forEach((column) => {
            const columnWidth = column.minWidth;

            columnWidths.push({
              columnName: column.name,
              width: columnWidth,
            });
            columnExtensions.push({
              columnName: column.name,
              width: columnWidth,
              align: column.align,
            });
            columnResizeExtension.push({
              columnName: column.name,
              minWidth: column.minWidth,
            });
          });
        }
      }

      return {
        columnExtensions: columnExtensions,
        // columnWidths: columnWidths,
        columnResizeExtension,
      };
    }
    return {};
  }, [tableContainer.id, tableContainer.columns, props.rowSelectable, tableWidth]);

  const columnsSortableExtension = useMemo<DxSortingState.ColumnExtension[]>(() => {
    if (tableContainer.tableConfig) {
      const newColumnsSortableExtension: DxSortingState.ColumnExtension[] = [];
      for (const columnId in tableContainer.tableConfig.columns) {
        let assessControlUnsortable = false;
        if (user && user.role && accessControlConfigs) {
          const unsortableColumn = accessControlConfigs[columnId + ".unsortable"];
          if (unsortableColumn && unsortableColumn[user.role]) {
            assessControlUnsortable = true;
          }
        }
        const tableColumnModel: TableColumnModel = tableContainer.tableConfig.columns[columnId];
        if (tableColumnModel.sortable) {
          const columnSortableExtensionItem: DxSortingState.ColumnExtension = {
            columnName: tableColumnModel.name,
            sortingEnabled: tableColumnModel.sortable && !assessControlUnsortable,
          };
          newColumnsSortableExtension.push(columnSortableExtensionItem);
        }
      }
      return newColumnsSortableExtension;
    }
    return [];
  }, [tableContainer.tableConfig]);

  const noData = Boolean(!tableContainer.loading && !tableContainer.rows.length);

  // 处理模糊浮层的宽高
  useEffect(() => {
    setTimeout(() => {
      const virtualTableContainer = document.getElementById("VirtualTable");
      if (!virtualTableContainer) {
        return;
      }
      setProMaskContainerStyles({
        right: virtualTableContainer.offsetWidth - virtualTableContainer.clientWidth,
        bottom: virtualTableContainer.offsetHeight - virtualTableContainer.clientHeight,
      });
    }, 1000);
  }, [tableWidth, tableContainer.columns]);

  return (
    <div className={clsx(classes.root, props.className)} ref={rootRef}>
      {columnsEditable ? <TableColumnConfigurationDialog /> : null}
      {tableContainer.rows.length && tableContainer.showProMask ? (
        <Card className={clsx(classes.proMask, proMaskContainerClassName)} style={proMaskContainerStyles}>
          {proMaskComponent ? proMaskComponent : <AccessAuthenticationBottomText />}
        </Card>
      ) : null}
      <div style={{ position: "relative", height: "100%", overflow: "hidden" }}>
        {tableContainer.loading ? (
          <div className={classes.loadingContainer}>
            <CircularProgress color="primary" className={classes.loading} disableShrink size={30} />
          </div>
        ) : null}
        <Table
          {...leftProps}
          className={classes.table}
          cellComponent={cellComponent}
          columnsSortableExtension={columnsSortableExtension}
          {...commonTableColumnProps}
          noData={noData}
        />
      </div>
    </div>
  );
});

export default CommonTable;
