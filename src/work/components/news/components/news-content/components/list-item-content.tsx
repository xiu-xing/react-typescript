import { makeStyles, Typography } from "@material-ui/core";
import { format, fromUnixTime } from "date-fns";
import React from "react";
import { ChannelData } from "../../../../../generated/graphql";
import NewsList from "../../news-list/news-list";

const useStyles = makeStyles({
  contentBox: {
    margin: "12px 0",
  },
  date: {
    margin: 6,
    fontSize: 20,
    color: "#5F6368",
  },
});

interface ListItemContentProps {
  date: string;
  data: ChannelData[];
}

const ListItemContent: React.FunctionComponent<ListItemContentProps> = ({ data, date }) => {
  const classes = useStyles();
  const currentDate = format(new Date(), "yyyy-MM-dd");
  const targetDate = format(fromUnixTime(Number(date)), "yyyy-MM-dd");

  return data ? (
    <div className={classes.contentBox}>
      <Typography className={classes.date}>{currentDate === targetDate ? "今日" : targetDate}</Typography>
      <div>
        {data.map((item, index) => {
          return <NewsList key={index} channelData={item} date={targetDate} />;
        })}
      </div>
    </div>
  ) : null;
};

export default ListItemContent;
