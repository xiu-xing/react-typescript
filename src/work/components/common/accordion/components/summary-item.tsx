import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "grid",
      gridAutoFlow: "column",
      gridColumnGap: 14,
      alignItems: "end",
      gridTemplateAreas: `"title value"
      "subtitle value"
      `,
    },
    heading: {
      gridArea: "title",
      color: "#666",
      fontSize: 12,
      whiteSpace: "nowrap",
    },
    subheading: {
      gridArea: "subtitle",
      color: "#666",
      fontSize: 14,
      whiteSpace: "nowrap",
    },
    value: {
      gridArea: "value",
      fontSize: 16,
      fontWeight: 500,
      whiteSpace: "nowrap",
    },
  }),
);

export interface CommonAccordionSummaryItemProps {
  heading: ReactNode;
  subheading: ReactNode;
  value: ReactNode;
  valueColor?: string;
}

const CommonAccordionSummaryItem: React.FunctionComponent<CommonAccordionSummaryItemProps> = (props) => {
  const classes = useStyles();
  const { heading, subheading, value, valueColor } = props;

  return (
    <div className={classes.root}>
      <Typography className={classes.heading}>{heading}</Typography>
      <Typography className={classes.subheading}>{subheading}</Typography>
      <Typography
        className={classes.value}
        style={{
          color: valueColor ?? "#C62828",
        }}
      >
        {value}
      </Typography>
    </div>
  );
};

export default CommonAccordionSummaryItem;
