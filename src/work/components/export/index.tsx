import { Box, CircularProgress, createStyles, makeStyles, Tab, Theme, Typography, withStyles } from "@material-ui/core";
import { TabContext, TabList } from "@material-ui/lab";
import { OverlayScrollbarsComponent } from "overlayscrollbars-react";
import React, { FC, useCallback, useEffect, useMemo, useRef, useState } from "react";
import { useClient } from "urql";
import { APPBAR_HEIGHT } from "../../containers/appContainer";
import {
  ExportRecord,
  ExportType,
  ExportUserHistoryDocument,
  ExportUserHistoryQuery,
  ExportUserHistoryQueryVariables,
  PageInfo,
  useExportRemainingQuery
} from "../../generated/graphql";
import SnackbarContainer from "../common/snackbar/snackbarContainer";
import { TAB_HEIGHT, TAB_WIDTH } from "../profile/content/tabs/tab";
import { exportTypes, exportTypeText, tableColumns } from "./const";
import List from "./list";

const StyledTabList = withStyles((theme: Theme) =>
  createStyles({
    root: {
      minHeight: TAB_HEIGHT,
      "& .MuiTabs-flexContainer": {
        "& button:not(:last-child)": {
          marginRight: 32,
        },
      },
    },
    indicator: {
      height: 3,
      backgroundColor: theme.palette.primary.main,
    },
  }),
)(TabList);

const StyledTab = withStyles((theme: Theme) =>
  createStyles({
    root: {
      position: "relative",
      minWidth: TAB_WIDTH,
      minHeight: TAB_HEIGHT,
      padding: "10px 4px",
      lineHeight: 1.72,
      textTransform: "none",
      overflow: "visible",
    },
    textColorInherit: {
      color: "#999",
      opacity: 1,
    },
    selected: {
      color: theme.palette.primary.main,
      fontWeight: 500,
    },
  }),
)(Tab);

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      maxHeight: `calc(100vh - ${APPBAR_HEIGHT}px)`,
      overflowY: "auto",
      overflowX: "hidden",
    },
    title: {
      fontSize: 20,
    },
  }),
);

