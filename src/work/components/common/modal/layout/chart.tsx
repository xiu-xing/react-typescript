/* eslint-disable no-case-declarations */
import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useEffect, useState } from "react";
import ConfigContainer from "../../../../containers/configContainer";
import { ChartModel } from "../../../../models/chart/chart";
import { ChartDataModel } from "../../../../models/chart/chartData";
import CommonChart from "../../chart-next/common-chart";
import { useModalData } from "../atom";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "560px",
      height: "320px",
      padding: "24px 10px",
    },
    title: {
      fontSize: "16px",
      color: "#333",
      fontWeight: 500,
      padding: "0 14px",
    },
    expendIcon: {
      fontSize: 24,
      color: "#666",
      cursor: "pointer",
    },
    default: {
      height: 290,
    },
  }),
);

export interface ChartLayoutProps {
  title?: string;
  data?: string;
  args: Map<string, string>;
}

const ChartLayout: React.FunctionComponent<ChartLayoutProps> = (props) => {
  const classes = useStyles();
  const { args } = props;
  const [modalDataState] = useModalData();
  const [chartConfig, setChartConfig] = useState<ChartModel>();
  const [chartData, setChartData] = useState<ChartDataModel>();
  const [title, setTitle] = useState<string>("");
  const { trackChartConfigs, trealmTrackerChartConfigs } = ConfigContainer.useContainer();
  const [showChart, setShowChart] = useState(false);

  useEffect(() => {
    if (trackChartConfigs && args["chart_id"]) {
      setChartConfig(ChartModel.fromJSON(trackChartConfigs[args["chart_id"]]));
    }
    if (trealmTrackerChartConfigs && args["chart_id"]) {
      setChartConfig(ChartModel.fromJSON(trealmTrackerChartConfigs[args["chart_id"]]));
    }
  }, [trackChartConfigs, trealmTrackerChartConfigs]);

  useEffect(() => {
    if (modalDataState) {
      const data = ChartDataModel.fromJSON(JSON.parse(modalDataState.get("data") as string));
      setTitle(modalDataState.get("name") as string);
      setChartData(data);
    }
  }, [modalDataState]);

  useEffect(() => {
    if (chartConfig && chartData && args["chart_id"]) setShowChart(true);
  }, [chartConfig, chartData, args]);

  return (
    <div className={classes.root} onClick={(e) => e.stopPropagation()}>
      {title && <Typography className={classes.title}>{title}</Typography>}
      {showChart && (
        <div className={classes.default}>
          <CommonChart
            id={args["chart_id"]}
            chartData={chartData!}
            chartConfig={chartConfig!}
            getChartRef={(i) => {
              setTimeout(() => {
                i.current?.resize();
              }, 400);
            }}
          />
        </div>
      )}
    </div>
  );
};

export default ChartLayout;
