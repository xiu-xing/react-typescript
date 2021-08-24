import G6, { Graph } from "@antv/g6";
import { Box, createStyles, makeStyles } from "@material-ui/core";
import { MagnifyMinus, MagnifyPlus } from "mdi-material-ui";
import React, { useEffect, useRef } from "react";
import { ActionModel, ActionType } from "../../../../../models/action/action-next";
import { registerEdgeStyle, registerNodeStyle } from "../../../../common/chart-next/graph-chart/tree-node-chart/style";

const useStyles = makeStyles(() =>
  createStyles({
    chartDiv: {
      width: "100%",
      height: "calc(100vh - 48px)",
      position: "relative",
    },
    itemBox: {
      backgroundColor: "#F5F6F9",
      width: 30,
      height: 30,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      borderRadius: 2,
    },
    icon: {
      fontSize: 22,
      color: "rgba(0, 0, 0, 0.54)",
    },
    buttonGroup: {
      display: "flex",
      position: "absolute",
      right: 16,
      top: 16,
    },
  }),
);

interface TreeNodeChartProps {
  chartData?: string;
}

const TreeNodeChart: React.FunctionComponent<TreeNodeChartProps> = (props) => {
  const classes = useStyles();
  const rootRef = useRef<HTMLDivElement>(null);
  const ref = useRef<HTMLDivElement>(null);
  const graphRef = useRef<Graph>();

  registerNodeStyle();
  registerEdgeStyle();

  function initG6TreeNodeChart() {
    if (ref.current && !graphRef.current && props.chartData) {
      graphRef.current = new G6.Graph({
        container: ref.current,
        layout: {
          type: "dagre",
          rankdir: "TB",
          nodesep: 55,
          ranksep: 30,
        },
        minZoom: 0.1,
        modes: {
          default: ["drag-canvas"],
        },
        defaultNode: {
          type: "tree-node-rect",
        },
        defaultEdge: {
          type: "tree-node-edge",
        },
        nodeStateStyles: {
          hover: {
            stroke: "#4F709B",
            lineWidth: 2,
          },
        },
      });
      const jsonValue = JSON.parse(props.chartData);
      graphRef.current.read(jsonValue["tree"]);

      graphRef.current.on("node:touchstart", (ev) => {
        const { item } = ev;
        if (!item || !graphRef.current) return;
        const model = item.getModel();
        const nodeAction = ActionModel.fromJSON(model["action"]);

        if (nodeAction.type === ActionType.Profile) {
          if (nodeAction.args && "entity_id" in nodeAction.args && "entity_type" in nodeAction.args) {
            window.open(
              `js://webview/profile?id=${nodeAction.args["entity_id"]}&type=${nodeAction.args["entity_type"]}`,
            );
          }
        }
      });

      graphRef.current.on("afterrender", () => {
        if (graphRef.current) {
          const findNode = graphRef.current.find("node", (node) => {
            return node.get("model").is_highlight === true;
          });
          if (findNode) {
            graphRef.current.focusItem(findNode, true);
            graphRef.current.translate(0, -100);
          }
        }
      });
    }
  }

  function zoomOutHandle() {
    if (!graphRef.current) return;
    const currentZoom = graphRef.current.getZoom();
    const x = (rootRef.current?.clientWidth ?? 0) / 2;
    if (currentZoom < 1) {
      graphRef.current.zoomTo(currentZoom + 0.2, { x: x, y: 250 });
    } else if (currentZoom < 10) {
      graphRef.current.zoomTo(currentZoom + 1, { x: x, y: 250 });
    }
  }
  function zoomInHandle() {
    if (!graphRef.current) return;
    const currentZoom = graphRef.current.getZoom();
    const x = (rootRef.current?.clientWidth ?? 0) / 2;
    if (currentZoom > 1) {
      graphRef.current.zoomTo(currentZoom - 1, { x: x, y: 250 });
    } else if (currentZoom >= 0.3) {
      graphRef.current.zoomTo(currentZoom - 0.2, { x: x, y: 250 });
    }
  }

  function resize() {
    if (graphRef.current && rootRef.current) {
      const width = rootRef.current.clientWidth;
      const height = rootRef.current.clientHeight;
      graphRef.current.changeSize(width, height);
    }
  }

  useEffect(() => {
    window.addEventListener("resize", () => resize());
    return (): void => {
      window.removeEventListener("resize", () => resize());
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [graphRef]);

  useEffect(() => {
    initG6TreeNodeChart();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [ref]);

  useEffect(() => {
    resize();
  }, []);

  return (
    <>
      <Box className={classes.buttonGroup}>
        <Box className={classes.itemBox} style={{ marginRight: 24 }} onClick={zoomOutHandle}>
          <MagnifyPlus className={classes.icon} />
        </Box>
        <Box className={classes.itemBox} onClick={zoomInHandle}>
          <MagnifyMinus className={classes.icon} />
        </Box>
      </Box>
      <div className={classes.chartDiv} ref={rootRef}>
        <div ref={ref} className={classes.chartDiv} />
      </div>
    </>
  );
};

export default TreeNodeChart;
