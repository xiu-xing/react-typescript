import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import { ChartSection as ChartSectionModel } from "../../../../../../generated/graphql";
import { getLockLimit } from "../../../../../../utils/permission";
import ACPlaceholder from "../../../components/ac-placeholder";
import RealmChart from "./realm-chart";

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

interface RealmChartSectionProps {
  section: ChartSectionModel;
}

const RealmChartSection: React.FunctionComponent<RealmChartSectionProps> = (props) => {
  const classes = useStyles();
  const { section } = props;

  return (
    <div className={classes.root}>
      <Typography noWrap className={classes.title}>
        <span>{section.name}</span>
        {!!section.count && <span className={classes.titleCount}>{section.count}</span>}
      </Typography>
      <Box className={classes.content}>
        <Box className={clsx({ [classes.blur]: getLockLimit(section.permissions) })}>
          {section.chartIDs.length > 0 && section.chartIDs.map((item) => <RealmChart realmChartID={item} key={item} />)}
        </Box>
        {getLockLimit(section.permissions) && <ACPlaceholder />}
      </Box>
    </div>
  );
};

export default RealmChartSection;
