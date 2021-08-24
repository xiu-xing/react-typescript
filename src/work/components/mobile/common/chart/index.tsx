import { createStyles, makeStyles, Theme, useTheme } from "@material-ui/core/styles";
import React, { useMemo } from "react";
import ReactECharts from "echarts-for-react";
import { ChartDataModel } from "../../../../models/chart/chartData";
import { AxisesModel, ChartModel } from "../../../../models/chart/chart";
import { getOptionType, OptionType } from "./options/optionType";
import { getDataSetSource } from "./options/dataset";
import {
  commonDataZoom,
  commonGrid,
  commonLegend,
  commonPieLegend,
  commonRadar,
  commonTitle,
  commonToolbox,
  commonTooltip,
  commonVisualMap,
  commonWithoutDataGraphic,
  commonWithoutDataRadar,
  markLineGrid,
  wave,
} from "./options/common";
import { getSeriesByOptionType } from "./options/series";
import { getXAxis, getYAxis } from "./options/axes";
import { first } from "../../../../utils/tools";
import { handleBottomLayout } from "./bottomLayout";
import { LegendComponentOption } from "echarts";
import { radarTooltipFormatter, tooltipFormatter } from "./options/formatter";
import { cloneDeep, merge } from "lodash";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: "100% !important",
    },
  }),
);

interface ChartProps {
  config: ChartModel;
  data: ChartDataModel;
  loading?: boolean;
  theme?: string;
  mini?: boolean;
}

