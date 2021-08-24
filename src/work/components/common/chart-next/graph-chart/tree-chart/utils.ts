import { TreeChartNodeData } from ".";

function haveChildrenNodes(nodes: TreeChartNodeData[][]): TreeChartNodeData[][] {
  const resultNodes: TreeChartNodeData[][] = [];

  nodes.forEach((node) => {
    node.forEach((child) => {
      if (child.children && child.children.length > 0) {
        resultNodes.push(child.children);
      }
    });
  });
  return resultNodes;
}

export function getMaxLevel(data: TreeChartNodeData): number {
  let level = 0;

  let nodes = [[data]] ?? [];
  while (nodes.length > 0) {
    level += 1;
    nodes = Array.from(haveChildrenNodes(nodes));
  }

  return level;
}

export function getMaxNodeWidth(data: TreeChartNodeData): number {
  let maxNodeWidth = 0;

  let nodes = [[data]] ?? [];
  while (nodes.length > 0) {
    const allNodes = nodes.reduce((previous, current) => {
      return [...previous, ...current];
    });
    if (allNodes.length > maxNodeWidth) {
      maxNodeWidth = allNodes.length;
    }
    nodes = Array.from(haveChildrenNodes(nodes));
  }
  return maxNodeWidth;
}
