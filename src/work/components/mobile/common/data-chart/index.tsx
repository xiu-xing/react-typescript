import { get } from "lodash";
import React, { useMemo } from "react";
import ConfigContainer from "../../../../containers/configContainer";
import { EntityType, FilterInputs, NextPlatform, useChartQuery } from "../../../../generated/graphql";
import { ChartModel } from "../../../../models/chart/chart";
import { ChartDataModel } from "../../../../models/chart/chartData";
import { isJson } from "../../../../utils/tools";
import Chart from "../chart";

interface DataChartProps {
  id: string;
  entityId: string;
  entityType: EntityType;
  filterInputs?: FilterInputs;
  mini?: boolean;
  platform?: NextPlatform;
}

const DataChart: React.FC<DataChartProps> = (props) => {
  const { id, entityId, entityType, filterInputs, mini = false, platform = NextPlatform.PlatformWeb } = props;

  const { chartConfigs } = ConfigContainer.useContainer();

  const [{ data, fetching }] = useChartQuery({
    variables: {
      chartID: id,
      entityID: entityId,
      entityType: entityType,
      filters: filterInputs,
      platform: platform,
    },
  });

  const config = useMemo(() => ChartModel.fromJSON(chartConfigs?.[id]), [chartConfigs, id]);

  const chartComponent = useMemo(() => {
    const res: string = get(data, ["chart", "data"]);

    return (
      <Chart
        loading={fetching}
        mini={mini}
        data={isJson(res) ? ChartDataModel.fromJSON(JSON.parse(res)) : new ChartDataModel()}
        config={config}
      />
    );
  }, [data, config, fetching, mini]);

  return chartComponent;
};

export default DataChart;
