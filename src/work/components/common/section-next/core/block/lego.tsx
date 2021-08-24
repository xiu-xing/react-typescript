import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { FilterInputs, Func, FuncType, LegoBlock as LegoBlockModel } from "../../../../../generated/graphql";
import { useProfileEntity } from "../../../../profile/atoms";
import GraphChart from "../../../chart-next/graph-chart";
import DataTableNext from "../../../data-table-next";
import ProgressBar from "../../../section/progress-bar-section/progress-bar";
import StatementSheet from "../../../statement-sheet";
import DataBlockSection from "../../fetching/block/data-block-section";
import DataChart from "../../fetching/chart/data-charts-section/data-chart";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
    },
  }),
);

interface LegoBlockProp {
  model: LegoBlockModel;
  filters?: FilterInputs;
}

const LegoBlock: React.FunctionComponent<LegoBlockProp> = (props) => {
  const classes = useStyles();
  const [entity] = useProfileEntity();

  const switchBlock = (func: Func, index: number) => {
    switch (func.funcType) {
      case FuncType.FuncTypeTable: {
        return (
          <DataTableNext
            key={func.funcID + index}
            id={func.funcID}
            filter={props.filters}
            autoHeight
            tableBottom={{
              sectionName: props.model.name ?? "",
            }}
          />
        );
      }
      case FuncType.FuncTypeChart:
        return (
          <DataChart
            key={func.funcID + index}
            chartID={func.funcID}
            entityID={entity.id}
            entityType={entity.type}
            filterInputs={props.filters}
          />
        );
      case FuncType.FuncTypeDataBlock:
        return <DataBlockSection key={func.funcID + index} dataBlockId={func.funcID} />;
      case FuncType.FuncTypeGraph:
        return <GraphChart key={func.funcID + index} graphId={func.funcID} />;
      case FuncType.FuncTypeProgressBar:
        return <ProgressBar key={func.funcID + index} id={func.funcID} />;
      case FuncType.FuncTypeSheetData:
        return (
          <StatementSheet key={func.funcID + index} id={func.funcID} entityId={entity.id} entityType={entity.type} />
        );
      default:
        return null;
    }
  };

  return <div className={classes.root}>{props.model.funcs?.map((v, i) => switchBlock(v, i))}</div>;
};

export default LegoBlock;
