import React, { forwardRef, useMemo } from "react";
import { FilterInputs } from "../../../generated/graphql";
import { useProfileEntity } from "../../profile/atoms";
import PageInfoContainer from "../table-next/pageInfoContainer";
import TableCacheContainer from "../table-next/tableCacheContainer";
import CommonTableContainer from "../table-next/tableContainer";
import DataTableDisplay, { DataTableDisplayProps } from "./data-table-display";
import DataTableContainer from "./dataTableContainer";

export interface DataTableNextProps extends Omit<DataTableDisplayProps, "entityId"> {
  id: string;
  filter?: FilterInputs;
}

const DataTableNext = forwardRef<HTMLDivElement, DataTableNextProps>(function DataTable(props, ref) {
  const { id, filter, ...leftProps } = props;
  const [profileEntity] = useProfileEntity();

  return useMemo(
    () => {
      return (
        <CommonTableContainer.Provider initialState={{ id, pageSize: 10 }}>
          <PageInfoContainer.Provider initialState={{ queryPageSize: 10 }}>
            <TableCacheContainer.Provider>
              <DataTableContainer.Provider
                initialState={{
                  id: id,
                  entityId: profileEntity.id,
                  entityType: profileEntity.type,
                  entityName: profileEntity.name,
                  filter: filter,
                }}
              >
                <DataTableDisplay
                  {...leftProps}
                  tableBottom={{
                    ...leftProps.tableBottom,
                    pagination: true,
                    download: true,
                  }}
                  ref={ref}
                />
              </DataTableContainer.Provider>
            </TableCacheContainer.Provider>
          </PageInfoContainer.Provider>
        </CommonTableContainer.Provider>
      );
    },
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [profileEntity.id, profileEntity.type, id, filter],
  );
});

export default DataTableNext;
