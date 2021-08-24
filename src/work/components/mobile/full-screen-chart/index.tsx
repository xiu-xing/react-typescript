import { Box, IconButton, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { ChevronLeft } from "mdi-material-ui";
import React, { useMemo } from "react";
import { EntityType, Filter, NextPlatform } from "../../../generated/graphql";
import { useFilterInputs } from "../../../utils/hooks";
import FilterItem from "../../common/filter-item";
import Space from "../../common/space";
import DataChart from "../common/data-chart";
import MobileGraph from "../common/graph-chart";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    appBar: {
      minHeight: 56,
      display: "flex",
      alignItems: "center",
      justifyContent: "space-between",
    },
    root: {
      padding: "0 17px 0",
      height: "100vh",
      position: "relative",
      display: "flex",
      flexDirection: "column",
    },
    title: {
      fontSize: 16,
      fontWeight: 500,
    },
    button: {
      width: 44,
      height: 44,
      display: "inline-flex",
      position: "absolute",
      right: "3%",
      backgroundColor: "#fff",
      "& .MuiFab-label": {
        flexDirection: "column",
      },
      boxShadow:
        "0px 1px 18px 0px rgba(0, 0, 0, 0.12), 0px 6px 10px 0px rgba(0, 0, 0, 0.14), 0px 3px 5px -1px rgba(0, 0, 0, 0.2)",
    },
    more: {
      bottom: "calc(4% + 44px + 24px)",
    },
    exit: {
      bottom: "4%",
    },
    buttonText: {
      fontSize: 12,
      color: theme.palette.primary.main,
    },
  }),
);

interface FullScreenChartProps {
  id: string;
  type: "chart" | "graph";
  entityId: string;
  entityType: EntityType;
  name?: string;
  filters?: Filter[];
}

const FullScreenChart: React.FunctionComponent<FullScreenChartProps> = (props) => {
  const classes = useStyles();
  const { id, type, name, filters, ...restProps } = props;
  const [filterInputs, update] = useFilterInputs(filters);

  const chart = useMemo(() => {
    if (type === "chart") {
      return <DataChart id={id} {...restProps} platform={NextPlatform.PlatformMobile} filterInputs={filterInputs} />;
    }
    if (type === "graph") {
      return <MobileGraph graphId={id} {...restProps} />;
    }
  }, [id, restProps, type, filterInputs]);

  return (
    <Box className={classes.root}>
      <Box className={classes.appBar}>
        <Box display="inline-flex" alignItems="center">
          <IconButton
            onClick={(): void => {
              document.location.href = "js://webview/exit";
            }}
          >
            <ChevronLeft style={{ fontSize: 24 }} />
          </IconButton>
          <Typography noWrap className={classes.title}>
            {name}
          </Typography>
        </Box>
        {(filters?.length ?? 0) > 0 && (
          <Space>
            {filters?.map((f) => (
              <FilterItem key={f?.id as string} filter={f} onChange={update} />
            ))}
          </Space>
        )}
      </Box>
      {chart}
      {/* <Fab
        size="small"
        className={clsx(classes.button, classes.exit)}
        onClick={(): void => {
          document.location.href = "js://webview/exit";
        }}
      >
        <LogoutVariant color="primary" style={{ fontSize: 16 }} />
        <Typography noWrap className={classes.buttonText}>
          退出
        </Typography>
      </Fab> */}
      {/* <Fab
        size="small"
        className={clsx(classes.button, classes.more)}
        onClick={(): void => {
          document.location.href = "js://webview/exit";
        }}
      >
        <LogoutVariant color="primary" style={{ fontSize: 16 }} />
        <Typography noWrap className={classes.buttonText}>
          更多
        </Typography>
      </Fab> */}
    </Box>
  );
};

export default FullScreenChart;
