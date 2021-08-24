import { Box, CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import GetAppIcon from "@material-ui/icons/GetApp";
import format from "date-fns/format";
import fromUnixTime from "date-fns/fromUnixTime";
import React, { useCallback, useEffect, useRef, useState } from "react";
import SimpleBar from "simplebar-react";
import { TrealmImportHistory, TrealmImportType, useTrealmImportHistoryQuery } from "../../../generated/graphql";
import { inDay } from "../../../utils/date";
import { currencyFormat } from "../../../utils/unit";
import CommonAccordionPlaceholder from "../../common/accordion/components/placeholder";
const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    simpleBar: {
      maxHeight: 336,
      boxSizing: "border-box",
      padding: "16px 0",
    },
    infoBox: {
      display: "flex",
      justifyContent: "space-between",
    },
    infoItemBox: {
      padding: "0px 32px 12px",
    },
    mainInfoText: {
      maxWidth: 250,
      fontSize: 16,
      color: theme.palette.grey[800],
      marginBottom: 4,
    },
    subInfoText: {
      fontSize: 14,
      color: theme.palette.grey[500],
    },
    button: {
      color: theme.palette.primary.main,
    },
    downloadButton: {
      display: "flex",
      alignItems: "center",
      color: theme.palette.primary.main,
      marginRight: 16,
      borderRadius: 4,
      cursor: "pointer",
      marginLeft: -2,
    },
    downloadIcon: {
      fontSize: 20,
    },
    buttonText: {
      fontSize: 14,
      fontWeight: 500,
    },
  }),
);

export function getUnit(type: TrealmImportType) {
  switch (type) {
    case TrealmImportType.FundManager:
      return "位基金管理人";
    case TrealmImportType.Fund:
      return "支直投基金";
    case TrealmImportType.PortfolioCompany:
      return "个直投项目";
    case TrealmImportType.FundOfFund:
      return "支母基金";
    case TrealmImportType.CommittedFund:
      return "支子基金";
    case TrealmImportType.CommittedFundPortfolioCompany:
      return "个子基金项目";
    case TrealmImportType.ShareholderRecord:
      return "条持股路径";
    default:
      return "";
  }
}

const UploadHistory: React.FunctionComponent = () => {
  const classes = useStyles();

  const [fetching, setFetching] = useState(false);
  const [historyInfoList, setHistoryInfoList] = useState<TrealmImportHistory[]>([]);
  const [showNodata, setShowNodata] = useState(false);
  const [after, setAfter] = useState<string>();

  const simpleBarScrollRef = useRef<HTMLDivElement>(null);
  const historyInfoListRef = useRef<TrealmImportHistory[]>([]);
  const hasNextPageRef = useRef(true);

  const [TrealmImportHistoryResult] = useTrealmImportHistoryQuery({
    variables: {
      first: 20,
      after: after,
    },
    requestPolicy: "network-only",
  });

  const scrollHandler = useCallback(() => {
    if (!simpleBarScrollRef.current || fetching || !hasNextPageRef.current) return;
    if (
      simpleBarScrollRef.current.scrollHeight -
        simpleBarScrollRef.current.scrollTop -
        simpleBarScrollRef.current.clientHeight <=
      5
    ) {
      setFetching(true);
      const after = btoa((historyInfoListRef.current.length - 1).toString());
      setAfter(after);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    simpleBarScrollRef.current && simpleBarScrollRef.current?.addEventListener("scroll", scrollHandler);
    return () => {
      simpleBarScrollRef.current && simpleBarScrollRef.current?.removeEventListener("scroll", scrollHandler);
    };
  }, []);

  useEffect(() => {
    setFetching(TrealmImportHistoryResult.fetching);
    if (TrealmImportHistoryResult.fetching) return;

    const data = TrealmImportHistoryResult.data?.trealmImportHistory;
    hasNextPageRef.current = data?.pageInfo.hasNextPage ?? false;

    if (data?.totalCount === 0 && !after) {
      historyInfoListRef.current = [];
      setHistoryInfoList([]);
      setShowNodata(true);
      return;
    }

    data?.nodes &&
      setHistoryInfoList((prev) => {
        historyInfoListRef.current = [...prev, ...(data.nodes as TrealmImportHistory[])];
        return historyInfoListRef.current;
      });
  }, [TrealmImportHistoryResult]);

  const getTime = (time: number) => {
    const date = inDay(time) ? format(fromUnixTime(time), "HH:mm") : format(fromUnixTime(time), "yyyy-MM-dd");
    return date;
  };

  return (
    <div className={classes.root}>
      <SimpleBar className={classes.simpleBar} scrollableNodeProps={{ ref: simpleBarScrollRef }}>
        {historyInfoList &&
          historyInfoList.map((info, index) => (
            <Box key={index} className={classes.infoItemBox}>
              <Box className={classes.infoBox}>
                <Typography className={classes.mainInfoText}>
                  {info.userName} 上传了 <span style={{ fontWeight: 500 }}>{info.importFileName}</span>
                </Typography>
                <Typography className={classes.subInfoText}>{getTime(info.completeTime)}</Typography>
              </Box>
              <Typography className={classes.subInfoText}>
                成功导入 {currencyFormat(info.importCount)} {getUnit(info.importType)}
              </Typography>
              <Box style={{ display: "flex", padding: "4px 0" }}>
                <Box className={classes.downloadButton} onClick={() => window.open(info.importResource)}>
                  <GetAppIcon className={classes.downloadIcon} />
                  <Typography className={classes.buttonText}>下载原文件</Typography>
                </Box>
                {info.dismatchResource && (
                  <Box className={classes.downloadButton} onClick={() => window.open(info.dismatchResource!)}>
                    <GetAppIcon className={classes.downloadIcon} />
                    <Typography className={classes.buttonText}>下载未匹配</Typography>
                  </Box>
                )}
              </Box>
            </Box>
          ))}
        {fetching && (
          <Box display="grid" alignItems="center" justifyContent="center" style={{ height: 50 }}>
            <CircularProgress size={30} />
          </Box>
        )}
        {showNodata && <CommonAccordionPlaceholder />}
      </SimpleBar>
    </div>
  );
};

export default UploadHistory;
