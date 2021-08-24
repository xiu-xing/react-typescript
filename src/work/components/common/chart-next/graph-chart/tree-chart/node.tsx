import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Group } from "@visx/group";
import { HierarchyPointNode } from "@visx/hierarchy/lib/types";
import _ from "lodash";
import React, { ReactNode } from "react";
import { TreeChartDirection, TreeChartNodeData } from ".";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
  }),
);

interface TreeChartNodeProps extends React.SVGProps<SVGGElement> {
  node: HierarchyPointNode<TreeChartNodeData>;
  width: number;
  height: number;
  chartWidth: number;
  chartHeight: number;
  chartDirection?: TreeChartDirection;
  component?: (node: HierarchyPointNode<TreeChartNodeData>) => ReactNode;
}

const TreeChartNode: React.FunctionComponent<TreeChartNodeProps> = ({
  node,
  width,
  height,
  chartWidth,
  chartHeight,
  chartDirection = "right",
  component,
  onMouseEnter,
  onMouseLeave,
}) => {
  const classes = useStyles();

  function processNode(node: HierarchyPointNode<TreeChartNodeData>): HierarchyPointNode<TreeChartNodeData> {
    const newNode = _.clone(node);
    switch (chartDirection) {
      case "bottom":
        newNode.x = node.y;
        newNode.y = node.x;
        break;
      case "top":
        newNode.x = chartWidth - node.y + height / 2 + 2;
        newNode.y = node.x;
        break;
      default:
        break;
    }
    return newNode;
  }

  const processedNode = processNode(node);

  return (
    <Group
      key={`node-${processedNode.x}-${processedNode.y}`}
      className={classes.root}
      top={processedNode.x}
      left={processedNode.y}
      onMouseEnter={onMouseEnter}
      onMouseLeave={onMouseLeave}
    >
      <rect x={0} y={0} fill="#fff" width={width} height={height} />
      {component ? (
        component(processedNode)
      ) : (
        <>
          <rect
            x={0}
            y={0}
            width={width}
            height={height}
            fill="#fff"
            stroke={"#D8E0EB"}
            strokeWidth={1}
            rx={4}
            ry={4}
          />
          <text
            x={width / 2}
            y={height / 2}
            style={{
              userSelect: "none",
            }}
            fontSize={12}
            textAnchor="middle"
            dominantBaseline="middle"
            fill="#666666"
          >
            {processedNode.data.name}
          </text>
        </>
      )}
    </Group>
  );
};

export default TreeChartNode;
