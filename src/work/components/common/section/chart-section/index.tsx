import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { forwardRef } from "react";
import { ChartSection as ChartSectionModel, Filter } from "../../../../generated/graphql";
import { useFilterInputs } from "../../../../utils/hooks";
import { getLockLimit } from "../../../../utils/permission";
import { useProfileEntity } from "../../../profile/atoms";
import DataChart from "../../chart-next/data-chart";
import FilterItem from "../../filter-item";
import Space from "../../space";
import ACPlaceholder from "../ac-placeholder";

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
    filters: {
      margin: "16px 0",
    },
    content: {
      position: "relative",
    },
    blur: {
      filter: "blur(2px)",
      userSelect: "none",
      opacity: 0.5,
    },
    titleCount: {
      marginLeft: 4,
      color: theme.palette.primary.main,
    },
  }),
);

interface ChartSectionProps {
  section: ChartSectionModel;
}

const ChartSection = forwardRef<HTMLDivElement, ChartSectionProps>(function ChartSection(props, ref) {
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
        <Box className={clsx({ [classes.blur]: getLockLimit(section.permissions) })}>
          {section.filters && (
            <div className={classes.filters}>
              <Space size="middle" wrap>
                {section.filters.map((f, i) => (
                  <FilterItem key={i} filter={f} onChange={update} />
                ))}
              </Space>
            </div>
          )}
          {section.chartIDs.length > 0 && (
            <DataChart
              lock={getLockLimit(section.permissions)}
              chartID={section.chartIDs[0]}
              entityID={profileEntity.id}
              entityType={profileEntity.type}
              filterInputs={mixedFilterInputs}
            />
          )}
        </Box>
        {getLockLimit(section.permissions) && <ACPlaceholder />}
      </Box>
    </div>
  );
});

export default ChartSection;
