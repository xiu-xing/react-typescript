import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import { Filter, ProgressBarSection as ProgressBarSectionModel } from "../../../../../generated/graphql";
import { useFilterInputs } from "../../../../../utils/hooks";
import { getLockLimit } from "../../../../../utils/permission";
import SectionWrapper from "../../core/section";
import DataProgressBar from "./data-progress-bar";

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
    progressBarContent: {
      display: "flex",
      flexDirection: "column",
    },
  }),
);

interface ProgressBarSectionProps {
  section: ProgressBarSectionModel;
}

const ProgressBarSection = React.forwardRef<HTMLDivElement, ProgressBarSectionProps>(function GraphSection(props, ref) {
  const classes = useStyles();
  const { section } = props;
  const [mixedFilterInputs, update] = useFilterInputs(section?.filters as Filter[]);

  return (
    <div ref={ref} className={classes.root}>
      <Typography noWrap className={classes.title}>
        <span>{section.name}</span>
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
          <Box className={classes.progressBarContent}>
            {section.progressBarIDs.map((v, i) => (
              <DataProgressBar key={v + i} id={v} filters={mixedFilterInputs} />
            ))}
          </Box>
        </SectionWrapper>
      </Box>
    </div>
  );
});

export default ProgressBarSection;
