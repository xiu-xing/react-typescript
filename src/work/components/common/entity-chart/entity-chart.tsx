import { createStyles, makeStyles } from "@material-ui/core";
import clsx from "clsx";
import { EChartsOption } from "echarts-for-react";
import React, { ReactNode, useContext } from "react";
import { createContainer } from "unstated-next";
import { EntityIdContext, EntityTypeContext } from "../../../containers/entityContainer";
import { EntityType, FilterInput } from "../../../generated/graphql";
import { ChartDataModel } from "../chart/common-chart/models/chartData";
import useChart from "./chartContainer";
import EntityChartDisplay, { EntityChartDisplayProps } from "./entity-chart-display";

export const EntityChartContainer = createContainer(useChart);

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "row",
    },
  }),
);

export interface ChartActiveItem {
  data: Array<string | number>;
}

interface EntityProps extends EntityChartDisplayProps {
  id: string;
  style?: React.CSSProperties;
  className?: string;
  filterInputs?: FilterInput[];
  dataHandler?: (data: ChartDataModel) => EChartsOption | undefined;
}

const EntityChart: React.FunctionComponent<EntityProps> = (props) => {
  const classes = useStyles();
  // const { isRimeActive } = UserContainer.useContainer();
  const entityId = useContext(EntityIdContext);
  const entityType = useContext(EntityTypeContext) as EntityType;
  const { id, className, style, filterInputs, dataHandler, ...leftProps } = props;

  function contentComponent(): ReactNode {
    // if (!isRimeActive) {
    //   return null;
    // }
    return (
      <div className={clsx(classes.root, className)} style={style}>
        <EntityChartContainer.Provider
          initialState={{
            id: id,
            filterInputs,
            entityId: entityId,
            entityType: entityType as EntityType,
            dataHandler: dataHandler,
          }}
        >
          <EntityChartDisplay {...leftProps} />
        </EntityChartContainer.Provider>
      </div>
    );
  }

  return <>{contentComponent()}</>;
};

export default EntityChart;
