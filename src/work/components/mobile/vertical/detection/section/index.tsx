import { Box, ButtonBase, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { ArrowExpand, ChevronRight } from "mdi-material-ui";
import React, { useMemo, useState } from "react";
import { EntityType, QuarterSequence, useVerticalRankingsQuery } from "../../../../../generated/graphql";
import Space from "../../../../common/space";
import Chart from "../../common/chart";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      // maxWidth: "100%",
      //   padding: "14px 16px",
    },
    500: {
      fontWeight: theme.typography.fontWeightMedium,
    },
    primary: {
      color: theme.palette.primary.main,
    },
    pointer: {
      cursor: "pointer",
    },
    selectButton: {
      flexDirection: "column",
      borderRadius: "4px",
      padding: "20px 16px",
      background: "rgba(79, 112, 155, 0.04)",
      "&>p": {
        fontSize: 14,
        lineHeight: "24px",
        fontWeight: theme.typography.fontWeightMedium,
      },
    },
    selectedButton: {
      background: theme.palette.primary.main,
      "&>p": {
        color: "#fff",
      },
    },
    subTitle: {
      fontSize: 12,
      color: "#666",
    },
    white: {
      color: "#fff",
    },
    top: {
      overflowX: "auto",
      overflowY: "hidden",
    },
  }),
);

interface SectionProps {
  year: number;
  quarter: QuarterSequence;
  metricsId: string;
  title: string;
}

const Section: React.FunctionComponent<SectionProps> = (props) => {
  const classes = useStyles();
  const { year, quarter, metricsId, title } = props;

  const [verticalRankingsQueryResult] = useVerticalRankingsQuery({
    variables: {
      year: year,
      quarter: quarter,
      metricsID: metricsId,
    },
  });

  const verticals = useMemo(() => {
    return verticalRankingsQueryResult.data?.verticalRankings ?? [];
  }, [verticalRankingsQueryResult]);

  const [selected, setSelected] = useState(0);

  const selectedVertical = useMemo(() => verticals?.[selected], [verticals, selected]);

  return (
    <Box className={classes.root}>
      {selectedVertical && (
        <>
          <Box display="inline-flex" alignItems="center" paddingX="16px" paddingTop="14px">
            <Typography className={classes[500]}>{title}</Typography>
            <Box width={4} />
            <ChevronRight fontSize="small" />
            <Box width={4} />
            <Typography
              className={clsx(classes[500], classes.primary, classes.pointer)}
              onClick={() => {
                window.location.href = `js://webview/profile?id=${selectedVertical.verticalID}&type=${EntityType.Vertical}`;
              }}
            >
              {selectedVertical.verticalName}
            </Typography>
          </Box>
          <Box className={classes.top} padding="16px">
            <Space size="middle">
              {verticals.map((v, i) => (
                <ButtonBase
                  key={v?.verticalID as string}
                  className={clsx(classes.selectButton, { [classes.selectedButton]: selected === i })}
                  onClick={() => setSelected(i)}
                >
                  <Typography noWrap>{v?.verticalName}</Typography>
                  <Box height={16} />
                  <Box display="inline-flex">
                    <Typography className={clsx(classes.subTitle, { [classes.white]: selected === i })} noWrap>
                      分数
                    </Typography>
                    <Box width={4} />
                    <Typography className={clsx(classes.subTitle, { [classes.white]: selected === i })} noWrap>
                      {v?.score}
                    </Typography>
                  </Box>
                </ButtonBase>
              ))}
              <Box width={1} />
            </Space>
          </Box>
          <Box paddingX="16px">
            <Box display="flex" justifyContent="flex-end">
              <ArrowExpand
                color="primary"
                fontSize="small"
                onClick={() =>
                  (window.location.href = `js://webview/vertical/chart?verticalId=${selectedVertical.verticalID}&metricsId=${metricsId}&year=${year}&quarter=${quarter}`)
                }
              />
            </Box>
            <Chart
              year={year}
              metricsId={metricsId}
              quarter={quarter}
              verticalId={selectedVertical.verticalID as string}
              height={200}
              mini
            />
          </Box>
        </>
      )}
    </Box>
  );
};

export default Section;
