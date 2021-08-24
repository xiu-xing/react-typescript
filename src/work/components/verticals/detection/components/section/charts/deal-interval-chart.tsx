import { createStyles, makeStyles, Typography } from "@material-ui/core";
import ReactEcharts, { EChartsOption } from "echarts-for-react";
import _ from "lodash";
import React, { useEffect, useState } from "react";
import DetectionContainer, { MetricsIDs } from "../../../detectionContainer";
import Chart from "../../chart/chart";
import { getScatterOption } from "../../chart/options";
import SectionContainer from "../sectionContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      flex: 1,
      display: "flex",
      flexDirection: "column",
      position: "relative",
    },
    chartTitle: {
      position: "absolute",
      top: "50%",
      transform: "translate(0, -50%)",
      writingMode: "vertical-lr",
      color: "#666",
      fontSize: 12,
      letterSpacing: "4px",
    },
  }),
);

const DealIntervalChart: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const { year, quarter } = DetectionContainer.useContainer();
  const { selectedVertical } = SectionContainer.useContainer();
  const [reactEcharts, setReactEcharts] = useState<ReactEcharts>();
  const [data, setData] = useState<Array<Array<string | number>>>([]);
  const [highlightIndex, setHighlightIndex] = useState<number>();

  function chartDataHandler(data: Array<Array<string | number>>): EChartsOption {
    if (!data) {
      setData([]);
      return {};
    }
    const option = getScatterOption();

    if (data.length) {
      setData(data);
      try {
        option.dataset = {
          source: data,
        };
      } catch (error) {
        //
      }
    }

    return option;
  }

  useEffect(() => {
    if (selectedVertical) {
      try {
        if (reactEcharts) {
          const getEchartsInstance = _.get(reactEcharts, "getEchartsInstance");
          if (getEchartsInstance) {
            const instance = getEchartsInstance.call(reactEcharts);
            if (instance) {
              const dispatchAction = _.get(instance, "dispatchAction");
              if (dispatchAction) {
                if (highlightIndex !== undefined) {
                  dispatchAction.call(instance, {
                    type: "downplay",
                    // 可选，系列 index，可以是一个数组指定多个系列
                    seriesIndex: 0,
                    // 可选，数据的 index
                    dataIndex: highlightIndex,
                  });
                }
                const dataIndex = data.findIndex((v) => v[2] === selectedVertical.verticalID);
                if (dataIndex !== -1) {
                  dispatchAction.call(instance, {
                    type: "highlight",
                    // 可选，系列 index，可以是一个数组指定多个系列
                    seriesIndex: 0,
                    // 可选，数据的 index
                    dataIndex: dataIndex,
                  });
                  setHighlightIndex(dataIndex);
                }
              }
            }
          }
        }
      } catch (error) {
        //
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedVertical, reactEcharts, data]);

  return (
    <div className={classes.root}>
      <Typography className={classes.chartTitle}>融资两轮及以上企业数</Typography>
      <Chart
        metricsID={MetricsIDs.DealInterval}
        dataHandle={chartDataHandler}
        quarter={quarter}
        year={year}
        getReactEcharts={(echarts): void => {
          setReactEcharts(echarts);
        }}
      />
    </div>
  );
};

export default DealIntervalChart;
