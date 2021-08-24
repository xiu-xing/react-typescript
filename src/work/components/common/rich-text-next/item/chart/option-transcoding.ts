import { isArray } from "lodash";
import { RichTextPayload } from "../../../../../models/richText/index-next";

export function option(payload: RichTextPayload): unknown {
  const baseOption = {
    grid: {
      left: 0,
      right: 0,
      top: 0,
      height: "16px",
      width: "auto",
    },
  };

  switch (payload.chartType) {
    case "horizontal_stack":
      baseOption["dataset"] = {
        source: [
          ["series", "a", "b"],
          ["data", ...payload.chartData],
        ],
      };
      baseOption["graphic"] = {
        elements: [
          {
            gridIndex: 0,
            type: "text",
            left: 0,
            top: 20,
            style: {
              text: payload.labels[0],
              fontSize: "10px",
            },
          },
          {
            type: "text",
            right: 0,
            top: 20,
            style: {
              text: payload.labels[1],
              fontSize: "10px",
            },
          },
        ],
      };
      baseOption["xAxis"] = {
        show: false,
        max: (v: any) => {
          return v.max;
        },
      };
      baseOption["yAxis"] = {
        show: false,
        type: "category",
      };
      baseOption["series"] = [
        {
          type: "bar",
          stack: "total",
          color: "#4F709B",
        },
        {
          type: "bar",
          stack: "total",
          color: "#5192B8",
        },
      ];
      break;
    case "trending":
      baseOption["grid"] = {
        left: 4,
        right: 4,
        top: 2,
        height: "16px",
        width: "auto",
      };
      baseOption["graphic"] = {
        elements: [
          {
            gridIndex: 0,
            type: "text",
            left: 0,
            top: 24,
            style: {
              text: payload.labels[0],
              fontSize: "10px",
            },
          },
          {
            type: "text",
            right: 0,
            top: 24,
            style: {
              text: payload.labels[1],
              fontSize: "10px",
            },
          },
        ],
      };
      baseOption["xAxis"] = {
        show: false,
        type: "category",
        boundaryGap: false,
      };
      baseOption["yAxis"] = {
        show: false,
      };
      baseOption["series"] = [
        {
          type: "line",
          color: "#4F709B",
          showAllSymbol: true,
          smooth: true,
          data: payload.chartData.map((data) => {
            return {
              value: data,
              itemStyle: {
                opacity: 0,
              },
              // ...(index == payload.chartData.length - 1
              //   ? {
              //       symbol: "triangle",
              //       symbolSize: 6,
              //       symbolRotate: 270,
              //     }
              //   : {
              //       itemStyle: {
              //         opacity: 0,
              //       },
              //     }),
            };
          }),
        },
      ];
      break;
    case "bar":
      baseOption["grid"] = {
        left: 4,
        right: 4,
        top: 0,
        height: "20px",
        width: "auto",
      };
      baseOption["dataset"] = {
        source: [
          ["label", "count"],
          ...payload.chartData.map((data) => {
            if (isArray(data)) {
              return [data[0], data[1]];
            }
            return ["未知", 0];
          }),
        ],
      };
      baseOption["xAxis"] = {
        show: true,
        type: "category",
        axisTick: {
          show: false,
        },
        axisLabel: {
          fontSize: "10px",
          interval: 0,
          color: "#000",
          margin: 4,
        },
        axisLine: {
          show: false,
        },
        lineStyle: {
          opacity: 0,
        },
      };
      baseOption["yAxis"] = {
        show: false,
      };
      baseOption["series"] = [
        {
          type: "bar",
          barGap: "4px",
          color: "#4F709B",
        },
      ];
      break;
    default:
      break;
  }
  return baseOption;
}