const Chart: React.FC<ChartProps> = (props) => {
  const classes = useStyles();
  const { data, config, loading, mini = false, theme = "rime" } = props;
  const MuiTheme = useTheme();
  const t = useMemo(() => ((data.dataset?.length ?? 0) > 0 ? theme : "grey"), [theme, data]);

  function initTooltip(chartConfig: ChartModel, data: ChartDataModel) {
    if (mini) return;
    if (chartConfig.series.length == 1) {
      const type = getOptionType(chartConfig.series[0]);
      if (type == OptionType.radar) {
        return {
          ...commonTooltip,
          formatter: radarTooltipFormatter(chartConfig.tooltipFormatter, chartConfig.series[0].indicators, data.unit),
        };
      }
      if (type == OptionType.bar) {
        return {
          ...commonTooltip,
          axisPointer: {
            type: "shadow",
          },
          trigger: "axis",
          formatter: tooltipFormatter(chartConfig.tooltipFormatter, data.unit),
        };
      }
      if (type == OptionType.line) {
        return {
          ...commonTooltip,
          axisPointer: {
            type: "line",
          },
          trigger: "axis",
          formatter: tooltipFormatter(chartConfig.tooltipFormatter, data.unit),
        };
      }
      return {
        ...commonTooltip,
        formatter: tooltipFormatter(chartConfig.tooltipFormatter, data.unit),
      };
    }
    if (chartConfig.series.length > 1) {
      let axisPointerType: "line" | "shadow" = "line";
      chartConfig.series.forEach((series) => {
        if (series.type == "bar") {
          axisPointerType = "shadow";
        }
      });
      return {
        ...commonTooltip,
        formatter: tooltipFormatter(chartConfig.tooltipFormatter, data.unit),
        axisPointer: {
          type: axisPointerType,
        },
        trigger: "axis",
      };
    }
  }

  function initDataZoom(chartConfig: ChartModel, data: ChartDataModel, mini: boolean) {
    if (mini) return;
    if (chartConfig.dataZoom && data.dataset.length > 10) {
      let dataZoom = cloneDeep(commonDataZoom);
      if (chartConfig.dataZoomShowCount && data.dataset.length > chartConfig.dataZoomShowCount + 1)
        dataZoom = merge(dataZoom, { startValue: data.dataset.length - (chartConfig.dataZoomShowCount + 1) });
      return dataZoom;
    }
  }

  function initLegend(chartConfig: ChartModel, data: ChartDataModel, mini: boolean): LegendComponentOption | undefined {
    if (mini) return;

    if (chartConfig.series.length == 1) {
      const type = getOptionType(chartConfig.series[0]);
      if (type == OptionType.pie) {
        return commonPieLegend as LegendComponentOption;
      }
    }

    if (chartConfig.series.length > 1) {
      const series = chartConfig.series.map((series) => getSeriesByOptionType(series, false, mini));
      const min = Math.min(series.length, data.dataset?.[0]?.length - 1);
      const legendData: { name: string; icon?: string }[] = [];
      for (let i = 0; i < min; i++) {
        const type = getOptionType(chartConfig.series[i]);
        if (type == OptionType.bar) {
          legendData.push({
            name: data.dataset[0][i + 1].toString() ?? "",
          });
        }
        if (type == OptionType.line) {
          legendData.push({
            name: data.dataset[0][i + 1].toString() ?? "",
            icon: wave,
          });
        }
      }
      return {
        data: legendData,
        ...commonLegend,
        show: !mini,
      };
    }
  }

  function makeOption(mini: boolean, config: ChartModel, data: ChartDataModel) {
    const type = getOptionType(config.series[0]);
    const noData = (data.dataset?.length ?? 0) <= 0;

    const dataset = noData ? { source: getDataSetSource(type) } : { source: data.dataset };

    const graphic = noData ? commonWithoutDataGraphic : undefined;

    const series = config.series.map((s) =>
      getSeriesByOptionType(s, noData, mini, {
        symbol: "none",
        data: config.markLines.map((m) => ({
          yAxis: data?.markLineData[m.id],
          lineStyle: {
            color: m.color,
            width: 2,
            type: m.type,
          },
          label: {
            position: "end",
            formatter: `${m.label}：${data?.markLineData[m.id]}`,
            fontSize: 12,
          },
        })),
      }),
    );

    const xAxis = [
      getXAxis(
        type,
        config.xAxises.length > 0 ? config.xAxises[0] : new AxisesModel(),
        data?.unit as string,
        noData,
        mini,
      ),
    ];

    const yAxis =
      config.yAxises.length === 0
        ? [getYAxis(type, new AxisesModel(), data?.unit as string, noData, data ?? new ChartDataModel(), mini)]
        : config.yAxises.map((y) =>
            getYAxis(type, y, data?.unit as string, noData, data ?? new ChartDataModel(), mini),
          );

    if (yAxis.length > 1) {
      yAxis.forEach((_, i) => {
        yAxis[i].splitLine = {
          ...yAxis[i].splitLine,
          show: false,
        };
      });
    }

    const grid = mini
      ? {
          top: "auto",
          right: "auto",
          bottom: "auto",
          left: -10,
          containLabel: true,
        }
      : type === OptionType.line || type === OptionType.bar
      ? config.markLines.length > 0
        ? { ...markLineGrid }
        : { ...commonGrid }
      : undefined;

    const radar =
      type === OptionType.radar
        ? noData
          ? commonWithoutDataRadar
          : {
              ...commonRadar,
              indicator: first(config.series).indicators.map((i) => ({
                name: i,
                color: "#666",
                max: data?.max,
              })),
            }
        : undefined;

    const tooltip = noData || mini ? undefined : initTooltip(config, data);

    // const toolbox = mini ? undefined : noData ? undefined : { ...commonToolbox };

    const visualMap =
      type === OptionType.map ? { ...commonVisualMap, min: data?.min ?? 0, max: data?.max ?? 200 } : undefined;

    const dataZoom = initDataZoom(config, data, mini);

    const legend = noData ? undefined : initLegend(config, data, mini);

    if (!mini) handleBottomLayout(xAxis, legend, dataZoom);

    return {
      dataset,
      graphic,
      series,
      xAxis,
      yAxis,
      grid,
      radar,
      tooltip,
      // toolbox,
      visualMap,
      dataZoom,
      legend,
    };
  }

  const option = useMemo(
    () => makeOption(mini, config, data),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [config, data, mini],
  );

  return (
    <ReactECharts
      theme={t}
      className={classes.root}
      option={option}
      showLoading={loading}
      loadingOption={{
        text: "",
        lineWidth: 3,
        spinnerRadius: 14,
        color: MuiTheme.palette.primary.main,
      }}
      opts={{
        renderer: "svg",
      }}
    />
  );
};

export default Chart;
