import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { EChartsOption } from "echarts-for-react";
import _ from "lodash";
import React, { ReactNode, useEffect, useState } from "react";
import { FilterInput, SqlOperator } from "../../../../generated/graphql";
import { ChartDataModel } from "../../../common/chart/common-chart/models/chartData";
import EntityChart from "../../../common/entity-chart/entity-chart";
import { EntityChartType } from "../../../common/entity-chart/entity-chart-display";
import ChartFilter, { ChartFilterType } from "./components/filter";
import { ChartFilterItemValueType } from "./components/filter-item";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      height: "100%",
      display: "flex",
      flexDirection: "column",
    },
    header: {
      display: "flex",
      flexDirection: "row",
    },
    spacer: {
      flexGrow: 1,
    },
    chart: {
      flexGrow: 1,
      padding: 16,
    },
    filters: {
      zIndex: 1000,
      position: "absolute",
      display: "grid",
      gridAutoFlow: "column",
      gridAutoColumns: "max-content",
      columnGap: 24,
      right: 100,
      top: 18,
    },
  }),
);

interface ChartProps {
  chartId: string;
  type?: EntityChartType;
  dataHandler?: (data: ChartDataModel) => EChartsOption | undefined;
  title?: string;
  subtitle?: ReactNode;
  trailing?: ReactNode;
  filters?: ChartFilterType[];
}

const Chart: React.FunctionComponent<ChartProps> = ({
  chartId,
  type,
  dataHandler,
  title,
  subtitle,
  trailing,
  filters,
}) => {
  const classes = useStyles();
  const [filterValueMap, setFilterValueMap] = useState<Map<string, ChartFilterItemValueType>>(new Map());
  const [filterInputs, setFilterInputs] = useState<FilterInput[]>([]);

  useEffect(() => {
    setFilterInputs(
      Array.from(filterValueMap.keys()).map((key) => {
        const filterValue = filterValueMap.get(key);
        return {
          filterID: key,
          operator: filterValue?.operator ?? SqlOperator.Any,
          values: filterValue?.value ?? [],
        };
      }),
    );
  }, [filterValueMap]);

  return (
    <>
      {filters && (
        <div className={classes.filters}>
          {filters.map((filter, index) => (
            <ChartFilter
              key={index}
              type={filter}
              onValueChange={(value) =>
                setFilterValueMap((oldValue) => {
                  const newValue = _.clone(oldValue);
                  switch (filter) {
                    case "year":
                      newValue.set("filter_id_year", value);
                      break;
                    case "dealType":
                      newValue.set("filter_id_deal_type", value);
                      break;
                    case "region":
                      newValue.set("filter_id_region", value);
                      break;
                  }
                  return newValue;
                })
              }
            />
          ))}
        </div>
      )}
      <div className={classes.header}>
        {title && <Typography>{title}</Typography>}
        {subtitle && subtitle}
        <div className={classes.spacer} />
        {trailing && trailing}
      </div>
      <EntityChart
        className={classes.chart}
        id={chartId}
        type={type}
        dataHandler={dataHandler}
        filterInputs={filterInputs}
      />
    </>
  );
};

export default Chart;
