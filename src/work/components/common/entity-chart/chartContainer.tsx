import { EChartsOption } from "echarts-for-react";
import { useEffect, useState } from "react";
import { useClient } from "urql";
import { ChartDocument, EntityType, FilterInput } from "../../../generated/graphql";
import { ChartDataModel } from "../chart/common-chart/models/chartData";

interface ChartInitialState {
  id: string;
  entityType: EntityType;
  entityId: string;
  filterInputs?: FilterInput[];
  dataHandler?: (data: ChartDataModel) => EChartsOption | undefined;
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
function useChart(initialState: ChartInitialState = { id: "", entityType: EntityType.Organization, entityId: "" }) {
  // const dataHandler =
  const [id] = useState<string>(initialState.id);
  const [entityType] = useState<EntityType>(initialState.entityType);
  const [entityId] = useState<string>(initialState.entityId);

  const [chartOption, setChartOption] = useState<EChartsOption>({});
  const client = useClient();
  function executeChartDataQuery() {
    client
      .query(ChartDocument, {
        chartID: id,
        entityType: entityType,
        entityID: entityId,
        filter: initialState.filterInputs,
      })
      .toPromise()
      .then((res) => {
        if (res.data && initialState.dataHandler) {
          const chartData = res.data.chartData;
          const newOption = initialState.dataHandler(
            chartData ? ChartDataModel.fromJSON(JSON.parse(chartData)) : new ChartDataModel(),
          );
          newOption && setChartOption(newOption);
        }
      });
  }

  useEffect(() => {
    executeChartDataQuery();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id, entityType, entityId, initialState.filterInputs]);

  return {
    chartOption,
    // data,
    executeChartDataQuery,
  };
}

export default useChart;
