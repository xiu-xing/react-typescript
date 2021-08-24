import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import React, { useCallback, useEffect, useState } from "react";
import { OrderColumn, Permission } from "../../../../generated/graphql";
import { checkPermissions } from "../../../../utils/permission";
import Grid from "../../grid/core/grid";
import { GridColumn, GridRow } from "../../grid/core/types";
import GridCellRenderingPlugin from "../../grid/plugins/cell-rendering/rich-text";
import PercentageWidthColumnResizingPlugin from "../../grid/plugins/column-resizing/percentage-width";
import PermissionComponent from "../../permission-component";
import CommonGridContainer from "./container";
import { CommonGridConfig } from "./types";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      height: "100%",
      overflow: "hidden",
    },
    grid: {
      height: "100%",
    },
  }),
);
export type LoadingType = "loading" | "nodata" | "data";

interface CommonGridProps {
  gridConfig: CommonGridConfig;
  cellRenderingPlugin?: GridCellRenderingPlugin;
  columnResizingPlugin?: PercentageWidthColumnResizingPlugin;
  relatedColumnIDs?: string[];
  gridRows: GridRow[];
  permissions?: Permission[];
  loadingType?: LoadingType;
  selectable?: boolean;
  highlightable?: boolean;
  onHighlightChange?: (roe: GridRow) => void;
  disableFix?: boolean;
}

