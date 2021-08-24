import { Box, createStyles, makeStyles, Theme, Typography } from "@material-ui/core";
import clsx from "clsx";
import { CheckboxMarkedCircle, CloseCircle, Refresh } from "mdi-material-ui";
import Download from "mdi-material-ui/Download";
import React, { FC, useMemo } from "react";
import { ExportRecord, ExportType, Status } from "../../generated/graphql";
import { getResourceUrl } from "../../utils/url";
import { tableColumns } from "./const";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    noData: {
      fontSize: 14,
      color: "#666",
    },
    bold: {
      fontWeight: theme.typography.fontWeightMedium,
    },
    infiniteRotate: {
      animation: "$rotate 2.5s linear infinite",
    },
    "@keyframes rotate": {
      "0%": {
        transform: "rotate(0)",
      },
      "100%": {
        transform: "rotate(360deg)",
      },
    },
  }),
);

interface ListProps {
  exportType: ExportType;
  records: ExportRecord[];
  loading?: boolean;
}

const List: FC<ListProps> = (props) => {
  const { exportType, records, loading } = props;
  const classes = useStyles();

  const columns = useMemo(() => tableColumns[exportType], [exportType]);

  function cellComponent(key: keyof ExportRecord, record: ExportRecord) {
    switch (key) {
      case "name":
      case "createdTime":
      case "rowNum":
        return <Typography className={clsx(classes.noData, classes.bold)}>{record[key]}</Typography>;
      case "status": {
        switch (record[key]) {
          case Status.Success:
            return (
              <Box display="inline-flex" alignItems="center">
                <CheckboxMarkedCircle style={{ fontSize: 16 }} color="primary" />
                <Box width="4px" />
                <Typography className={clsx(classes.noData, classes.bold)}>导出成功</Typography>
              </Box>
            );
          case Status.Failure:
            return (
              <Box display="inline-flex" alignItems="center">
                <CloseCircle style={{ fontSize: 16 }} color="error" />
                <Box width="4px" />
                <Typography className={clsx(classes.noData, classes.bold)} color="error">
                  导出失败
                </Typography>
              </Box>
            );
          case Status.Running:
            return (
              <Box display="inline-flex" alignItems="center">
                <Refresh className={classes.infiniteRotate} style={{ fontSize: 16 }} color="primary" />
                <Box width="4px" />
                <Typography className={clsx(classes.noData, classes.bold)}>文档生成中</Typography>
              </Box>
            );
          case Status.Timeout:
            return (
              <Box display="inline-flex" alignItems="center">
                <CloseCircle style={{ fontSize: 16 }} color="error" />
                <Box width="4px" />
                <Typography className={clsx(classes.noData, classes.bold)} color="error">
                  文档已过期
                </Typography>
              </Box>
            );
          default:
            return null;
        }
      }
      case "url": {
        if (record[key] && record.status === "SUCCESS") {
          return (
            <a href={getResourceUrl(record[key])} download>
              <Download style={{ color: "#656565" }} />
            </a>
          );
        } else {
          return <Download style={{ color: "#CCC" }} />;
        }
      }
    }
  }

  function recordComponent(record: ExportRecord) {
    return (
      <Box key={record.id as string} display="flex" alignItems="center">
        {columns.map((c, i) => (
          <Box
            key={c.name}
            textAlign={c.align}
            flex={c.flex}
            padding={c.width ? "12px 8px" : "12px 4%"}
            width={c.width}
            paddingLeft={i === 0 ? "8px" : undefined}
          >
            {cellComponent(c.recordKey as keyof ExportRecord, record)}
          </Box>
        ))}
      </Box>
    );
  }

  if (!(length in records) || records.length === 0) {
    if (loading) return null;
    return (
      <Box padding="24px" textAlign="center">
        <Typography className={classes.noData}>暂无导出记录</Typography>
      </Box>
    );
  }

  return <Box className={classes.root}>{records.map((r) => recordComponent(r))}</Box>;
};

export default List;
