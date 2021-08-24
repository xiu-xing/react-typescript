import { Button, CircularProgress, createStyles, makeStyles, Theme, Typography } from "@material-ui/core";
import { Check, Close, OpenInNew } from "mdi-material-ui";
import React, { FC, useCallback, useMemo, useState } from "react";
import { useClient } from "urql";
import AppContainer from "../../../containers/appContainer";
import {
  DownloadUrlDocument,
  DownloadUrlQuery,
  DownloadUrlQueryVariables,
  EntityType,
  ExportPdfDocument,
  ExportPdfQuery,
  ExportPdfQueryVariables
} from "../../../generated/graphql";
import { getFrequencyLimit, getLockLimit } from "../../../utils/permission";
import { getResourceUrl } from "../../../utils/url";
import SnackbarContainer from "../../common/snackbar/snackbarContainer";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    label: {
      fontSize: 14,
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

interface ExportButtonProps {
  id: string;
  name: string;
  type: EntityType;
}

type Status = "pending" | "error" | "success" | "initial";

const ExportButton: FC<ExportButtonProps> = (props) => {
  const { id, name, type } = props;
  const classes = useStyles();
  const client = useClient();
  const [status, setStatus] = useState<Status>("initial");
  const { showTips, cancelTips } = AppContainer.useContainer();
  const { openSnackbar } = SnackbarContainer.useContainer();

  const getUrl = useCallback(
    (id: string) => {
      return client
        .query<DownloadUrlQuery, DownloadUrlQueryVariables>(DownloadUrlDocument, {
          id: id,
        })
        .toPromise();
    },
    [client],
  );

  const handleClick = useCallback(async () => {
    setStatus("pending");
    showTips(
      "正在为您生成PDF，稍后将为您自动下载，如未开始下载，请前往下载记录页面手动下载...",
      "/export",
      "前往导出记录",
    );
    client
      .query<ExportPdfQuery, ExportPdfQueryVariables>(ExportPdfDocument, {
        entityID: id,
        primaryName: name,
        entityType: type,
      })
      .toPromise()
      .then(async (res) => {
        if (res.error) {
          setStatus("error");
          openSnackbar("导出失败", "error");
          return;
        }

        if (getFrequencyLimit(res.data?.exportPDF?.permissions)) {
          openSnackbar("导出次数已用完", "error");
          setStatus("error");
          return;
        }

        if (getLockLimit(res.data?.exportPDF?.permissions)) {
          openSnackbar("导出次数已用完", "error");
          setStatus("error");
          return;
        }

        if (res.data?.exportPDF?.id) {
          const resource = await getUrl(res.data?.exportPDF?.id);

          if (resource.data?.getDownloadURL?.url) {
            setStatus("success");
            window.open(getResourceUrl(resource.data?.getDownloadURL?.url));
          } else {
            setStatus("error");
            openSnackbar("导出失败", "error");
          }
        }
      })
      .catch(() => {
        setStatus("error");
      })
      .finally(() => {
        cancelTips();
        setTimeout(() => setStatus("initial"), 1000);
      });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [client, id, name, type]);

  const startIcon = useMemo(() => {
    switch (status) {
      case "initial":
        return <OpenInNew color="primary" />;
      case "error":
        return <Close color="error" />;
      case "pending":
        return <CircularProgress color="primary" size={16} />;
      case "success":
        return <Check color="primary" />;
      default:
        return <OpenInNew color="primary" />;
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [status]);

  return (
    <Button
      size="medium"
      variant="outlined"
      color="primary"
      disabled={status === "pending"}
      className={classes.root}
      onClick={handleClick}
      startIcon={startIcon}
    >
      <Typography noWrap className={classes.label}>
        导出
      </Typography>
    </Button>
  );
};

export default ExportButton;
