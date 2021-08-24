import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { ArrowExpand } from "mdi-material-ui";
import React from "react";
import { EntityType, FilterInputs, NextPlatform } from "../../../../../generated/graphql";
import DataChart from "../../../common/data-chart";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    title: {
      fontSize: 12,
      color: "#999",
    },
  }),
);

interface ChartProps {
  id: string;
  entityId: string;
  entityType: EntityType;
  name?: string;
  filters?: FilterInputs;
}

const ChartSection: React.FC<ChartProps> = ({ id, entityId, entityType, filters, name }) => {
  const classes = useStyles();

  return (
    <Box className={classes.root} key={id}>
      <Box display="flex" alignItems="center" justifyContent="space-between">
        <Typography noWrap className={classes.title}>
          {name}
        </Typography>
        <ArrowExpand
          fontSize="small"
          color="primary"
          onClick={() => window.open(`js://webview/chart?entityId=${entityId}&entityType=${entityType}&chartId=${id}`)}
        />
      </Box>
      <Box height={108}marginTop={1}>
        <DataChart
          mini
          id={id}
          entityId={entityId}
          entityType={entityType}
          filterInputs={filters}
          platform={NextPlatform.PlatformMobile}
        />
      </Box>
    </Box>
  );
};

export default ChartSection;
