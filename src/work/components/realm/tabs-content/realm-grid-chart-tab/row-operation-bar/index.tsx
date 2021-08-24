import { Button, ButtonBase, CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import clsx from "clsx";
import { Download, Plus } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import {
  EntityInput,
  EntityItemInput,
  ExportRealmSheetDataByEntitiesQueryVariables,
  TrackerTheme,
  useTrackEntityMutation,
} from "../../../../../generated/graphql";
import { parseError } from "../../../../../utils/error";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import ExportDialog, { ExportType } from "../../../../common/dialog/exporter-dialog/export-dialog";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import AdvancedSearchContainer from "../../../container";

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
    text: {
      fontSize: 14,
      fontWeight: 500,
    },
  }),
);

interface RowOperationsBarProps {
  sheetId: string;
}

const RowOperationsBar: React.FunctionComponent<RowOperationsBarProps> = ({ sheetId }) => {
  const classes = useStyles();
  const muse = useClient();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const { rowSelections, setRowSelections, columns } = CommonGridContainer.useContainer();

  const { realm } = AdvancedSearchContainer.useContainer();
  const [fetching, setFetching] = useState(false);
  const [open, setOpen] = useState(false);
  const [variables, setVariables] = useState<ExportRealmSheetDataByEntitiesQueryVariables>();
  const [showTrackButton, setShowTrackButton] = useState(false);
  const [trackTheme, setTrackTheme] = useState<TrackerTheme>(TrackerTheme.TrackerThemeEnterprise);

  const [, executeTrackEntityMutation] = useTrackEntityMutation();

  useEffect(() => {
    switch (realm) {
      case "pevc.enterprise":
        setTrackTheme(TrackerTheme.TrackerThemeEnterprise);
        setShowTrackButton(true);
        break;
      case "pevc.institution":
        setTrackTheme(TrackerTheme.TrackerThemeInstitution);
        setShowTrackButton(true);
        break;
      case "pevc.vertical_builder":
        setTrackTheme(TrackerTheme.TrackerThemeVertical);
        setShowTrackButton(true);
        break;
      default:
        setTrackTheme(TrackerTheme.TrackerThemeUnspecified);
        setShowTrackButton(false);
        break;
    }
  }, [realm]);

  async function addTrackHandler(): Promise<void> {
    const entities: EntityItemInput[] = [];
    rowSelections.forEach((row) => {
      entities.push(JSON.parse(row));
    });

    setFetching(true);
    muse.sendTrackingEvent("tracker.track_entities", {
      "tracker_theme": trackTheme,
      "tracker_entities": entities,
    });
    const res = await executeTrackEntityMutation({ trackerTheme: trackTheme, entities: entities });
    setFetching(false);
    if (res.error) {
      if (parseError(res.error).code === "201009") return openSnackbar("追踪失败，超过追踪上限，请重新选择", "error");

      return openSnackbar("追踪失败", "error");
    }
    if (res.data) {
      setRowSelections([]);
      return openSnackbar("追踪成功", "success");
    }
  }

  const downloadHandle = () => {
    const entities: EntityInput[] = [];
    rowSelections.forEach((row) => {
      entities.push(JSON.parse(row));
    });
    setVariables({
      realmID: realm,
      sheetID: sheetId,
      columnIDs: columns.map((item) => item.name).filter((v) => v !== "column_serial"),
      entities: entities,
    });
    setOpen(true);
  };

  return (
    <div className={clsx(classes.root, rowSelections.length === 0 && classes.hidden)}>
      <Typography className={classes.text} style={{ paddingRight: 12 }}>
        已选中 {rowSelections.length} 项
      </Typography>
      {showTrackButton && (
        <ButtonBase className={classes.button} onClick={addTrackHandler}>
          {fetching ? (
            <CircularProgress color="inherit" thickness={2.8} size={18} />
          ) : (
            <Plus style={{ fontSize: 18 }} />
          )}
          <Typography className={classes.text}>追踪</Typography>
        </ButtonBase>
      )}
      <ButtonBase className={classes.button} onClick={downloadHandle}>
        <Download style={{ fontSize: 14, marginRight: 2 }} />
        <Typography className={classes.text}>导出</Typography>
      </ButtonBase>
      <Button
        className={classes.button}
        onClick={() => {
          setRowSelections([]);
        }}
      >
        <Typography className={classes.text}>取消选择</Typography>
      </Button>
      <ExportDialog
        open={open}
        close={(): void => {
          setOpen(false);
        }}
        exportRealmSheetByEntitiesVariables={variables}
        dialogTitle={"我的导出"}
        exportType={ExportType.RealmSheetByEntities}
      />
    </div>
  );
};

export default RowOperationsBar;
