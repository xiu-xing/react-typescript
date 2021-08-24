import { IconButton, MenuItem, Select, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import GetAppIcon from "@material-ui/icons/GetApp";
import clsx from "clsx";
import React, { ReactNode, useState } from "react";
import UserContainer from "../../../containers/userContainer";
import { EntityType, FilterInputs, Role } from "../../../generated/graphql";
import ExportDialog, { ExportType, TableDataExport } from "../dialog/exporter-dialog/export-dialog";
import PageInfoContainer from "../table-next/pageInfoContainer";
import TablePagination from "../table-next/table-pagination";
import CommonTableContainer from "../table-next/tableContainer";
import DataTableContainer from "./dataTableContainer";

export const DATA_TABLE_BOTTOM_HEIGHT = 40;

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      marginTop: 16,
      display: "flex",
      flexDirection: "row",
      columnGap: 24,
      alignItems: "center",
    },
    tip: {
      flex: 1,
      fontSize: 14,
    },
    download: {},
    pageSizeSelect: {
      "&:focus": {
        backgroundColor: "transparent",
      },
    },
  }),
);

export interface DataTableBottomProps {
  pagination?: boolean;
  download?: boolean;
  tip?: string;
  onDownloadClick?: () => void;
  sectionName?: string;
}

const DataTableBottom: React.FunctionComponent<DataTableBottomProps> = (props) => {
  const classes = useStyles();
  const commonTableContainer = CommonTableContainer.useContainer();
  const dataTableContainer = DataTableContainer.useContainer();
  const pageInfoContainer = PageInfoContainer.useContainer();
  const [exportDialogOpen, setExportDialogOpen] = useState(false);
  const { user, setActiveServiceDialogOpen } = UserContainer.useContainer();
  const [pageSize, setPageSize] = useState(10);

  const profileExport: TableDataExport = {
    first: dataTableContainer.result?.data?.table?.totalCount ?? 0,
    id: dataTableContainer.id,
    entityID: dataTableContainer.entityId,
    entityType: dataTableContainer.entityType as EntityType,
    filter: dataTableContainer.filter as FilterInputs,
    entityName: dataTableContainer.entityName,
    sectionName: props.sectionName ?? "",
  };

  const showDownloadIcon = dataTableContainer.result?.data?.table?.totalCount ?? 0 > 0 ? true : false;

  function onPageChangeHandler(page: number): void {
    dataTableContainer.onPageChange(page);
  }

  function contentComponent(): ReactNode {
    return (
      <div className={clsx(classes.root)}>
        {props.pagination && commonTableContainer.rowCount > commonTableContainer.pageSize ? (
          <TablePagination
            page={commonTableContainer.page}
            pageSize={commonTableContainer.pageSize}
            onChange={onPageChangeHandler}
          />
        ) : null}
        <Typography className={classes.tip}>{props.tip}</Typography>
        {(dataTableContainer.result?.data?.table?.totalCount ?? 0) > 0 && props.download && showDownloadIcon && (
          <IconButton
            size="small"
            className={classes.download}
            onClick={(): void => {
              if (user?.role == Role.Trial || user?.role == Role.Active) {
                setExportDialogOpen(true);
              } else {
                setActiveServiceDialogOpen(true);
              }
              props.onDownloadClick && props.onDownloadClick();
            }}
          >
            <GetAppIcon />
          </IconButton>
        )}
        <ExportDialog
          open={exportDialogOpen}
          close={(): void => {
            setExportDialogOpen(false);
          }}
          dialogTitle={"我的导出"}
          exportType={ExportType.Profile}
          profileTableDataExport={profileExport}
        />
        {(dataTableContainer.result?.data?.table?.totalCount ?? 0) > 10 && (
          <Select
            variant="outlined"
            style={{ height: 32 }}
            classes={{
              select: classes.pageSizeSelect,
            }}
            value={pageSize}
            // defaultValue={10}
            onChange={(event): void => {
              const newPageSize = event.target.value as number;
              setPageSize(newPageSize);
              pageInfoContainer.setQueryPageSize(newPageSize);
              commonTableContainer.setPageSize(newPageSize);
              commonTableContainer.reset();
            }}
          >
            <MenuItem value={10}>展示 10 条数据</MenuItem>
            <MenuItem value={20}>展示 20 条数据</MenuItem>
            <MenuItem value={50}>展示 50 条数据</MenuItem>
          </Select>
        )}
      </div>
    );
  }

  return <>{contentComponent()}</>;
};

export default DataTableBottom;
