import { Accordion, AccordionProps, AccordionSummary } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { ChevronDown } from "mdi-material-ui";
import React, { ReactNode } from "react";
import CommonAccordionSummaryItem, { CommonAccordionSummaryItemProps } from "./components/summary-item";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    header: {
      height: 74,
    },
    headerContent: {
      alignItems: "center",
      height: 74,
    },
    image: {
      width: 30,
      height: 30,
      minWidth: 30,
      minHeight: 30,
      overflow: "hidden",
      marginRight: 8,
    },
    headingArea: {
      display: "grid",
      gridAutoFlow: "row",
      flex: 1,
    },
    heading: {
      fontSize: "16px",
      color: "#333",
      whiteSpace: "nowrap",
      overflow: "hidden",
      textOverflow: "ellipsis",
    },
    subheading: {
      fontSize: "12px",
      color: "#666",
      whiteSpace: "nowrap",
      overflow: "hidden",
      textOverflow: "ellipsis",
    },
    summaryItems: {
      display: "grid",
      gridAutoFlow: "column",
      gridColumnGap: 24,
    },
  }),
);

export interface CommonAccordionProps extends AccordionProps {
  image?: ReactNode;
  heading?: ReactNode;
  subheading?: ReactNode;
  summaryItems?: CommonAccordionSummaryItemProps[];
}

/**
 * CommonAccordion
 * 
 * @example
 * <CommonAccordion
              heading="我的机构"
              subheading="主体公司和基金"
              defaultExpanded
              image={<Organization className={classes.accordionImage} />}
            >
              <CommonAccordionDetails footerButton={<LoadMore />}>
                <CellGroup
                  image={<img src="https://www.canva.cn/learn/wp-content/uploads/sites/17/2019/11/1000.png" />}
                  heading="小米科技"
                >
                  <CommonCell />
                </CellGroup>
              </CommonAccordionDetails>
            </CommonAccordion>
 * 
 * @param props Props for the CommonAccordion
 */
const CommonAccordion: React.FunctionComponent<CommonAccordionProps> = (props) => {
  const classes = useStyles();
  const { image, heading, subheading, summaryItems, children, ...leftProps } = props;

  return (
    <Accordion {...leftProps} className={classes.root}>
      <AccordionSummary
        classes={{
          root: classes.header,
          content: classes.headerContent,
        }}
        expandIcon={<ChevronDown />}
      >
        {image && <div className={classes.image}>{image}</div>}
        {
          <div className={classes.headingArea}>
            <div className={classes.heading}>{heading}</div>
            <div className={classes.subheading}>{subheading}</div>
          </div>
        }
        <div className={classes.summaryItems}>
          {(summaryItems ?? []).map((summaryItem, index) => (
            <CommonAccordionSummaryItem key={index} {...summaryItem} />
          ))}
        </div>
      </AccordionSummary>
      {children}
    </Accordion>
  );
};

export default CommonAccordion;
