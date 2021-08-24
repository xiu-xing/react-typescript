import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Group } from "@visx/group";
import { hierarchy, Tree } from "@visx/hierarchy";
import { HierarchyPointLink, HierarchyPointNode } from "@visx/hierarchy/lib/types";
import { Zoom } from "@visx/zoom";
import _ from "lodash";
import React, { ReactNode, useState } from "react";
import TreeChartLink from "./link";
import TreeChartNode from "./node";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
  }),
);

const NODE_HEIGHT = 32;
const NODE_WIDTH = 258;
const NODE_HORIZONTAL_SPACING = 32;
const NODE_VERTICAL_SPACING = 32;
export type TreeChartArrowDirection = "top" | "bottom" | "left" | "right";
export type TreeChartDirection = "top" | "bottom" | "right";
export type TreeChartLinkHighlightAnimationDirection = "forward" | "backward";

export interface TreeChartNodeData {
  id: string;
  name: string;
  children?: this[];
}

interface TreeChartProps {
  data: TreeChartNodeData;
  draggable?: boolean;
  x?: number;
  y?: number;
  width?: number;
  height?: number;
  nodeHeight?: number;
  nodeWidth?: number;
  nodeHorizontalSpacing?: number;
  nodeVerticalSpacing?: number;
  direction?: TreeChartDirection;
  showSourceArrow?: boolean;
  showTargetArrow?: boolean;
  sourceArrowDirection?: TreeChartArrowDirection;
  targetArrowDirection?: TreeChartArrowDirection;
  highlightRelationLink?: boolean;
  highlightLinkAnimationDirection?: TreeChartLinkHighlightAnimationDirection;
  nodeComponent?: (node: HierarchyPointNode<TreeChartNodeData>) => ReactNode;
}

const TreeChart: React.FunctionComponent<TreeChartProps> = ({
  data,
  draggable = true,
  x,
  y,
  width = 500,
  height = 500,
  nodeHeight = NODE_HEIGHT,
  nodeWidth = NODE_WIDTH,
  nodeHorizontalSpacing = NODE_HORIZONTAL_SPACING,
  nodeVerticalSpacing = NODE_VERTICAL_SPACING,
  direction = "right",
  showSourceArrow = false,
  showTargetArrow = false,
  sourceArrowDirection = "left",
  targetArrowDirection = "right",
  highlightRelationLink = false,
  highlightLinkAnimationDirection = "forward",
  nodeComponent,
}) => {
  let processedX = width / 2;
  let processedY = height / 2;
  if (x != undefined) {
    processedX = x;
  }
  if (y != undefined) {
    processedY = y;
  }
  const classes = useStyles();
  const [highlightNode, setHighlightNode] = useState<HierarchyPointNode<TreeChartNodeData>>();
  const [selectedNode, setSelectedNode] = useState<TreeChartNodeData>();

  function getTreeSize(): [number, number] {
    return [width, height];
  }

  function getNodeSize(): [number, number] {
    switch (direction) {
      case "top":
      case "bottom":
        return [nodeWidth, nodeHeight + nodeVerticalSpacing];
      case "right":
        return [nodeHeight, nodeWidth + nodeHorizontalSpacing];
    }
  }

  const treeSize = getTreeSize();
  const nodeSize = getNodeSize();

  function isRelatedLink(link: HierarchyPointLink<TreeChartNodeData>): boolean {
    if (_.isEqual(link.source.data, highlightNode?.data)) {
      return true;
    }
    if (_.isEqual(link.target.data, highlightNode?.data)) {
      if (_.isEqual(link.source.data, highlightNode?.parent?.data)) {
        return true;
      }
    }
    return false;
  }

  function reorderLinks(links: HierarchyPointLink<TreeChartNodeData>[]): HierarchyPointLink<TreeChartNodeData>[] {
    const unhighlightLinks = links.filter((link) => !isRelatedLink(link));
    const highlightLinks = links.filter((link) => isRelatedLink(link));
    return [...unhighlightLinks, ...highlightLinks];
  }

  return (
    <Zoom
      width={width}
      height={height}
      scaleXMax={2}
      scaleXMin={0.5}
      scaleYMax={2}
      scaleYMin={0.5}
      transformMatrix={{
        scaleX: 1,
        scaleY: 1,
        skewX: 0,
        skewY: 0,
        translateX: processedX,
        translateY: processedY,
      }}
    >
      {(zoom) => (
        <svg
          width={width}
          height={height}
          style={{ cursor: zoom.isDragging ? "grabbing" : "grab" }}
          onTouchStart={draggable ? zoom.dragStart : undefined}
          onTouchMove={draggable ? zoom.dragMove : undefined}
          onTouchEnd={draggable ? zoom.dragEnd : undefined}
          onMouseDown={draggable ? zoom.dragStart : undefined}
          onMouseMove={draggable ? zoom.dragMove : undefined}
          onMouseUp={draggable ? zoom.dragEnd : undefined}
          onMouseLeave={() => {
            if (zoom.isDragging) zoom.dragEnd();
          }}
        >
          <g transform={zoom.toString()}>
            <Tree<TreeChartNodeData>
              root={hierarchy(data)}
              size={treeSize}
              left={0}
              top={0}
              separation={() => {
                switch (direction) {
                  case "bottom":
                  case "top":
                    return 1 + nodeHorizontalSpacing / nodeWidth;
                  case "right":
                    return 1 + nodeVerticalSpacing / nodeHeight;
                }
              }}
              nodeSize={nodeSize}
            >
              {(tree) => (
                <Group>
                  {reorderLinks(tree.links()).map((link, index) => (
                    // eslint-disable-next-line react/jsx-key
                    <TreeChartLink
                      key={`link-${index}`}
                      link={link}
                      nodeWidth={nodeWidth}
                      nodeHeight={nodeHeight}
                      chartWidth={treeSize[0]}
                      chartHeight={treeSize[1]}
                      chartDirection={direction}
                      isHighlight={highlightRelationLink ? isRelatedLink(link) : false}
                      highlightAnimationDirection={highlightLinkAnimationDirection}
                      showSourceArrow={showSourceArrow}
                      sourceArrowDirection={sourceArrowDirection}
                      showTargetArrow={showTargetArrow}
                      targetArrowDirection={targetArrowDirection}
                    />
                  ))}
                  {tree.descendants().map((node, index) => {
                    return (
                      // eslint-disable-next-line react/jsx-key
                      <TreeChartNode
                        key={`node-${index}`}
                        node={node}
                        width={nodeWidth}
                        height={nodeHeight}
                        chartWidth={treeSize[0]}
                        chartHeight={treeSize[1]}
                        chartDirection={direction}
                        onMouseEnter={() => {
                          setHighlightNode(node);
                        }}
                        onMouseLeave={() => {
                          setHighlightNode(undefined);
                        }}
                        component={nodeComponent ? (componentNode) => nodeComponent(componentNode) : undefined}
                      />
                    );
                  })}
                </Group>
              )}
            </Tree>
          </g>
        </svg>
      )}
    </Zoom>
  );
};

export default TreeChart;
