import { ExportType } from "../../generated/graphql";

export const exportTypes = [ExportType.Database, ExportType.DetailsPage];

export const exportTypeText = {
  [ExportType.Database]: "数据表格",
  [ExportType.DetailsPage]: "实体详情",
};

export const tableColumns = {
  [ExportType.Database]: [
    { name: "名称", flex: 5, align: "left", recordKey: "name" },
    { name: "条目数量", flex: 2, align: "left", recordKey: "rowNum" },
    { name: "导出时间", flex: 3, align: "right", recordKey: "createdTime" },
    { name: "状态", flex: 3, align: "left", recordKey: "status" },
    { name: "操作", align: "center", recordKey: "url", width: 60 },
  ],
  // todo
  [ExportType.DetailsPage]: [
    { name: "名称", flex: 2, align: "left", recordKey: "name" },
    { name: "导出时间", flex: 1, align: "right", recordKey: "createdTime" },
    { name: "状态", flex: 1, align: "left", recordKey: "status" },
    { name: "操作", align: "center", recordKey: "url", width: 60 },
  ],
};
