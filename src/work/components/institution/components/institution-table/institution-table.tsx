import React, { HTMLProps } from "react";
import PageInfoContainer from "../../../common/table/pageInfoContainer";
import TableCacheContainer from "../../../common/table/tableCacheContainer";
import TableContainer from "../../../common/table/tableContainer";
import InstitutionContainer from "../../institutionContainer";
import InstitutionTableDisplay from "./institution-table-display";
import InstitutionTableContainer from "./institutionTableContainer";

interface InstitutionTableProps extends HTMLProps<HTMLDivElement> {
  id: string;
  code: string;
  active: boolean;
}

const InstitutionTable: React.FunctionComponent<InstitutionTableProps> = (props) => {
  const { id, code, active: activeState, ...restProps } = props;
  const { groupTotalMap, setInstitutionChildrenType } = InstitutionContainer.useContainer();

  if (!activeState) {
    return null;
  }

  return (
    <div
      style={{
        flexGrow: 1,
        overflow: "hidden",
        height: "100%",
      }}
    >
      <TableContainer.Provider
        initialState={{
          selectMaxRowNum: groupTotalMap[setInstitutionChildrenType.toString()] ?? 1000000,
          // rowCount: setGroupTotalMap[setInstitutionChildrenType.toString()] ?? 1000000,
          id: id,
          rows: [],
          pageSize: 50,
          serial: "asc",
          accessCheck: true,
        }}
      >
        <PageInfoContainer.Provider initialState={{ queryPageSize: 200 }}>
          <TableCacheContainer.Provider>
            <InstitutionTableContainer.Provider initialState={{ code: code }}>
              <InstitutionTableDisplay />
            </InstitutionTableContainer.Provider>
          </TableCacheContainer.Provider>
        </PageInfoContainer.Provider>
      </TableContainer.Provider>
    </div>
  );
};

export default InstitutionTable;
