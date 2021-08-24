import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { forwardRef } from "react";
import { ChartSection as ChartSectionModel, Filter } from "../../../../../../generated/graphql";
import { useFilterInputs } from "../../../../../../utils/hooks";
import { getLockLimit } from "../../../../../../utils/permission";
import { useProfileEntity } from "../../../../../profile/atoms";
import ACPlaceholder from "../../../components/ac-placeholder";
import SectionWrapper from "../../../core/section";
import DataChart from "./data-chart";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "32px 0 0 0",
      width: "100%",
    },
    title: {
      lineHeight: 1.5,
      fontSize: theme.typography.subtitle1.fontSize,
      fontWeight: theme.typography.fontWeightMedium,
    },
    content: {
      position: "relative",
    },
    titleCount: {
      marginLeft: 4,
      color: theme.palette.primary.main,
    },
    charts: {
      display: "flex",
      flexDirection: "row",
    },
  }),
);

interface DataChartSectionProps {
  section: ChartSectionModel;
}

const DataChartSection = forwardRef<HTMLDivElement, DataChartSectionProps>(function DataChartSection(props, ref) {
  const classes = useStyles();
  const { section } = props;

  const [profileEntity] = useProfileEntity();
  const [mixedFilterInputs, update] = useFilterInputs(section?.filters as Filter[]);

  return (
    <div ref={ref} className={classes.root}>
      <Typography noWrap className={classes.title}>
        <span>{section.name}</span>
        {!!section.count && <span className={classes.titleCount}>{section.count}</span>}
      </Typography>
      <Box
        className={classes.content}
        style={{ ...(section && getLockLimit(section.permissions) && { minHeight: 100 }) }}
      >
        <SectionWrapper
          filters={section.filters}
          filtersOnChange={update}
          footnotes={section.footnotes}
          permissions={section.permissions}
        >
          {section.chartIDs.length > 1 ? (
            <Box className={classes.charts}>
              {section.chartIDs.map((c, i) => {
                return (
                  <DataChart
                    key={c + i}
                    chartID={c}
                    entityID={profileEntity.id}
                    entityType={profileEntity.type}
                    filterInputs={mixedFilterInputs}
                  />
                );
              })}
            </Box>
          ) : (
            <DataChart
              chartID={section.chartIDs[0]}
              entityID={profileEntity.id}
              entityType={profileEntity.type}
              filterInputs={mixedFilterInputs}
            />
          )}
        </SectionWrapper>
        {getLockLimit(section.permissions) && <ACPlaceholder />}
      </Box>
    </div>
  );
});

export default DataChartSection;
