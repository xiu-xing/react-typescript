import { Box, ButtonBase, Typography, useTheme } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { formatDistance, addDays } from "date-fns";
import { zhCN } from "date-fns/locale";
import { ChevronRight } from "mdi-material-ui";
import React, { useMemo, useState } from "react";
import { EntityType, NextPlatform, useKeyValueMapQuery } from "../../../../generated/graphql";
import { isJson } from "../../../../utils/tools";
import Space from "../../../common/space";
import Subdivision from "./subdivision";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    top: {
      overflowX: "auto",
      overflowY: "hidden",
    },
    selectButton: {
      borderRadius: "4px",
      padding: "16px 16px",
      background: "rgba(79, 112, 155, 0.04)",
      "&>p": {
        color:"#666",
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
    bar: {
      overflowX: "scroll",
      overflowY: "hidden",
      maxHeight: 64,
      "& .simplebar-content>button:not(:first-child)": {
        marginLeft: "16px",
      },
    },
    title: {
      fontSize: 14,
      color: "#333",
      lineHeight: "24px",
      fontWeight: theme.typography.fontWeightMedium,
    },
    fieldTitle: {
      color: "#999",
      fontSize: 12,
      lineHeight: "16px",
    },
    fieldValue: {
      fontSize: 14,
      color: "#333",
      lineHeight: "24px",
    },
  }),
);

export interface Vertical {
  UnionID: string;
  Name: string;
  NumberOfEnterprise: number;
  NextLevel: Array<Vertical>;
}

interface HardTechProps {
  firstLevelVerticals?: Array<{ id: string; name: string }>;
}

const HardTech: React.FC<HardTechProps> = ({ firstLevelVerticals = [] }) => {
  const classes = useStyles();
  const theme = useTheme();
  const [selected, setSelected] = useState(0);
  const selectedVertical = useMemo(() => firstLevelVerticals?.[selected] ?? undefined, [selected, firstLevelVerticals]);

  const [secondVerticalsQuery] = useKeyValueMapQuery({
    variables: {
      funcID: "pevc.vertical_from_hard_tech_list",
      requestBody: selectedVertical?.id,
      platform: NextPlatform.PlatformMobile,
    },
  });

  const [verticalStatistic] = useKeyValueMapQuery({
    variables: {
      funcID: "pevc.single_vertical_statistic",
      requestBody: selectedVertical?.id,
      platform: NextPlatform.PlatformMobile,
    },
  });

  const secondVerticals: Array<Vertical> = useMemo(() => {
    const data = secondVerticalsQuery.data?.keyValueMap?.data;

    if (isJson(data)) {
      return JSON.parse(data);
    }

    return [];
  }, [secondVerticalsQuery]);

  const statistic = useMemo(() => {
    const data = verticalStatistic.data?.keyValueMap?.data;
    if (isJson(data)) {
      return JSON.parse(data);
    }
  }, [verticalStatistic]);

  const jumpToProfile = (id: string) => {
    window.location.href = `js://webview/profile?id=${id}&type=${EntityType.Vertical}`;
  };

  return (
    <Box className={classes.root}>
      <Box className={classes.top} padding="20px 0 6px 16px">
        <Space size="middle">
          {firstLevelVerticals.map((n, i) => (
            <ButtonBase
              key={n.id}
              className={clsx(classes.selectButton, { [classes.selectedButton]: selected === i })}
              onClick={() => setSelected(i)}
            >
              <Typography noWrap>{n.name}</Typography>
            </ButtonBase>
          ))}
          <Box width={1} />
        </Space>
      </Box>
      <Box paddingX="16px">
        <Box paddingY="14px">
          <Box display="flex" alignItems="center" justifyContent="space-between">
            <Typography noWrap style={{ color: "#333", fontSize: 18, fontWeight: theme.typography.fontWeightMedium }}>
              {selectedVertical?.name}
            </Typography>
            <Box
              display="inline-flex"
              alignItems="center"
              style={{ cursor: "pointer" }}
              onClick={() => jumpToProfile(selectedVertical.id)}
            >
              <Typography noWrap className={classes.title} style={{ color: theme.palette.primary.main }}>
                查看详情
              </Typography>
              <ChevronRight color="primary" style={{ fontSize: 16 }} />
            </Box>
          </Box>
          <Box height={12} />
          {statistic && (
            <Box display="grid" gridRowGap="12px" gridColumnGap="24px" gridTemplateColumns="repeat(2,1fr)">
              <Box>
                <Typography className={classes.fieldTitle}>近一年融资事件</Typography>
                <Typography className={classes.fieldValue}>{statistic["DealsCountInRecentYear"]}</Typography>
              </Box>
              <Box>
                <Typography className={classes.fieldTitle}>近一年 IPO</Typography>
                <Typography className={classes.fieldValue}>{statistic["IPOsCountInRecentYear"]}</Typography>
              </Box>
              <Box>
                <Typography className={classes.fieldTitle}>近一年 M&A</Typography>
                <Typography className={classes.fieldValue}>{statistic["MAsCountInRecentYear"]}</Typography>
              </Box>
              <Box>
                <Typography className={classes.fieldTitle}>融资速度中位数</Typography>
                <Typography className={classes.fieldValue}>
                  {formatDistance(new Date(), addDays(new Date(), statistic["AverageFinancingSpeed"]), {
                    locale: zhCN,
                  }).substr(
                    formatDistance(new Date(), addDays(new Date(), statistic["AverageFinancingSpeed"]), {
                      locale: zhCN,
                    }).match(/[0-9]/)?.index ?? 0,
                  )}
                </Typography>
              </Box>
            </Box>
          )}
        </Box>
        <Box height={8} />
        <Box>
          <Box height={8} />
          <Typography noWrap className={classes.title}>
            细分领域
          </Typography>
          <Box height={2} />
          {secondVerticals.map((s, i) => (
            <Box key={s.UnionID}>
              {i !== 0 && <Box height={14} />}
              <Subdivision vertical={s} />
            </Box>
          ))}
        </Box>
      </Box>
    </Box>
  );
};

export default HardTech;
