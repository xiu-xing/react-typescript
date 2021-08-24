import { Box, Button, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { SquareEditOutline } from "mdi-material-ui";
import React from "react";
import { NoDataWEBP } from "../../../../../../../../assets/webp/nodata";
import AppContainer from "../../../../../../../../containers/appContainer";
import FeedbackContent from "../../../../../../../common/feedback-content";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    img: {
      width: 209,
      height: 174,
      pointerEvents: "none",
      objectFit: "cover",
    },
    default: {
      display: "grid",
      gridRowGap: "12px",
      placeItems: "center",
    },
    tip: {
      fontSize: "0.875rem",
      color: "#666",
      lineHeight: 1.72,
    },
    feedbackTitle: {
      fontSize: "1rem",
      color: "#737373",
      lineHeight: "24px",
      fontWeight: theme.typography.fontWeightMedium,
    },
    feedbackSubtitle: {
      fontSize: "0.875rem",
      color: "#666",
      lineHeight: "24px",
    },
    feedback: {
      display: "grid",
      gridColumnGap: "52px",
      gridTemplateColumns: "repeat(2,1fr)",
    },
  }),
);

interface NoDataProps {
  variant?: "feedback" | "default";
  tip?: string;
}

const NoData: React.FunctionComponent<NoDataProps> = (props) => {
  const classes = useStyles();
  const { variant = "default", tip = "暂无数据" } = props;
  const { showDialog } = AppContainer.useContainer();

  return (
    <Box className={clsx({ [classes.default]: variant === "default", [classes.feedback]: variant === "feedback" })}>
      <img src={NoDataWEBP} className={classes.img} />
      {variant === "default" && <Typography className={classes.tip}>{tip}</Typography>}
      {variant === "feedback" && (
        <Box>
          <Typography noWrap className={classes.feedbackTitle}>
            抱歉，没有找到相关数据！
          </Typography>
          <Box height={8} />
          <Typography noWrap className={classes.feedbackSubtitle}>
            <svg width="13.5" height="10">
              <circle cx="5" cy="5" r="2.5" stroke="#666666" fill="transparent" strokeWidth="1" />
            </svg>
            输入更准确的关键词，重新搜索
          </Typography>
          <Box height={4} />
          <Typography noWrap className={classes.feedbackSubtitle}>
            <svg width="13.5" height="10">
              <circle cx="5" cy="5" r="2.5" stroke="#666666" fill="transparent" strokeWidth="1" />
            </svg>
            反馈数据缺失或数据错误
          </Typography>
          <Box height={16} />
          <Button
            variant="contained"
            color="primary"
            startIcon={<SquareEditOutline />}
            onClick={() =>
              showDialog({
                fullWidth: true,
                maxWidth: "xs",
                children: <FeedbackContent />,
              })
            }
          >
            反馈
          </Button>
        </Box>
      )}
    </Box>
  );
};

export default NoData;
