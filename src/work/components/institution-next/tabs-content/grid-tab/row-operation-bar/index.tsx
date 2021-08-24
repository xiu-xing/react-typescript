import { Button, ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { Download, TrashCanOutline } from "mdi-material-ui";
import React, { useState } from "react";
import {
  EntityInput,
  ExportTrealmSheetDataByEntitiesQueryVariables,
  useTrealmDeleteEntitiesMutation,
} from "../../../../../generated/graphql";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import ExportDialog, { ExportType } from "../../../../common/dialog/exporter-dialog/export-dialog";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import CommonDialog from "../../../common-dialog";
import InstitutionGridTabContainer from "../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: 48,
      backgroundColor: "#F5F6F9",
      padding: "0 16px",
      display: "flex",
      alignItems: "center",
      flexDirection: "row",
      transition: "height 300ms cubic-bezier(0.4, 0, 0.2, 1) 0ms",
      color: "#333",
    },
    hidden: {
      height: 0,
      overflow: "hidden",
    },
    button: {
      display: "flex",
      alignItems: "center",
      padding: "0 12px",
      flexDirection: "row",
      justifyContent: "center",
      height: "100%",
      color: "#333",
    },
    buttonIcon: {
      fontSize: 16,
      color: "#666",
      marginRight: 4,
    },
    text: {
      fontSize: 14,
      fontWeight: 500,
    },
    dialogContent: {
      padding: 32,
    },
  }),
);

interface RowOperationsBarProps {
  sheetId: string;
}

const RowOperationsBar: React.FunctionComponent<RowOperationsBarProps> = ({ sheetId }) => {
  const classes = useStyles();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const { importType } = InstitutionGridTabContainer.useContainer();

  const { rowSelections, setRowSelections, columns, setUpdateGridRow } = CommonGridContainer.useContainer();
  const [exportDialog, setExportDialog] = useState(false);
  const [variables, setVariables] = useState<ExportTrealmSheetDataByEntitiesQueryVariables>();
  const [showConfirmDialog, setShowConfirmDialog] = useState(false);

  const [, executeTrealmDeleteEntities] = useTrealmDeleteEntitiesMutation();

  const onClickExport = () => {
    const entities: EntityInput[] = [];
    rowSelections.forEach((row) => {
      entities.push(JSON.parse(row));
    });
    setVariables({
      sheetID: sheetId,
      columnIDs: columns.map((column) => column.name).filter((ColumnName) => ColumnName !== "column_serial"),
      entities: entities,
    });
    setExportDialog(true);
  };

  async function remove(): Promise<void> {
    if (!importType) return;
    const entityIDs = rowSelections.map((select) => (JSON.parse(select) as EntityInput).entityId);
    const res = await executeTrealmDeleteEntities({
      input: {
        entityIDs: entityIDs,
        importType: importType,
      },
    });

    setShowConfirmDialog(false);
    if (res.error) return openSnackbar("删除失败", "error");

    setRowSelections([]);
    setUpdateGridRow((prev) => !prev);
    openSnackbar("删除成功", "success");
  }

  return (
    <div className={clsx(classes.root, rowSelections.length === 0 && classes.hidden)}>
      <Typography className={classes.text} style={{ paddingRight: 12 }}>
        已选中 {rowSelections.length} 项
      </Typography>
      <ButtonBase className={classes.button} onClick={onClickExport}>
        <Download style={{ fontSize: 14, marginRight: 2 }} />
        <Typography className={classes.text}>导出</Typography>
      </ButtonBase>
      {importType !== undefined && (
        <ButtonBase className={classes.button} onClick={() => setShowConfirmDialog(true)}>
          <TrashCanOutline className={classes.buttonIcon} />
          <Typography className={classes.text}>删除</Typography>
        </ButtonBase>
      )}
      <Button
        className={classes.button}
        onClick={() => {
          setRowSelections([]);
        }}
      >
        <Typography className={classes.text}>取消选择</Typography>
      </Button>

      <CommonDialog
        title="机构全貌"
        open={showConfirmDialog}
        minHeight={200}
        closeDialog={() => setShowConfirmDialog(false)}
        content={<Typography className={classes.dialogContent}>确认删除？</Typography>}
        showConfirmButton
        showCancelButton
        onConfirmButtonClick={remove}
        onCancelButtonClick={() => setShowConfirmDialog(false)}
      />

      <ExportDialog
        open={exportDialog}
        close={(): void => {
          setExportDialog(false);
        }}
        exportTrealmSheetByEntitiesVariables={variables}
        dialogTitle={"我的导出"}
        exportType={ExportType.TrealmSheetByEntities}
      />
    </div>
  );
};

export default RowOperationsBar;
