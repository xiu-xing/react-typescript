import { Box, NativeSelect } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useEffect, useMemo, useState } from "react";
import { QuarterRange, QuarterSequence } from "../../../../generated/graphql";
import Space from "../../../common/space";
import { MetricsIDs } from "../../../verticals/detection/detectionContainer";
import Section from "./section";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    nativeInput: {
      fontSize: 14,
      color: "#333",
      fontWeight: theme.typography.fontWeightMedium,
      "& .MuiNativeSelect-icon": {
        color: "#333",
        transform: "translateY(-1px)",
      },
      "& .MuiNativeSelect-select:focus": {
        backgroundColor: "transparent",
      },
      "&:before": {
        border: "none",
      },
      "&:hover:not(.Mui-disabled):before": {
        border: "none",
      },
      "&:after": {
        border: "none",
      },
    },
    filters: {
      padding: "20px 16px 0 16px",
    },
  }),
);

interface DetectionProps {
  range: QuarterRange;
}

const quaterText = {
  [QuarterSequence.One]: "第一季度",
  [QuarterSequence.Two]: "第二季度",
  [QuarterSequence.Three]: "第三季度",
  [QuarterSequence.Four]: "第四季度",
  [QuarterSequence.Annual]: "全部",
};

const Detection: React.FC<DetectionProps> = (props) => {
  const classes = useStyles();
  const { range } = props;
  const [currentYearIndex, setCurrentYearIndex] = useState(0);

  const [currentQuater, setCurrentQuater] = useState<QuarterSequence>(QuarterSequence.One);

  const years = useMemo(() => {
    const max = range.max.year;
    const min = range.min.year;
    const res = [];
    let i = max;

    while (i >= min) {
      res.push(i);
      i--;
    }

    return res;
  }, [range]);

  const year = useMemo(() => years?.[currentYearIndex], [years, currentYearIndex]);

  const quaters = useMemo(() => {
    const max = range.max.year;
    const min = range.min.year;

    const res = [QuarterSequence.Four, QuarterSequence.Three, QuarterSequence.Two, QuarterSequence.One].reverse();

    if (year === max) {
      return [QuarterSequence.Annual, ...res.slice(0, res.findIndex((r) => r === range.max.quarter) + 1)];
    }

    if (year === min) {
      return [
        QuarterSequence.Annual,
        ...res.slice(
          res.findIndex((r) => r === range.min.quarter),
          res.length,
        ),
      ];
    }

    return [QuarterSequence.Annual, ...res];
  }, [year, range]);

  useEffect(() => {
    setCurrentQuater(QuarterSequence.One);
  }, [year]);

  const sections = [
    {
      title: "综合排名",
      metricsId: MetricsIDs.RankingScore,
    },
    {
      title: "最受 Top 投资机构青睐",
      metricsId: MetricsIDs.InvestorCount,
    },
    {
      metricsId: MetricsIDs.DealCount,
      title: "交易事件远超预期",
    },
    {
      metricsId: MetricsIDs.DealCountIncrement,
      title: "交易事件连续增长",
    },
    {
      metricsId: MetricsIDs.CompanyCountIncrement,
      title: "企业数量连续增长",
    },
    {
      metricsId: MetricsIDs.DealInterval,
      title: "平均融资间隔最短",
    },
  ];

  return (
    <Box className={classes.root}>
      <Space className={classes.filters}>
        <NativeSelect
          value={currentYearIndex}
          onChange={(e) => setCurrentYearIndex(Number(e.target.value))}
          name="year"
          className={classes.nativeInput}
          inputProps={{ "aria-label": "year" }}
        >
          {years.map((y, i) => (
            <option key={y} value={i}>
              {y}
            </option>
          ))}
        </NativeSelect>
        <NativeSelect
          value={currentQuater}
          onChange={(e) => setCurrentQuater(e.target.value as QuarterSequence)}
          name="quater"
          className={classes.nativeInput}
          inputProps={{ "aria-label": "quater" }}
        >
          {quaters.map((q) => (
            <option key={q} value={q}>
              {quaterText[q]}
            </option>
          ))}
        </NativeSelect>
      </Space>

      {sections.map((s, i) => (
        <Box key={s.metricsId}>
          {i !== 0 && <Box height={32} />}
          <Section year={year} quarter={currentQuater} metricsId={s.metricsId} title={s.title} />
        </Box>
      ))}
    </Box>
  );
};

export default Detection;