const Export: FC = () => {
  const classes = useStyles();
  const [exportType, setExportType] = useState(exportTypes[0]);
  const ref = useRef<OverlayScrollbarsComponent | null>(null);
  const client = useClient();
  const [exportRecords, setExportRecords] = useState<ExportRecord[]>([]);
  const [fetching, setFetching] = useState(false);
  const { openSnackbar } = SnackbarContainer.useContainer();

  const [pageInfo, setPageInfo] = useState<Pick<PageInfo, "endCursor" | "hasNextPage">>({
    hasNextPage: true,
  });

  const query = useCallback(
    (type: ExportType, first: number, after?: string) => {
      return client
        .query<ExportUserHistoryQuery, ExportUserHistoryQueryVariables>(ExportUserHistoryDocument, {
          exportType: type,
          first: first,
          after: after,
        })
        .toPromise();
    },
    [client],
  );

  const [databaseRemainTimesQueryResult] = useExportRemainingQuery({
    variables: {
      exportType: ExportType.Database,
    },
  });

  const [detailPageRemainTimesQueryResult] = useExportRemainingQuery({
    variables: {
      exportType: ExportType.DetailsPage,
    },
  });

  const times = useMemo(() => {
    if (exportType === ExportType.Database) {
      return {
        remain: databaseRemainTimesQueryResult.data?.remainingExport?.remaining ?? 0,
        total: databaseRemainTimesQueryResult.data?.remainingExport?.total ?? 0,
      };
    }
    if (exportType === ExportType.DetailsPage) {
      return {
        remain: detailPageRemainTimesQueryResult.data?.remainingExport?.remaining ?? 0,
        total: detailPageRemainTimesQueryResult.data?.remainingExport?.total ?? 0,
      };
    }
    return {
      remain: 0,
      total: 0,
    };
  }, [databaseRemainTimesQueryResult.data, detailPageRemainTimesQueryResult.data, exportType]);

  useEffect(() => {
    // scroll to top
    ref.current?.osInstance()?.scroll(0, 0);
    setExportRecords([]);

    setFetching(true);

    query(exportType, 20)
      .then((res) => {
        if (res.error) {
          openSnackbar("请求出错", "error");
        }

        setExportRecords((res.data?.userExportHistory?.nodes as ExportRecord[]) ?? []);
        setPageInfo({
          hasNextPage: res.data?.userExportHistory?.pageInfo?.hasNextPage ?? false,
          endCursor: res.data?.userExportHistory?.pageInfo?.endCursor,
        });
      })
      .finally(() => setFetching(false));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [exportType, query]);

  const handleScroll = useCallback(() => {
    if (ref.current?.osInstance()?.scroll().ratio.y === 1 && pageInfo.hasNextPage) {
      setFetching(true);
      query(exportType, 20, pageInfo.endCursor as string)
        .then((res) => {
          if (res.error) {
            openSnackbar("请求出错", "error");
          }

          setPageInfo({
            hasNextPage: res.data?.userExportHistory?.pageInfo?.hasNextPage ?? false,
            endCursor: res.data?.userExportHistory?.pageInfo?.endCursor,
          });

          setExportRecords((prev) => [...prev, ...((res.data?.userExportHistory?.nodes as ExportRecord[]) ?? [])]);
        })
        .finally(() => setFetching(false));
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [exportType, pageInfo.endCursor, pageInfo.hasNextPage, query]);

  return (
    <OverlayScrollbarsComponent
      className={classes.root}
      ref={ref}
      options={{
        callbacks: {
          onScroll: handleScroll,
        },
        overflowBehavior: {
          x: "hidden",
          y: "scroll",
        },
        scrollbars: {
          autoHide: "m",
        },
      }}
    >
      <Box maxWidth={1316} margin="auto">
        <TabContext value={exportType}>
          <Box bgcolor="#fff" position="sticky" top={0} padding="24px" paddingBottom="0px" zIndex={1}>
            <Typography className={classes.title} noWrap>
              导出记录
            </Typography>
            <Box height={24} />
            <Box
              display="grid"
              gridTemplateColumns="1fr max-content"
              alignItems="center"
              borderBottom="1px solid #EEE"
              paddingLeft="8px"
            >
              <StyledTabList onChange={(_, value) => setExportType(value)}>
                {exportTypes.map((t) => (
                  <StyledTab key={t} value={t} label={exportTypeText[t]} />
                ))}
              </StyledTabList>
              <Typography noWrap component="div">
                当日可导出次数：
                <Typography color="primary" component="span">
                  {times.remain}
                </Typography>
                /{times.total}
              </Typography>
            </Box>
            <Box height={20} />
            <Box display="flex" alignItems="center">
              {(tableColumns[exportType] ?? []).map((c, i) => (
                <Box
                  key={c.name}
                  flex={c.flex}
                  padding={c.width ? "4px 8px" : "4px 4%"}
                  paddingBottom="8px"
                  textAlign={c.align}
                  width={c.width}
                  paddingLeft={i === 0 ? "8px" : undefined}
                >
                  <Typography>{c.name}</Typography>
                </Box>
              ))}
            </Box>
          </Box>
          {exportTypes.map((e) => (
            <Box key={e} hidden={exportType !== e} paddingX="24px">
              <List loading={fetching} records={exportRecords} exportType={exportType} />
              <Box textAlign="center" padding="24px">
                {fetching ? (
                  <CircularProgress color="primary" thickness={2.8} size={30} />
                ) : !pageInfo.hasNextPage && exportRecords.length !== 0 ? (
                  <Typography style={{ fontSize: 14, color: "#666" }}>滑到底啦！</Typography>
                ) : null}
              </Box>
            </Box>
          ))}
        </TabContext>
      </Box>
    </OverlayScrollbarsComponent>
  );
};

export default Export;
