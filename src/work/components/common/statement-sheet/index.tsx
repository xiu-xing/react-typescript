import { CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect, useMemo, useState } from "react";
import {
  EntityType,
  FilterInputs,
  NextPlatform,
  StatementSheet as StatementSheetModel,
  StatementSheetColumn,
  StatementSheetDataConfig,
  StatementSheetHeaderConfig,
  useStatementSheetQuery,
} from "../../../generated/graphql";
import { GridColumn, GridRow } from "../grid/core/types";
import TreeDataGrid from "./grid";
import { StatementSheetRowData } from "./types";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "relative",
    },
    noData: {
      width: "100%",
      minHeight: 100,
      fontSize: 16,
      color: "#666",
      display: "grid",
      placeItems: "center",
    },
    loading: {
      width: "100%",
      minHeight: 100,
      display: "grid",
      placeItems: "center",
      position: "absolute",
      top: 48,
      zIndex: 100,
    },
  }),
);

interface SheetProps {
  id: string;
  filter?: FilterInputs;
  entityId?: string;
  entityType?: EntityType;
}

const StatementSheet: React.FunctionComponent<SheetProps> = (props) => {
  const classes = useStyles();
  const { id, filter, entityId, entityType } = props;
  const [headerConfig, setHeaderConfig] = useState<Map<string, StatementSheetHeaderConfig>>(new Map());
  const [dataConfig, setDataConfig] = useState<Map<string, StatementSheetDataConfig>>(new Map());
  const [defaultExpandedRows, setDefaultExpandedRows] = useState<string[]>([]);
  const [columns, setColumns] = useState<GridColumn[]>();
  const [rowData, setRowData] = useState<GridRow[]>();
  const [fetching, setFetching] = useState(true);

  const [statementSheetQueryResult, executeQuery] = useStatementSheetQuery({
    variables: {
      entityID: entityId ?? "",
      entityType: entityType ?? EntityType.Organization,
      statementSheetID: id,
      filters: filter,
      platform: NextPlatform.PlatformWeb,
    },
    pause: true,
  });

  function marshalRowData(row: StatementSheetRowData[], column?: StatementSheetColumn[] | null): void {
    if (!column) {
      setRowData([]);
      setColumns([]);
      return;
    }
    const data: Array<GridRow> = [];
    const columns: Array<GridColumn> = [];
    row.forEach((v) => {
      const record = {
        id: v.id,
      };
      record["parentId"] = v.parentId;
      v.data.forEach((v, i) => {
        if (i < column.length) record[column[i].id] = v;
      });
      data.push(record);
    });
    column.forEach((v, i) => {
      columns.push({ name: v.id, title: v.name, minWidth: i === 0 ? 400 : 180, isFixed: i === 0 });
    });
    setRowData(data);
    setColumns(columns);
  }

  function marshalRowConfig(statementSheet: StatementSheetModel): void {
    const header: Map<string, StatementSheetHeaderConfig> = new Map();
    const data: Map<string, StatementSheetDataConfig> = new Map();
    const rows: string[] = [];
    if (!statementSheet || !statementSheet.rowConfigs) return;
    statementSheet.rowConfigs.forEach((v) => {
      header.set(v.rowID, v.headerConfig);
      if (!v.headerConfig.foldable || v.headerConfig.isExpanded) {
        rows.push(v.rowID);
      }
      if (v.dataConfig) {
        data.set(v.rowID, v.dataConfig);
      }
    });
    setHeaderConfig(header);
    setDataConfig(data);
    setDefaultExpandedRows(rows);
  }

  useEffect(() => {
    executeQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id, filter, entityId]);

  useEffect(() => {
    setFetching(statementSheetQueryResult.fetching);
    if (statementSheetQueryResult.fetching) return;
    if (
      !statementSheetQueryResult ||
      !statementSheetQueryResult.data ||
      !statementSheetQueryResult.data.statementSheet ||
      statementSheetQueryResult.error
    ) {
      setRowData([]);
      return;
    }

    const statementSheet = statementSheetQueryResult.data.statementSheet;
    const rowData = statementSheet.rowsData;
    const columns = statementSheet.columns;
    const jsonRow = JSON.parse(rowData);
    const rowArray: StatementSheetRowData[] = [];
    jsonRow.forEach((v: unknown) => {
      rowArray.push(StatementSheetRowData.fromJSON(v));
    });
    marshalRowData(rowArray, columns);
    marshalRowConfig(statementSheet);
  }, [statementSheetQueryResult]);

  const treeDataGridComponent = useMemo(() => {
    if (rowData && rowData.length > 0 && columns && columns.length > 0) {
      return (
        <TreeDataGrid
          headerConfig={headerConfig}
          dataConfig={dataConfig}
          defaultExpandedRows={defaultExpandedRows}
          data={rowData}
          columns={columns}
        />
      );
    }
    return <div className={classes.noData}>暂无数据</div>;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [rowData, columns, headerConfig, dataConfig, defaultExpandedRows]);

  return (
    <div className={classes.root}>
      {fetching ? (
        <div className={classes.loading}>
          <CircularProgress size={32} />
        </div>
      ) : null}
      {treeDataGridComponent}
    </div>
  );
};

export default StatementSheet;
