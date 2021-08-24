import _ from "lodash";
import { OrderColumn } from "../../../../generated/graphql";
import { GridColumn } from "../../grid/core/types";

interface Insight {
  type: string;
  id: string;
  title: string;
}

export class CommonGridColumnEditLayout {
  groupId = "";
  groupName = "";
  columnIds: Array<string> = [];

  static fromJSON(json: unknown): CommonGridColumnEditLayout {
    const newInstance = new CommonGridColumnEditLayout();
    const groupId = _.get(json, "group_id");
    groupId && (newInstance.groupId = groupId);
    const groupName = _.get(json, "group_name");
    groupName && (newInstance.groupName = groupName);
    newInstance.columnIds = _.get(json, "column_ids");

    return newInstance;
  }
}

export enum CommonGridColumnAlign {
  Left = "left",
  Right = "right",
  Middle = "middle",
}

export enum CommonGridFixedPositionType {
  Left = "left",
  Right = "right",
  None = "",
}

enum CommonGridInsightType {
  DataBlock = "data_block",
  Chart = "chart",
  InfoFlow = "info_flow",
}

export type SortType = "none" | "ascending" | "descending";

export class CommonGridInsight {
  id = "";
  title = "";
  type: CommonGridInsightType = CommonGridInsightType.InfoFlow;

  static fromJSON(json: unknown): CommonGridInsight {
    const newInstance: CommonGridInsight = new CommonGridInsight();

    const id = _.get(json, "id");
    id && (newInstance.id = id);

    const title = _.get(json, "title");
    title && (newInstance.title = title);

    const type = _.get(json, "type");
    type && (newInstance.type = type);

    return newInstance;
  }
}

export class CommonGridColumn implements GridColumn {
  name = "";
  // Column name
  title = "";
  // Sortable
  sortable = "";
  // Fixable
  fixable = true;
  isFixed = false;

  sortType?: SortType;

  // Locked column cannot removed
  isRequired = false;
  // Fixed position
  fixedPosition: CommonGridFixedPositionType = CommonGridFixedPositionType.None;
  // The minimum column width
  minWidth = 42;
  // The alignment of the column content
  align: CommonGridColumnAlign = CommonGridColumnAlign.Left;

  tips = "";
  // Chart insights
  insights: CommonGridInsight[] = [];
  showChart = false;

  setColumns?: React.Dispatch<React.SetStateAction<GridColumn[]>>;
  showChartHandler?: React.Dispatch<React.SetStateAction<Insight[]>>;
  onColumnFixed?: (columnId: string) => void;
  onColumnUnfixed?: (columnId: string) => void;
  onSortChange?: (sortColumns: OrderColumn[]) => void;

  static fromJSON(json: unknown): CommonGridColumn {
    const newInstance: CommonGridColumn = new CommonGridColumn();

    const name = _.get(json, "id");
    name && (newInstance.name = name);

    const title = _.get(json, "name");
    title && (newInstance.title = title);

    const sortable = _.get(json, "is_sortable");
    sortable && (newInstance.sortable = sortable);

    const isLocked = _.get(json, "is_required");
    isLocked && (newInstance.isRequired = isLocked);

    const minWidth = _.get(json, "min_width");
    minWidth && (newInstance.minWidth = minWidth);

    const align = _.get(json, "align");
    align && (newInstance.align = align);

    const fixedPosition = _.get(json, "fixed_position");
    fixedPosition && (newInstance.fixedPosition = fixedPosition);

    return newInstance;
  }
}

export enum CommonGridRowType {
  Entity = "row_type_entity",
  UnknownType = "unknown_type",
}

export class CommonGridConfig {
  id = "";

  name = "";

  rowType: CommonGridRowType = CommonGridRowType.UnknownType;

  // 可编辑列配置
  columnEditLayout: CommonGridColumnEditLayout[] = [];

  // Left frozen columns
  leftFixedColumns: string[] = [];
  // Right frozen columns
  rightFixedColumns: string[] = [];

  // 默认列
  defaultColumns: Array<string> = [];

  // 所有的列，以 columnId 为 key，TableColumnNextModel 为 value
  columns: { [key: string]: CommonGridColumn } = {};

  // 默认固定列
  defaultFixedColumns: string[] = [];

  showNewEntity = false;

  unitDescription = "";

  icon = "";

  timelineId? = "";

  static fromJSON(json: unknown): CommonGridConfig {
    const realmGridConfig = new CommonGridConfig();

    const id = _.get(json, "id");
    id && (realmGridConfig.id = id);

    const name = _.get(json, "name");
    name && (realmGridConfig.name = name);

    const rowType = _.get(json, "row_type");
    rowType && (realmGridConfig.rowType = rowType);

    const icon = _.get(json, "icon");
    icon && (realmGridConfig.icon = icon);

    const timelineId = _.get(json, "timeline_id");
    timelineId && (realmGridConfig.timelineId = timelineId);

    const columnEditLayout: string[] = _.get(json, "column_edit_layout");
    if (columnEditLayout) {
      const columnEditLayoutMap: CommonGridColumnEditLayout[] = [];
      let item: CommonGridColumnEditLayout = new CommonGridColumnEditLayout();
      Object.entries(columnEditLayout).forEach(([, childJSON]) => {
        item = CommonGridColumnEditLayout.fromJSON(childJSON);

        columnEditLayoutMap.push(item);
      });

      realmGridConfig.columnEditLayout = columnEditLayoutMap;
    }

    const defaultFixedColumns = _.get(json, "default_fixed_columns");
    defaultFixedColumns && (realmGridConfig.defaultFixedColumns = defaultFixedColumns);

    const defaultColumns: string[] = _.get(json, "default_columns");
    defaultColumns && (realmGridConfig.defaultColumns = defaultColumns);

    const unitDescription: string = _.get(json, "unit_description");
    unitDescription && (realmGridConfig.unitDescription = unitDescription);

    const columns: { [key: string]: CommonGridColumn } = _.get(json, "columns");

    if (columns) {
      const columnsMap: { [key: string]: CommonGridColumn } = {};
      Object.entries(columns).forEach(([childKey, childJSON]) => {
        if (typeof childKey === "string") {
          const sheetColumn = CommonGridColumn.fromJSON(childJSON);
          columnsMap[childKey] = sheetColumn;
          columnsMap[childKey].insights = childJSON.insights;

          if (columnsMap[childKey].fixable) columnsMap[childKey].isFixed = false;
          if (columnsMap[childKey].sortable) columnsMap[childKey].sortType = "none";

          if (sheetColumn.fixedPosition === CommonGridFixedPositionType.Left) {
            realmGridConfig.leftFixedColumns.push(sheetColumn.name);
            return;
          }
          if (sheetColumn.fixedPosition === CommonGridFixedPositionType.Right) {
            realmGridConfig.rightFixedColumns.push(sheetColumn.name);
          }

          if (realmGridConfig.defaultFixedColumns.includes(childKey)) columnsMap[childKey].fixable = false;
        }
      });
      realmGridConfig.columns = columnsMap;
    }

    return realmGridConfig;
  }
}
