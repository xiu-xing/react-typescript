import {
  Backdrop,
  Box,
  Button,
  CircularProgress,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  Typography
} from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { useClient as useMuseClient } from "@momentum-valley/muse-js";
import React, { ReactNode, useEffect, useState } from "react";
import { useClient } from "urql";
// import { CustomVerticalEventNames, EventTracking } from "../../../../event-tracking/eventTracking";
import {
  DownloadUrlDocument,
  DownloadUrlQuery,
  DownloadUrlQueryVariables,
  EntityType,
  ExportProfileTableDocument,
  ExportProfileTableQuery,
  ExportProfileTableQueryVariables,
  ExportRealmSheetDataByEntitiesDocument,
  ExportRealmSheetDataByEntitiesQuery,
  ExportRealmSheetDataByEntitiesQueryVariables,
  ExportRealmSheetDataDocument,
  ExportRealmSheetDataQuery,
  ExportRealmSheetDataQueryVariables,
  ExportStatementSheetDocument,
  ExportStatementSheetQuery,
  ExportStatementSheetQueryVariables,
  ExportTrealmSheetDataByEntitiesDocument,
  ExportTrealmSheetDataByEntitiesQuery,
  ExportTrealmSheetDataByEntitiesQueryVariables,
  ExportTrealmSheetDataDocument,
  ExportTrealmSheetDataQuery,
  ExportTrealmSheetDataQueryVariables,
  ExportType as GExportType,
  FilterInputs,
  useExportRemainingQuery,
  VbSearchConditionInput,
  VbSearchType
} from "../../../../generated/graphql";
import { getResourceUrl } from "../../../../utils/url";
import SnackbarContainer from "../../snackbar/snackbarContainer";

export enum ExportType {
  Profile,
  ProfileStatementSheet,
  RealmSheet,
  RealmSheetByEntities,
  TrealmSheet,
  TrealmSheetByEntities,
  Vertical,
  VerticalSelected,
}

export const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    paperRoot: {
      minWidth: 420,
      maxWidth: 420,
    },
    dialogTitleRoot: {
      minHeight: 60,
      padding: "16px 24px",
      fontSize: 16,
      display: "flex",
      flexDirection: "row",
      alignItems: "center",
    },
    dialogTitle: {
      background: theme.palette.primary.main,
      color: "#FFFFFF",
    },
    title: {
      fontSize: 16,
      fontWeight: 500,
      flexGrow: 1,
    },
    dialogContentRoot: {
      padding: "3px 24px 16px",
    },
    dialogContent: {
      color: "#737373",
      fontSize: 16,
      borderBottom: "1px rgba(0, 0, 0, 0.11) solid",
    },
    dialogContentTop: {
      marginTop: 24,
    },
    dialogContentBottom: {
      marginTop: 24,
      marginBottom: 25,
    },
    selectEntry: {
      color: "#333",
      fontSize: 18,
    },
    number: {
      fontSize: 14,
      color: "#666666",
      marginTop: 2,
      marginBottom: 2,
    },
    remaining: {
      marginTop: 2,
      marginBottom: 2,
    },
    textField: {
      width: "100%",
    },
    cancelButton: {
      color: "#666",
    },
    backdrop: {
      zIndex: theme.zIndex.drawer + 1,
      color: "#fff",
    },
  }),
);

export interface TableDataExport {
  first: number;
  last?: number;
  after?: string;
  before?: string;
  id: string;
  entityID: string;
  entityType?: EntityType;
  filter: FilterInputs;
  entityName: string;
  sectionName: string;
}

export interface VerticalExport {
  first: number;
  after?: string;
  last?: number;
  before?: string;
  condition: VbSearchConditionInput;
  searchType: VbSearchType;
}

export interface VerticalSelectedExport {
  first: number;
  entityIDs: string[];
  condition: VbSearchConditionInput;
  searchType: VbSearchType;
}

