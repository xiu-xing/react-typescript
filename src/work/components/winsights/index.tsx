import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import AboutUs from "./aboutUs";
import TrendingExpert from "./trendingExpert";
import Conference from "./conference";
import TabsSection from "./components/tabs-section";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
    },
  }),
);

const tabs = ["专家会议", "热荐专家", "关于万盛"];

const WinSightsContent: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  return (
    <Box className={classes.root}>
      <TabsSection title="专家咨询" tabs={tabs} defaultActiveIndex={0}>
        <Conference />
        <TrendingExpert />
        <AboutUs />
      </TabsSection>
    </Box>
  );
};

export default WinSightsContent;
