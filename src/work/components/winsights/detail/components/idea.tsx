import { Box, createStyles, makeStyles, Theme, Typography, Button } from "@material-ui/core";
import { useEffect, useState } from "react";
import { DetailSource } from "..";
import React from "react";
import MeetCard from "./meet-card";
import { Refresh } from "mdi-material-ui";
import { request } from "../../../../utils/axios";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
    },
    content: {
      width: "66.66%",
      fontSize: 14,
      fontWeight: 500,
      color: "#666666",
      lineHeight: "24px",
      whiteSpace: "pre-wrap",
      paddingLeft: "16px",
      paddingRight: "64px",
      marginTop: 0,
      "& b": {
        fontSize: 16,
        color: "#333333",
        fontWeight: 500,
        lineHeight: "40px",
      },
    },
    export: {
      width: "30%",
      position:"sticky",
      top:280,
      left:0,
      height:"80%"
    },
    btn: {
      fontSize: 14,
      fontWeight: 500,
      color: theme.palette.primary.main,
      backgroundColor: "white",
      border: "none",
      variant: "outlined",
      whiteSpace: "pre",
    },
    title: {
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      padding: "0 16px",
      marginBottom: "14px",
    },
    head: {
      fontSize: 16,
      fontWeight: 500,
      color: "#333333",
    },
  }),
);

export interface ExportSource {
  date: string;
  imgShowPath: string;
  insMediaLen: string;
  insSubTitle: string;
  insTitle: string;
  seqId: number;
  id: string;
}

interface TopMeetProps {
  page?: string;
  returnCode?: number;
  returnMsg?: string;
  source: ExportSource[];
}

const Idea: React.FunctionComponent<{ detail?: DetailSource }> = (props) => {
  const classes = useStyles();
  const [seqIds, setAeqIds] = useState<number[]>([]);
  const [meeting, setMeeting] = useState<ExportSource[]>([]);

  function getTopMeeting(seqIds: number[]) {
    request
      .get<TopMeetProps>(`${process.env.NEXT_PUBLIC_WINSIGHTS}/insight/top`, {
        filter: {
          insType: "0",
          seqIds: seqIds,
        },
      })
      .then((data) => {
        if (data.source) {
          setAeqIds(data.source.map((item) => item.seqId));
          setMeeting(data.source);
        }
      });
  }

  useEffect(() => {
    getTopMeeting([]);
  }, []);

  return (
    <Box maxWidth={1348} width={"100%"} className={classes.root}>
      <pre className={classes.content}>
        <div dangerouslySetInnerHTML={{ __html: props.detail?.insContent?.replace(/\u0009/g, " ") as string }} />
      </pre>
      <Box className={classes.export}>
        <Box className={classes.title}>
          <Typography className={classes.head}>热门会议</Typography>
          <Button
            onClick={() => {
              getTopMeeting(seqIds);
            }}
            className={classes.btn}
            startIcon={<Refresh />}
          >
            换一批
          </Button>
        </Box>
        {meeting.length > 0 &&
          meeting.map((item) => {
            return <MeetCard data={item} key={item.seqId} />;
          })}
      </Box>
    </Box>
  );
};

export default Idea;
