import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import { Filter, GraphSection as GraphSectionModel } from "../../../../../generated/graphql";
import { useFilterInputs } from "../../../../../utils/hooks";
import { getLockLimit } from "../../../../../utils/permission";
import SectionWrapper from "../../core/section";
import DataGraph from "./data-graph";

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
      userSelect: "none",
    },
    filters: {
      margin: "16px 0",
    },
    content: {
      position: "relative",
    },
    titleCount: {
      marginLeft: 4,
      color: theme.palette.primary.main,
    },
    graphsBox: {
      display: "flex",
      flexDirection: "row",
    },
  }),
);

interface GraphSectionProps {
  section: GraphSectionModel;
}

const GraphSection = React.forwardRef<HTMLDivElement, GraphSectionProps>(function GraphSection(props, ref) {
  const classes = useStyles();
  const { section } = props;
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
          permissions={section.permissions}
          footnotes={section.footnotes}
        >
          <Box className={classes.graphsBox}>
            {section.graphIDs.length > 0 &&
              section.graphIDs.map((v) => {
                return <DataGraph key={v} graphId={v} filters={mixedFilterInputs} />;
              })}
          </Box>
        </SectionWrapper>
      </Box>
    </div>
  );
});

export default GraphSection;
