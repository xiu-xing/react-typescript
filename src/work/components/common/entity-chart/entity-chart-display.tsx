import { Skeleton } from "@material-ui/lab";
import ReactEcharts from "echarts-for-react";
import _ from "lodash";
import React, { ReactNode, useEffect, useState } from "react";
import CommonChart from "../chart/common-chart/common-chart";
import { EntityChartContainer } from "./entity-chart";

export type EntityChartType = "bar" | "map" | "pie" | "candlestick";

export interface EntityChartDisplayProps {
  download?: boolean;
  height?: string;
  getReactEcharts?: (chart: ReactEcharts) => void;
  placeholder?: string;
  showPlaceholder?: boolean;
  type?: EntityChartType;
  defaultXAxis?: string[];
}

const EntityChartDisplay: React.FunctionComponent<EntityChartDisplayProps> = (props) => {
  const { chartOption: option } = EntityChartContainer.useContainer();
  const [reactEcharts, setReactEcharts] = useState<ReactEcharts>();

  const { defaultXAxis, download, placeholder, showPlaceholder, type = "bar" } = props;

  function chartResize(): void {
    if (reactEcharts) {
      const getEchartsInstance = _.get(reactEcharts, "getEchartsInstance");
      if (getEchartsInstance) {
        const chartInstance = getEchartsInstance.call(reactEcharts);
        const echartsResize = _.get(chartInstance, "resize");
        echartsResize.call?.(chartInstance);
      }
    }
  }

  useEffect(() => {
    if (reactEcharts) {
      window.addEventListener("resize", chartResize);
    }
    return (): void => {
      window.removeEventListener("resize", chartResize);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [reactEcharts]);

  function contentComponent(): ReactNode {
    if (option.series) {
      if (option?.dataset?.source?.length !== 0) {
        if (download) {
          if (!option.toolbox) {
            option.toolbox = {
              show: true,
              right: "8%", //grid 的默认左边距
              feature: {
                saveAsImage: {
                  show: true,
                },
              },
            };
          }
        }
        option.graphic = [];

        return (
          <div style={{ flexGrow: 1 }}>
            <CommonChart
              options={option}
              height={props.height}
              getReactEcharts={(echarts: ReactEcharts): void => {
                setReactEcharts(echarts);
                props.getReactEcharts?.(echarts);
              }}
            />
          </div>
        );
      }
      if (showPlaceholder === true || showPlaceholder === undefined) {
        // 无数据显示，默认显示
        switch (type) {
          case "bar":
          case "candlestick":
            option.xAxis = {
              type: "category",
              data:
                defaultXAxis ??
                _.range(9)
                  .map((value) => {
                    const year: number = new Date().getFullYear();
                    return year - value;
                  })
                  .reverse(),
              axisLine: {
                show: true,
              },
            };
            option.yAxis = {
              type: "value",
              splitNumber: 5,
              min: 0,
              max: 500,
              axisLine: { show: false },
              axisTick: { show: false },
            };
            break;
          case "map":
            break;
          case "pie":
            break;
        }

        option.graphic = [
          {
            type: "group",
            bounding: "all",
            left: "center",
            top: "middle",
            z: 100,
            children: [
              type === "pie"
                ? {
                    type: "circle",
                    top: "center",
                    left: "center",
                    z: 99,
                    shape: {
                      r: 120,
                    },
                    style: {
                      fill: "#EEE",
                    },
                  }
                : undefined,
              {
                type: "text",
                left: "center",
                top: "center",
                z: 100,
                style: {
                  fill: "#999",
                  text: placeholder || "暂无数据",
                  fontSize: 18,
                },
              },
            ],
          },
        ];
      }

      return (
        <CommonChart
          options={option}
          height={props.height}
          getReactEcharts={(echarts: ReactEcharts): void => {
            if (echarts) {
              setReactEcharts(echarts);
              props.getReactEcharts?.(echarts);
            }
          }}
        />
      );
    }
    return <Skeleton style={{ margin: 16 }} variant="rect" height={"100%"} />;
  }

  return <>{contentComponent()}</>;
};

export default EntityChartDisplay;
