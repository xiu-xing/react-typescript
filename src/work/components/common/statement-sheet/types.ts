import _ from "lodash";

export class StatementSheetRowData {
  id = "";
  parentId: string | null = null;
  data: Array<string | null> = [];

  static fromJSON(json: unknown): StatementSheetRowData {
    const newRow: StatementSheetRowData = new StatementSheetRowData();

    const id = _.get(json, "id");
    id && (newRow.id = id);

    const parentId = _.get(json, "parent_id");
    parentId && (newRow.parentId = parentId);

    const data = _.get(json, "data");
    if (data) {
      newRow.data = data;
    }

    return newRow;
  }
}
