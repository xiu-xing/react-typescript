/* eslint-disable react-hooks/rules-of-hooks */
import { ButtonBase, CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { Close } from "mdi-material-ui";
import React, { useEffect, useRef, useState } from "react";
import { useGraphQuery } from "../../../generated/graphql";
import { GraphModel, GraphTreeNodeModel } from "../../../models/graph/graph";
import { TreeChartNodeData } from "../../common/chart-next/graph-chart/tree-chart";
import TrealmTreeChart from "../../common/trealm-tree-chart";
import { GraphVariables } from "../../institution-next/container";
import CommonAccordionPlaceholder from "../accordion/components/placeholder";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "fixed",
      zIndex: 9999,
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      backgroundColor: "#fff",
    },
  }),
);
interface TreeChartData {
  graphVariables: GraphVariables;
  setGraphVariables: React.Dispatch<React.SetStateAction<GraphVariables | undefined>>;
}

const TreeChartData: React.FunctionComponent<TreeChartData> = (props) => {
  const classes = useStyles();
  const { graphVariables, setGraphVariables } = props;
  const [fetching, setFetching] = useState(true);
  const [treeChartNode, setTreeChartNode] = useState<TreeChartNodeData>();
  const [treeNodeModals, setTreeNodeModals] = useState<GraphTreeNodeModel[]>([]);
  const [nodata, setNodata] = useState(false);
  const [rootWidth, setRootWidth] = useState(0);

  const rootRef = useRef<HTMLDivElement>(null);

  const [graphResult] = useGraphQuery({
    variables: {
      origin: "BAPP_TREALM",
      graphID: graphVariables.graphId,
      entityID: graphVariables.entityId,
      entityType: graphVariables.entityType,
    },
  });

  useEffect(() => {
    if (rootRef.current) setRootWidth(rootRef.current.clientWidth);
  }, [rootRef]);

  useEffect(() => {
    setFetching(graphResult.fetching);

    if (graphResult.data?.graph?.data) {
      setNodata(false);
      const graphModel = GraphModel.fromJSON(JSON.parse(graphResult.data.graph.data) as never);
      setTreeNodeModals(graphModel.tree.nodes);
      setTreeChartNode(graphModel.treeChartNode());
      return;
    }

    setNodata(true);
    setTreeChartNode(undefined);
  }, [graphResult]);

  function content() {
    if (fetching) return <CircularProgress size={80} style={{ padding: "calc(50% - 40px)" }} />;

    if (nodata || !treeChartNode)
      return (
        <div style={{ paddingTop: "20%" }}>
          <CommonAccordionPlaceholder />
        </div>
      );

    return <TrealmTreeChart treeChartNode={treeChartNode} treeNodeModals={treeNodeModals} rootWidth={rootWidth} />;
  }

  return (
    <div className={classes.root} ref={rootRef}>
      <ButtonBase
        style={{ position: "absolute", right: 48, top: 48, borderRadius: "50%" }}
        onClick={() => {
          setGraphVariables(undefined);
        }}
      >
        <Close fontSize={"large"} />
      </ButtonBase>
      {content()}
    </div>
  );
};

export default TreeChartData;