const CommonGrid: React.FunctionComponent<CommonGridProps> = (props) => {
  const classes = useStyles();

  const {
    gridConfig,
    cellRenderingPlugin,
    columnResizingPlugin,
    relatedColumnIDs = [],
    gridRows,
    permissions,
    loadingType,
    selectable = true,
    highlightable,
    onHighlightChange,
    disableFix,
  } = props;

  const {
    columns,
    setTotalCount,
    rowSelections,
    setRowSelections,
    setInsights,
    setSortColumns,
    setColumns,
    setColumnIDs,
    highlightRow,
  } = CommonGridContainer.useContainer();

  const [fixedColumns, setFixedColumns] = useState<string[]>([]);
  const [columnOrders, setColumnOrders] = useState<string[]>([]);
  const [showLoading, setShowLoading] = useState(true);
  const [showPlaceholder, setShowPlaceholder] = useState(false);

  function updateGridColumns(columns?: GridColumn[], columnOrders?: string[], fixedColumns?: string[]) {
    columns && setColumns(columns);
    // columnIDs是无序的 columnOrders为Grid渲染columns的有序序列ID
    if (columnOrders) {
      setColumnOrders((prev) => {
        if (_.isEqual(prev, columnOrders)) return prev;
        return columnOrders;
      });
      setColumnIDs((prev) => {
        if (_.difference(prev, columnOrders).length === 0 && _.difference(columnOrders, prev).length === 0) return prev;
        return columnOrders;
      });
    }
    fixedColumns && setFixedColumns(fixedColumns);
  }

  function onColumnFixedChange(columnId: string) {
    setFixedColumns((fixedPrev) => {
      const newFixedColumns = [...fixedPrev, columnId];
      setColumnOrders((ordersPrev) => {
        return [...newFixedColumns, ..._.difference(ordersPrev, newFixedColumns)];
      });
      return newFixedColumns;
    });
  }

  function onColumnUnfixedChange(columnId: string) {
    setFixedColumns((prevFixedColumns) => {
      const newFixedColumns = prevFixedColumns.filter((id) => id !== columnId);
      setColumnOrders((prevColumnOrders) => {
        return [...newFixedColumns, ..._.difference(prevColumnOrders, prevFixedColumns), columnId];
      });
      return newFixedColumns;
    });
  }

  function initializeData() {
    const data = gridConfig;
    const columnOrderList = Array.from(data.defaultFixedColumns);
    const gridColumns: GridColumn[] = [];

    for (const i in data.columns) {
      if (disableFix) data.columns[i].fixable = false;
      data.columns[i].setColumns = setColumns;
      data.columns[i].showChartHandler = setInsights;
      data.columns[i].onSortChange = (sortColumns: OrderColumn[]) => setSortColumns(sortColumns);
      data.columns[i].onColumnFixed = (columnId) => onColumnFixedChange(columnId);
      data.columns[i].onColumnUnfixed = (columnId) => onColumnUnfixedChange(columnId);
    }

    data.defaultFixedColumns.forEach((id) => (data.columns[id].isFixed = true));

    data.defaultColumns.forEach((id) => {
      !columnOrderList.includes(id) && columnOrderList.push(id);
      gridColumns.push(data.columns[id]);
    });

    // 从搜索模板进入时，会有关联列
    if (relatedColumnIDs.length > 0) {
      const list = _.difference(relatedColumnIDs, data.defaultColumns);

      list.forEach((id) => {
        columnOrderList.push(id);
        data.columns[id] && gridColumns.push(data.columns[id]);
      });
    }

    updateGridColumns(gridColumns, columnOrderList, data.defaultFixedColumns);
  }

  useEffect(() => {
    switch (loadingType) {
      case "loading":
        setShowLoading(true);
        setShowPlaceholder(false);
        break;
      case "nodata":
        setShowLoading(false);
        setShowPlaceholder(true);
        setTotalCount(0);
        break;
      default:
        setShowLoading(false);
        setShowPlaceholder(false);
    }
  }, [loadingType]);

  function updateNewColumnOrders() {
    // 编辑列之后更新 ColumnOrders 和 fixedColumns
    const newColumnOrders = Array.from(columnOrders);
    const newColumnIDs = columns.map((item) => item.name);

    newColumnOrders.push(..._.difference(newColumnIDs, columnOrders));

    const deleteIDs = _.difference(newColumnOrders, newColumnIDs);
    deleteIDs.forEach((id) => {
      newColumnOrders.splice(newColumnOrders.indexOf(id), 1);
    });

    if (JSON.stringify(columnOrders) === JSON.stringify(newColumnOrders)) return;

    const newFixedColumns = fixedColumns.filter((fixedColumnId) => newColumnIDs.includes(fixedColumnId));
    updateGridColumns(undefined, newColumnOrders, newFixedColumns);
  }

  useEffect(() => {
    initializeData();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [gridConfig, setInsights]);

  useEffect(() => {
    if (columns.length > 0) {
      updateNewColumnOrders();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [columns]);

  useEffect(() => {
    if (relatedColumnIDs.length === 0) return;
    const orderIDs = Array.from(columnOrders.length > 0 ? columnOrders : gridConfig.defaultColumns);
    const addIDs = _.difference(relatedColumnIDs, orderIDs);
    const newColumnOrders = orderIDs.concat(addIDs);

    const newColumns: GridColumn[] = Array.from(columns);

    addIDs.forEach((id) => {
      gridConfig.columns[id] && newColumns.push(gridConfig.columns[id]);
    });
    updateGridColumns(newColumns, newColumnOrders);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [relatedColumnIDs]);

  const onColumnOrdersChangedHandle = useCallback((columns) => {
    setColumnOrders(columns);
  }, []);

  const onSelectionChangedHandle = useCallback(
    (selections) => {
      setRowSelections(selections);
    },
    [setRowSelections],
  );

  return (
    <div className={classes.root}>
      <Grid
        className={classes.grid}
        showLoading={showLoading}
        showPlaceholder={showPlaceholder}
        // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
        maskComponent={
          permissions && checkPermissions(permissions) && <PermissionComponent permissions={permissions} />
        }
        headerFixable
        selectable={selectable}
        highlightable={highlightable}
        disableAnimation
        rows={gridRows}
        columns={columns}
        columnOrders={columnOrders}
        fixedColumns={fixedColumns}
        selections={rowSelections}
        highlightRow={highlightRow}
        onColumnOrdersChanged={onColumnOrdersChangedHandle}
        onSelectionsChanged={onSelectionChangedHandle}
        onHighlight={onHighlightChange}
        columnResizingPlugin={columnResizingPlugin}
        cellRenderingPlugin={cellRenderingPlugin}
      />
    </div>
  );
};

export default CommonGrid;