interface ExportDialogProps {
  open: boolean;
  close(): void;
  deletedAll?(): void;
  dialogTitle: string;
  profileTableDataExport?: TableDataExport;
  exportStatementSheetVariables?: ExportStatementSheetQueryVariables;
  exportRealmSheetVariables?: ExportRealmSheetDataQueryVariables;
  exportRealmSheetByEntitiesVariables?: ExportRealmSheetDataByEntitiesQueryVariables;
  exportTrealmSheetVariables?: ExportTrealmSheetDataQueryVariables;
  exportTrealmSheetByEntitiesVariables?: ExportTrealmSheetDataByEntitiesQueryVariables;
  verticalExport?: VerticalExport;
  verticalSelectedExport?: VerticalSelectedExport;
  exportType: ExportType;
}

export type VisaItem = {
  total?: number;
  remaining?: number;
};

type Timer = NodeJS.Timer | null;

const ExportDialog: React.FunctionComponent<ExportDialogProps> = (props) => {
  const classes = useStyles();
  const { openSnackbar } = SnackbarContainer.useContainer();
  const muse = useMuseClient();
  const {
    open,
    close,
    deletedAll,
    dialogTitle,
    exportType,
    profileTableDataExport,
    exportStatementSheetVariables,
    exportRealmSheetVariables,
    exportRealmSheetByEntitiesVariables,
    exportTrealmSheetVariables,
    exportTrealmSheetByEntitiesVariables,
    // verticalExport,
    // verticalSelectedExport,
  } = props;
  const [loading, setLoading] = useState(false);
  const [resultID, setResultID] = useState("");
  const [count, setCount] = useState(0);
  const [URL, setURL] = useState("");
  const [visaItem, setVisaItem] = useState<VisaItem>();
  const [selectEntry, setSelectEntry] = useState<number>(0);
  const [permitSign, setPermitSign] = useState<boolean>(false);
  let interval: Timer = null;
  const client = useClient();
  client.requestPolicy = "network-only";

  function findURLResultHandler(): void {
    setResultID("");
    setLoading(false);
    close();
    deletedAll?.();
    setCount(0);
  }

  useEffect(() => {
    if (props.exportRealmSheetVariables) {
      setSelectEntry(props.exportRealmSheetVariables.first ?? 0);
      return;
    }
    if (props.profileTableDataExport) {
      setSelectEntry(props.profileTableDataExport.first);
      return;
    }
    if (props.exportRealmSheetByEntitiesVariables) {
      setSelectEntry(props.exportRealmSheetByEntitiesVariables.entities.length);
      return;
    }
    if (props.verticalExport) {
      setSelectEntry(props.verticalExport.first);
      return;
    }
    if (props.verticalSelectedExport) {
      setSelectEntry(props.verticalSelectedExport.first ?? 0);
      return;
    }
    if (props.exportTrealmSheetByEntitiesVariables) {
      setSelectEntry(props.exportTrealmSheetByEntitiesVariables.entities.length);
      return;
    }
  }, [props]);

  useEffect(() => {
    if ((visaItem?.remaining as number) > 0) {
      setPermitSign(true);
      return;
    }

    setPermitSign(false);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [visaItem]);

  // 轮询 DownloadURL 接口成功时把定时器清除
  useEffect(() => {
    if (URL) {
      interval && clearInterval(interval);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [URL]);

  // 轮询 DownloadURL 接口, 轮询 10 次还没成功,放弃轮询
  useEffect(() => {
    if (count === 10) {
      interval && clearInterval(interval);
      openSnackbar("请求超时", "error");
      findURLResultHandler();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [count]);

  async function executeFindDownloadURLQuery(): Promise<void> {
    const queryResult = await client
      .query<DownloadUrlQuery, DownloadUrlQueryVariables>(DownloadUrlDocument, {
        id: resultID,
      })
      .toPromise();

    if (queryResult.data?.getDownloadURL?.url) {
      setURL(queryResult.data.getDownloadURL.url);
      findURLResultHandler();
      window.open(getResourceUrl(queryResult.data.getDownloadURL.url));
      return;
    }

    if (queryResult.error) {
      openSnackbar("请求出错", "error");
      findURLResultHandler();
    }
  }

  // 轮询 DownloadURL 接口
  useEffect(() => {
    if (resultID) {
      // eslint-disable-next-line react-hooks/exhaustive-deps
      interval = setInterval(() => {
        executeFindDownloadURLQuery();
        setCount((preCount) => {
          return preCount + 1;
        });
      }, 1000);

      return (): void => {
        interval && clearInterval(interval);
      };
    }
  }, [resultID]);

  const [findExportRemainingQueryResult, executeExportRemainingQuery] = useExportRemainingQuery({
    requestPolicy: "network-only",
    variables: {
      exportType: GExportType.Database,
    },
  });

  useEffect(() => {
    if (open == true) {
      executeExportRemainingQuery();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [open]);

  useEffect(() => {
    const data = findExportRemainingQueryResult.data?.remainingExport;
    if (data) {
      const total = data.total;
      const remaining = data.remaining;
      const item: VisaItem = {
        total: total,
        remaining: remaining,
      };
      setVisaItem(item);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [findExportRemainingQueryResult]);

  async function executeProfileTableDataQuery(): Promise<void> {
    const queryResult = await client
      .query<ExportProfileTableQuery, ExportProfileTableQueryVariables>(
        ExportProfileTableDocument,
        profileTableDataExport,
      )
      .toPromise();

    if (queryResult.data?.exportTableData?.id) {
      setResultID(queryResult.data?.exportTableData?.id);
      return;
    }

    if (queryResult.error) {
      openSnackbar("请求出错", "error");
      findURLResultHandler();
      return;
    }
  }

  async function executeProfileStatementSheetQuery(): Promise<void> {
    const queryResult = await client
      .query<ExportStatementSheetQuery, ExportStatementSheetQueryVariables>(
        ExportStatementSheetDocument,
        exportStatementSheetVariables,
      )
      .toPromise();

    if (queryResult.data?.exportStatementSheet?.id) {
      setResultID(queryResult.data?.exportStatementSheet?.id);
      return;
    }

    if (queryResult.error) {
      openSnackbar("请求出错", "error");
      findURLResultHandler();
      return;
    }
  }

  async function executeExportRealmSheetDataByEntitiesQuery(): Promise<void> {
    if (!exportRealmSheetByEntitiesVariables) return;
    const queryResult = await client
      .query<ExportRealmSheetDataByEntitiesQuery, ExportRealmSheetDataByEntitiesQueryVariables>(
        ExportRealmSheetDataByEntitiesDocument,
        exportRealmSheetByEntitiesVariables,
      )
      .toPromise();
    if (queryResult.data?.exportRealmSheetDataByEntities?.id) {
      setResultID(queryResult.data.exportRealmSheetDataByEntities.id);
      return;
    }
    if (queryResult.error) {
      openSnackbar("请求出错", "error");
      findURLResultHandler();
      return;
    }
  }

  async function executeExportRealmSheetDataQuery(): Promise<void> {
    const queryResult = await client
      .query<ExportRealmSheetDataQuery, ExportRealmSheetDataQueryVariables>(
        ExportRealmSheetDataDocument,
        exportRealmSheetVariables,
      )
      .toPromise();
    if (queryResult.data?.exportRealmSheetData?.id) {
      setResultID(queryResult.data?.exportRealmSheetData?.id);
      return;
    }
    if (queryResult.error) {
      openSnackbar("请求出错", "error");
      findURLResultHandler();
      return;
    }
  }

  async function executeExportTrealmSheetDataQuery(): Promise<void> {
    const queryResult = await client
      .query<ExportTrealmSheetDataQuery, ExportTrealmSheetDataQueryVariables>(
        ExportTrealmSheetDataDocument,
        exportTrealmSheetVariables,
      )
      .toPromise();
    if (queryResult.data?.exportTrealmSheetData?.id) {
      setResultID(queryResult.data?.exportTrealmSheetData?.id);
      return;
    }
    if (queryResult.error) {
      openSnackbar("请求出错", "error");
      findURLResultHandler();
      return;
    }
  }

  async function executeExportTrealmSheetDataByEntitiesQuery(): Promise<void> {
    if (!exportTrealmSheetByEntitiesVariables) return;
    const queryResult = await client
      .query<ExportTrealmSheetDataByEntitiesQuery, ExportTrealmSheetDataByEntitiesQueryVariables>(
        ExportTrealmSheetDataByEntitiesDocument,
        exportTrealmSheetByEntitiesVariables,
      )
      .toPromise();
    if (queryResult.data?.exportTrealmSheetDataByEntities?.id) {
      setResultID(queryResult.data.exportTrealmSheetDataByEntities.id);
      return;
    }
    if (queryResult.error) {
      openSnackbar("请求出错", "error");
      findURLResultHandler();
      return;
    }
  }

  // async function executeVerticalTableDataQuery(): Promise<void> {
  //   const queryResult = await client
  //     .query<ExportSearchVerticalResultsQuery, ExportSearchVerticalResultsQueryVariables>(
  //       ExportSearchVerticalResultsDocument,
  //       verticalExport,
  //     )
  //     .toPromise();

  //   if (queryResult.data?.exportSearchVerticalResults?.id) {
  //     setResultID(queryResult.data.exportSearchVerticalResults.id);
  //     return;
  //   }

  //   if (queryResult.error) {
  //     openSnackbar("请求出错", "error");
  //     findURLResultHandler();
  //     return;
  //   }
  // }

  // async function exportSearchVerticalEntityResults(): Promise<void> {
  //   const queryResult = await client
  //     .query<ExportSearchVerticalEntityResultsQuery, ExportSearchVerticalEntityResultsQueryVariables>(
  //       ExportSearchVerticalEntityResultsDocument,
  //       verticalSelectedExport,
  //     )
  //     .toPromise();

  //   if (queryResult.data?.exportSearchVerticalEntityResults?.id) {
  //     setResultID(queryResult.data.exportSearchVerticalEntityResults.id);
  //     return;
  //   }

  //   if (queryResult.error) {
  //     openSnackbar("请求出错", "error");
  //     findURLResultHandler();
  //     return;
  //   }
  // }

  function exportData(): void {
    if (permitSign === false) {
      close();
      deletedAll?.();
      return;
    }
    setLoading(true);
    if (exportType == ExportType.Profile) {
      const profile = props.profileTableDataExport as TableDataExport;
      muse.sendTrackingEvent("profile.export", {
        table_id: profile.id,
        entity: {
          id: profile.entityID,
          type: profile.entityType ?? "ORGANIZATION",
        },
      });
      executeProfileTableDataQuery();
      return;
    }
    if (exportType == ExportType.ProfileStatementSheet) {
      executeProfileStatementSheetQuery();
      return;
    }
    if (exportType == ExportType.RealmSheet) {
      const variables = props.exportRealmSheetVariables;
      if (!variables) return;
      const event = {};
      if (variables.templateID) event["template_id"] = variables.templateID;
      event["columns"] = variables.columnIDs;
      muse?.sendTrackingEvent("advance_search.export", event);
      executeExportRealmSheetDataQuery();
      return;
    }
    if (exportType == ExportType.RealmSheetByEntities) {
      const variables = props.exportRealmSheetByEntitiesVariables;
      if (!variables) return;
      muse.sendTrackingEvent("advance_search.export", {
        entities: variables.entities.map((e) => ({ id: e?.entityId ?? "", type: e?.entityType ?? "" })),
        columns: variables.columnIDs,
      });

      executeExportRealmSheetDataByEntitiesQuery();
      return;
    }
    if (exportType == ExportType.TrealmSheet) {
      const variables = props.exportTrealmSheetVariables;
      if (!variables) return;
      const event = {};
      event["columns"] = variables.columnIDs;
      muse?.sendTrackingEvent("trealm.export", event);
      executeExportTrealmSheetDataQuery();
      return;
    }
    if (exportType == ExportType.TrealmSheetByEntities) {
      const variables = props.exportTrealmSheetByEntitiesVariables;
      if (!variables) return;
      muse.sendTrackingEvent("trealm.export", {
        entities: variables.entities.map((e) => ({ id: e?.entityId ?? "", type: e?.entityType ?? "" })),
        columns: variables.columnIDs,
      });
      executeExportTrealmSheetDataByEntitiesQuery();
      return;
    }
    // if (exportType == ExportType.Vertical) {
    //   const vertical = props.verticalExport as VerticalExport;
    //   EventTracking.sendCustomVerticalEvent(
    //     CustomVerticalEventNames.ExportTable,
    //     {
    //       searchType: vertical.searchType,
    //       keywords: vertical.condition.keywords,
    //       locationID: vertical.condition.locationID ?? "",
    //       latestDealTypes: vertical.condition.latestDealTypes as string[],
    //       topPlayerInvested: vertical.condition.topPlayerInvested ? "top" : "",
    //     },
    //     muse,
    //   );
    // executeVerticalTableDataQuery();
    //   return;
    // }

    //   if (exportType == ExportType.VerticalSelected) {
    //     const vertical = props.verticalSelectedExport as VerticalSelectedExport;
    //     EventTracking.sendCustomVerticalEvent(
    //       CustomVerticalEventNames.ExportSelectedEntity,
    //       {
    //         entityIDs: vertical.entityIDs,
    //         searchType: vertical.searchType,
    //         keywords: vertical.condition.keywords,
    //         locationID: vertical.condition.locationID ?? "",
    //         latestDealTypes: vertical.condition.latestDealTypes as string[],
    //         topPlayerInvested: vertical.condition.topPlayerInvested ? "top" : "",
    //       },
    //       muse,
    //     );
    //     exportSearchVerticalEntityResults();
    //     return;
    //   }
  }

  function getExportText(remaining: number): string {
    if (remaining <= 0) {
      return `当日可导出次数为 ${remaining}`;
    }
    return "-";
  }

  function getExportNode(): ReactNode {
    if (permitSign) {
      return (
        <Box className={classes.dialogContentTop}>
          <Typography className={classes.selectEntry}>{`准备导出 ${selectEntry} 条数据`}</Typography>
        </Box>
      );
    } else {
      return (
        <Box className={classes.dialogContentTop}>
          <Typography className={classes.selectEntry}>无法导出</Typography>
          <Typography className={classes.remaining}>{getExportText(visaItem?.remaining as number)}</Typography>
        </Box>
      );
    }
  }
  return (
    <Dialog open={open} classes={{ paper: classes.paperRoot }} onClose={findURLResultHandler}>
      <DialogTitle className={classes.dialogTitle}>
        <Typography className={classes.title}>{dialogTitle}</Typography>
      </DialogTitle>
      <DialogContent className={classes.dialogContent}>
        {getExportNode()}
        <Box className={classes.dialogContentBottom}>
          <Typography>当日导出</Typography>
          <Typography className={classes.number}>
            {`次数: ${visaItem?.total == null ? "-" : visaItem.total} 次，还可以导出 ${
              visaItem?.remaining == null ? "-" : visaItem.remaining
            } 次`}
          </Typography>
        </Box>
      </DialogContent>
      <DialogActions>
        <Button
          className={classes.cancelButton}
          onClick={(): void => {
            close();
            deletedAll?.();
          }}
        >
          取消
        </Button>
        <Button color="primary" onClick={exportData}>
          确认
        </Button>
      </DialogActions>

      <Backdrop className={classes.backdrop} open={loading}>
        <CircularProgress color="inherit" size={30} />
      </Backdrop>
    </Dialog>
  );
};

export default ExportDialog;
