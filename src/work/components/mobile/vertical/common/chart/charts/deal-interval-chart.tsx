import { useTheme } from "@material-ui/core";
import ReactEcharts, { EChartsOption } from "echarts-for-react";
import _ from "lodash";
import React, { useEffect, useState } from "react";
import { ChartProps } from "..";
import Chart from "../../../../../verticals/detection/components/chart/chart";
import { getScatterOption } from "../../../../../verticals/detection/components/chart/options";
import { MetricsIDs } from "../../../../../verticals/detection/detectionContainer";

const DealIntervalChart: React.FC<ChartProps> = (props) => {
  const { year, quarter, verticalId, mini } = props;
  const [reactEcharts, setReactEcharts] = useState<ReactEcharts>();
  const [data, setData] = useState<Array<Array<string | number>>>([]);
  const [highlightIndex, setHighlightIndex] = useState<number>();
  const theme = useTheme();

  function chartDataHandler(data: Array<Array<string | number>>): EChartsOption {
    if (!data) {
      setData([]);
      return {};
    }
    const option = getScatterOption();

    option.grid.bottom = "10%";
    option.grid.right = "4%";

    if (mini) {
      option.grid = {
        top: "4%",
        right: 10,
        bottom: "24%",
        left: 46,
      };

      option.tooltip = {
        show: false,
      };
    }

    option.yAxis.name = "融\n资\n两\n轮\n及\n以\n上\n企\n业\n数";

    option.xAxis.name = "融资时间间隔";

    option.yAxis.nameRotate = 0;
    option.yAxis.nameLocation = "middle";

    option.xAxis.nameLocation = "middle";

    option.yAxis.nameGap = 32;

    option.xAxis.nameGap = 32;

    option.yAxis.nameTextStyle = {
      fontFamily: theme.typography.fontFamily,
      color: "#666",
    };

    option.xAxis.nameTextStyle = {
      fontFamily: theme.typography.fontFamily,
      color: "#666",
    };

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
    if (verticalId) {
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
                const dataIndex = data.findIndex((v) => v[2] === verticalId);
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
  }, [verticalId, reactEcharts, data]);

  return (
    <Chart
      metricsID={MetricsIDs.DealInterval}
      dataHandle={chartDataHandler}
      quarter={quarter}
      year={year}
      height="100%"
      getReactEcharts={(echarts): void => {
        setReactEcharts(echarts);
      }}
      showSkeleton={false}
    />
  );
};

export default DealIntervalChart;
