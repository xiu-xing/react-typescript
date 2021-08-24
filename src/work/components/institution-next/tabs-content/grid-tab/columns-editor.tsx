import React from "react";
import CommonGridColumnsEditor from "../../../common/common-grid-components/columns-editor";
import CommonGridContainer from "../../../common/common-grid-components/grid/container";
import { CommonGridConfig } from "../../../common/common-grid-components/grid/types";
import InstitutionGridTabContainer from "./container";

interface ColumnsEditorProps {
  gridConfig: CommonGridConfig;
}

const ColumnsEditor: React.FunctionComponent<ColumnsEditorProps> = (props) => {
  const { gridConfig } = props;
  const { columnsEditorOpen, setColumnsEditorOpen } = InstitutionGridTabContainer.useContainer();
  const { columns, setColumns, sortColumns, setSortColumns } = CommonGridContainer.useContainer();

  return (
    <CommonGridColumnsEditor
      gridConfig={gridConfig}
      columns={columns}
      setColumns={setColumns}
      paginationEditorOpen={columnsEditorOpen}
      setPaginationEditorOpen={setColumnsEditorOpen}
      sortColumns={sortColumns}
      setSortColumns={setSortColumns}
    />
  );
};

export default ColumnsEditor;
