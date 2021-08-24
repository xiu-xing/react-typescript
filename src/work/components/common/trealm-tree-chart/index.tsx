/* eslint-disable react-hooks/rules-of-hooks */
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import Tippy from "@tippyjs/react";
import { ParentSize } from "@visx/responsive";
import React, { useState } from "react";
import { ActionModel, onAction as onActionNext } from "../../../models/action/action-next";
import { GraphTreeNodeModel } from "../../../models/graph/graph";
import theme from "../../../theme";
import TreeChart, { TreeChartNodeData } from "../chart-next/graph-chart/tree-chart";
import { getMaxLevel } from "../chart-next/graph-chart/tree-chart/utils";
import NodeModalContent from "./node-modal-content";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "100vh",
      width: "100vw",
      position: "fixed",
      zIndex: 9999,
      top: 0,
      left: 0,
      backgroundColor: "#fff",
    },
  }),
);
interface TrealmTreeChartProps {
  treeChartNode: TreeChartNodeData;
  treeNodeModals: GraphTreeNodeModel[];
  rootWidth: number;
}

const NODE_VERTICAL_SPACING = 48;
const NODE_HORIZONTAL_SPACING = 68;
const DEFAULT_NODE_WIDTH = 36;
const DEFAULT_NODE_HEIGHT = 40;
const DEFAULT_OFFSET_X = 36;

const TrealmTreeChart: React.FunctionComponent<TrealmTreeChartProps> = (props) => {
  const reg = new RegExp("=", "g");
  const primaryColor = theme.palette.primary.main;
  const { treeChartNode, treeNodeModals, rootWidth } = props;
  const [activeNodeId, setActiveNodeId] = useState<string>();

  const [draggable, setDraggable] = useState(true);

  const DataLength = (str: string) => {
    let intLength = 0;
    for (let i = 0; i < str.length; i++) {
      if (str.charCodeAt(i) < 0 || str.charCodeAt(i) > 255) intLength = intLength + 2;
      else intLength = intLength + 1;
    }
    return intLength;
  };

  let nodeWidth = DEFAULT_NODE_WIDTH;
  treeNodeModals.forEach((node) => {
    const length = DataLength(node.label) * 7 + 28;
    if (nodeWidth < length) nodeWidth = length;
  });

  let offsetX = DEFAULT_OFFSET_X;
  if (rootWidth) {
    const level = getMaxLevel(treeChartNode);
    const svgWidth = level * nodeWidth + (level - 1) * NODE_VERTICAL_SPACING;
    const x = (rootWidth - svgWidth) / 2;
    if (x > 0) offsetX = x;
  }

  return (
    <ParentSize>
      {(parentSize) =>
        parentSize.ref &&
        parentSize.width &&
        parentSize.height && (
          <TreeChart
            width={parentSize.width}
            height={parentSize.height}
            x={offsetX}
            draggable={draggable}
            nodeVerticalSpacing={NODE_VERTICAL_SPACING}
            nodeHorizontalSpacing={NODE_HORIZONTAL_SPACING}
            nodeHeight={DEFAULT_NODE_HEIGHT}
            nodeWidth={nodeWidth}
            showSourceArrow
            sourceArrowDirection="left"
            highlightRelationLink
            highlightLinkAnimationDirection="forward"
            direction="right"
            data={treeChartNode}
            nodeComponent={(node) => {
              const nodeInfo = treeNodeModals.find((modal) => modal.id === node.data.id);
              const id = btoa(node.data.id).replace(reg, "");
              const activated = id === activeNodeId;
              let color = activated ? primaryColor : "#999";
              color = nodeInfo?.isHighlight ? primaryColor : color;

              return (
                <>
                  <Tippy
                    interactive
                    appendTo={document.body}
                    placement="bottom"
                    delay={[500, 0]}
                    popperOptions={{
                      strategy: "fixed",
                    }}
                    content={
                      nodeInfo?.modal ? <NodeModalContent modal={nodeInfo?.modal} activated={activated} /> : <></>
                    }
                    onShow={() => setDraggable(false)}
                    onHidden={() => setDraggable(true)}
                  >
                    <svg
                      onClick={onActionNext(ActionModel.fromJSON(nodeInfo?.action))}
                      onMouseEnter={() => setActiveNodeId(id)}
                      onMouseLeave={() => setActiveNodeId(undefined)}
                    >
                      <rect
                        width={nodeWidth - 4}
                        height={DEFAULT_NODE_HEIGHT - 4}
                        x={1}
                        y={1}
                        fill="#fff"
                        stroke={color}
                        rx="4px"
                      />
                      <text y={25} x={12}>
                        {node.data.name}
                      </text>
                    </svg>
                  </Tippy>
                </>
              );
            }}
          />
        )
      }
    </ParentSize>
  );
};

export default TrealmTreeChart;
