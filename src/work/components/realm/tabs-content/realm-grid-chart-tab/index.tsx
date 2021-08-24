import { useMediaQuery } from "@material-ui/core";
import { createStyles, makeStyles, useTheme } from "@material-ui/core/styles";
import { useTabContext } from "@material-ui/lab";
import clsx from "clsx";
import React, { useEffect, useState } from "react";
import ConfigContainer from "../../../../containers/configContainer";
import { ExportRealmSheetDataQueryVariables, SheetTab } from "../../../../generated/graphql";
import CommonGridContainer from "../../../common/common-grid-components/grid/container";
import { CommonGridConfig } from "../../../common/common-grid-components/grid/types";
import ExportDialog, { ExportType } from "../../../common/dialog/exporter-dialog/export-dialog";
import AdvancedSearchContainer from "../../container";
import { REALMTITLE } from "../../types";
import ColumnsEditor from "./columns-editor";
import RealmDataGrid from "./data-grid";
import GridPaginationBar from "./pagination-bar";
import Prefix from "./pagination-bar/prefix";
import Suffix from "./pagination-bar/suffix";
import Panel from "./panel";
import RowOperationsBar from "./row-operation-bar";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      margin: "0 16px",
    },
    sheetChart: {
      display: "flex",
      height: "100%",
    },
    SMScreenStyle: {
      height: "100%",
      "& .TabContent": {
        display: "none !important",
      },
    },
    contentBox: {
      width: "100%",
      height: "100%",
      overflowY: "hidden",
    },
    sheetDefault: {
      height: "100%",
      display: "flex",
    },
    TabContent: {
      flex: 1,
      overflowX: "auto",
      height: "100%",
      display: "grid",
      borderRight: "1px solid rgb(224, 224, 224)",
      gridTemplateRows: "auto auto 1fr",
    },
  }),
);

interface RealmGridChartTabProps {
  tab: SheetTab;
}

const EXPORT_LIMIT = 5000;

const RealmGridChartTab: React.FunctionComponent<RealmGridChartTabProps> = (props) => {
  const classes = useStyles();
  const { tab } = props;
  const theme = useTheme();
  const { realm } = AdvancedSearchContainer.useContainer();
  const { realmSheetConfigs } = ConfigContainer.useContainer();
  const { conditions } = AdvancedSearchContainer.useContainer();

  const { insights, columns, sortColumns, setPage, setUseQueryEndCursor, setRowSelections } =
    CommonGridContainer.useContainer();

  const downSM = useMediaQuery(theme.breakpoints.down("sm"));
  const [gridConfig, setGridConfig] = useState<CommonGridConfig>();
  const [useSMStyle, setUseSMStyle] = useState(false);
  const [exportDialogOpen, setExportDialogOpen] = useState(false);
  const [variables, setVariables] = useState<ExportRealmSheetDataQueryVariables>();

  const tabContext = useTabContext();

  const onClickExport = () => {
    setVariables({
      realmID: realm,
      sheetID: tab.sheetID,
      columnIDs: columns.map((item) => item.name).filter((v) => v !== "column_serial"),
      conditions: conditions,
      orderColumns: sortColumns,
      first: EXPORT_LIMIT,
      realmName: REALMTITLE[realm],
    });
    setExportDialogOpen(true);
  };

  useEffect(() => {
    if (tab.id === tabContext?.value) {
      window.resizeTo(window.innerWidth, window.innerHeight);
    }
  }, [tab.id, tabContext]);

  useEffect(() => {
    if (realmSheetConfigs) {
      const id = tab.sheetID;
      const config = realmSheetConfigs[id];
      const data = CommonGridConfig.fromJSON(config);

      data && setGridConfig(data);
    }
  }, [realmSheetConfigs, tab.sheetID]);

  useEffect(() => {
    setPage(1);
    setUseQueryEndCursor(null);
    setRowSelections([]);
  }, [conditions, setPage, setRowSelections, setUseQueryEndCursor]);

  useEffect(() => {
    const hasRightComponent = insights.length > 0;

    setUseSMStyle(downSM && hasRightComponent);
  }, [insights, downSM]);

  return (
    <>
      <div className={clsx(classes.sheetDefault, useSMStyle && classes.SMScreenStyle)}>
        {gridConfig && (
          <div className={clsx(classes.TabContent, "TabContent")}>
            <GridPaginationBar
              suffix={<Suffix onClickExport={onClickExport} />}
              prefix={<Prefix gridConfig={gridConfig} />}
            />
            <RowOperationsBar sheetId={tab.sheetID} />
            <RealmDataGrid sheetId={tab.sheetID} gridConfig={gridConfig} />
          </div>
        )}
        {insights.length > 0 && <Panel />}
      </div>
      {gridConfig && <ColumnsEditor gridConfig={gridConfig} />}
      <ExportDialog
        open={exportDialogOpen}
        close={(): void => {
          setExportDialogOpen(false);
        }}
        exportRealmSheetVariables={variables}
        dialogTitle={"我的导出"}
        exportType={ExportType.RealmSheet}
      />
    </>
  );
};

export default RealmGridChartTab;
