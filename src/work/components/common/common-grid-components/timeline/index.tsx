import { Box, CircularProgress, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import ErrorIcon from "@material-ui/icons/Error";
import {
  Timeline,
  TimelineConnector,
  TimelineContent,
  TimelineDot,
  TimelineItem,
  TimelineSeparator,
} from "@material-ui/lab";
import clsx from "clsx";
import { format, fromUnixTime } from "date-fns";
import React, { useCallback, useEffect, useRef } from "react";
import SimpleBar from "simplebar-react";
import { Tag, TimelineRowNode } from "../../../../generated/graphql";
import { RichTextModel } from "../../../../models/richText/index-next";
import { inDay } from "../../../../utils/date";
import CommonAccordionPlaceholder from "../../accordion/components/placeholder";
import RichTextNext from "../../rich-text-next";
import { TrackerTimelineConfig, TrackerTimelineType } from "./types";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    timeline: {
      alignItems: "flex-start",
      margin: 0,
      "& .MuiTimelineItem-missingOppositeContent:before": {
        flex: "unset",
        padding: "24px 0",
      },
      "& .MuiTimeline-root": {
        padding: "6px 24px",
      },
      "& .MuiTimelineItem-root": {
        width: "100%",
        minHeight: 50,
      },
    },
    timelineItemContent: {
      display: "grid",
      padding: "0 0 10px 12px",
      gridRowGap: 4,
    },
    dot: {
      padding: 3,
      margin: "5px 0",
    },
    timeText: {
      fontSize: 14,
      color: "#666",
    },
    tagBox: {
      display: "flex",
      columnGap: "4px",
      paddingTop: 4,
    },

    load: {
      justifyContent: "center",
    },
    line: {
      width: "2px",
    },
    blueBorder: {
      borderColor: theme.palette.primary.main,
    },
    blueBackground: {
      backgroundColor: theme.palette.primary.main,
    },
    closeIcon: {
      color: "#666",
      fontSize: "24px",
    },
    simpleBar: {
      height: "100%",
      overflow: "auto",
    },
  }),
);

interface CommonTimelineProps {
  trackerTimelineConfig?: TrackerTimelineConfig;
  timelineList: TimelineRowNode[];
  fetching: boolean;
  showNodata: boolean;
  onScrollArrivedBottomHandler?: () => void;
  backTop?: number;
}

const CommonTimeline: React.FunctionComponent<CommonTimelineProps> = (props) => {
  const classes = useStyles();
  const { trackerTimelineConfig, timelineList, fetching, showNodata, onScrollArrivedBottomHandler, backTop } = props;
  const timelineScrollRef = useRef<HTMLDivElement>(null);

  const getTime = (time: number) => {
    if (trackerTimelineConfig?.type !== TrackerTimelineType.News) return format(fromUnixTime(time), "yyyy-MM-dd");

    const date = inDay(time)
      ? format(fromUnixTime(time), "yyyy-MM-dd HH:mm")
      : format(fromUnixTime(time), "yyyy-MM-dd");
    return date;
  };

  const getTag = (tag: Tag) => {
    switch (tag.__typename) {
      case "RiskTag":
        return <ErrorIcon />;
      default:
        break;
    }
  };

  useEffect(() => {
    if (!backTop) return;

    timelineScrollRef.current &&
      timelineScrollRef.current?.scrollTo({
        left: 0,
        top: 0,
      });
  }, [backTop]);

  const scrollHandler = useCallback(() => {
    if (!timelineScrollRef.current) return;

    if (
      timelineScrollRef.current.scrollHeight -
        timelineScrollRef.current.scrollTop -
        timelineScrollRef.current.clientHeight <=
      10
    ) {
      onScrollArrivedBottomHandler && onScrollArrivedBottomHandler();
    }
  }, []);

  useEffect(() => {
    const scroll = timelineScrollRef.current;

    if (!scroll) return;

    if (onScrollArrivedBottomHandler === undefined) {
      scroll.removeEventListener("scroll", scrollHandler);
      return;
    }

    scroll?.addEventListener("scroll", scrollHandler);
  }, [onScrollArrivedBottomHandler]);

  const getTimelineItems = () => {
    return timelineList.map((item, index) => {
      const data = JSON.parse(item.data);
      const models = data.map((i: unknown) => RichTextModel.fromJSON(i));

      return (
        <TimelineItem key={index}>
          <TimelineSeparator>
            <TimelineDot className={clsx(classes.dot, index === 0 && classes.blueBorder)} variant="outlined" />
            <TimelineConnector className={clsx(classes.line, index === 0 && classes.blueBackground)} />
          </TimelineSeparator>
          <TimelineContent className={classes.timelineItemContent}>
            <Typography className={classes.timeText}>{getTime(item.time)}</Typography>
            <RichTextNext models={models} />
            {item.tags && item.tags.length > 0 && (
              <div className={classes.tagBox}>{item.tags.map((tag) => getTag(tag))}</div>
            )}
          </TimelineContent>
        </TimelineItem>
      );
    });
  };

  return (
    <SimpleBar className={classes.simpleBar} scrollableNodeProps={{ ref: timelineScrollRef }}>
      <Timeline className={classes.timeline}>{getTimelineItems()}</Timeline>
      {fetching && (
        <Box display="grid" alignItems="center" justifyContent="center" style={{ height: 50 }}>
          <CircularProgress size={30} />
        </Box>
      )}
      {showNodata && (
        <div style={{ paddingTop: "24%" }}>
          <CommonAccordionPlaceholder />
        </div>
      )}
    </SimpleBar>
  );
};

export default CommonTimeline;