import { Box, createStyles, makeStyles } from "@material-ui/core";
import ImageList from "./components/image-list";
import Typography from "@material-ui/core/Typography";
import ExpertItem from "./components/expert-item";
import React, { useRef } from "react";
import Process from "./components/process";
import SimpleBar from "simplebar-react";
import { useEffect, useState } from "react";
import { request } from "../../../utils/axios";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "0 12px",
    },
    content_title: {
      fontSize: 18,
      fontWeight: 500,
      color: "#333333",
      marginTop: "32px",
    },
    content: {
      maxWidth: 1044,
      fontSize: 14,
      color: "#333333",
      marginTop: "8px",
      lineHeight: "24px",
    },
    process: {
      display: "flex",
      alignItems: "center",
      margin: "40px 0",
    },
    process_title: {
      fontSize: 16,
      fontWeight: 500,
      color: "#333333",
      marginRight: "8px",
    },
    export: {
      display: "flex",
      flexWrap: "wrap",
      justifyContent: "space-between",
    },
    bar: {
      height: "160px",
    },
  }),
);

interface Source {
  id: string;
  bannerPath: string;
  experts: Exports[];
  listPath: string;
  popBack: string;
  popSubject: string;
  popId: string;
}

export interface Exports {
  advAnonymous: number;
  expGoodAt: string;
  expImg: string;
  expIntroduce: string;
  expSummary: string;
  expertName: string;
  id: string;
  popExpId: number;
}

export interface ActivityData {
  page?: string;
  returnCode?: number;
  returnMsg?: string;
  source: Source;
}

export interface ImageSource {
  id?: string;
  listPath?: string;
  popId?: string;
  popSubject?: string;
}

export interface ContentProps {
  title: string;
  id: string;
}
interface ActivityImageResponse {
  page?: string;
  returnCode?: number;
  returnMsg?: string;
  source: ImageSource[];
}

const TrendingExpert: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const [activityData, setActivityData] = useState<Source>();
  const [historyImage, setHistoryImage] = useState<ImageSource[]>([]);
  const scrollElementRef = useRef<SimpleBar | null>(null);
  const [expertDemandContent, setExpertDemandContent] = useState<ContentProps[]>([]);

  function getActivityImage(actId?: string) {
    request
      .get<ActivityImageResponse>(`${process.env.NEXT_PUBLIC_WINSIGHTS}/activity/history`, {
        i18n: "zh",
        actIds: `[${actId}]`,
      })
      .then((data) => {
        if (data.source) {
          setHistoryImage((historyImage) => historyImage?.concat(data.source));
        }
      });
  }

  function getActivityData(actId?: string) {
    request
      .get<ActivityData>(`${process.env.NEXT_PUBLIC_WINSIGHTS}/activity`, {
        i18n: "zh",
        actId: actId,
      })
      .then((data) => {
        if (data.source) {
          setActivityData(data.source);
          if (data.source.experts) {
            data.source.experts.forEach((item) => {
              setExpertDemandContent((expertDemandContent) =>
                expertDemandContent.concat({ title: item.expSummary, id: item.id }),
              );
            });
          }
        }
        if (historyImage.length < 1) {
          setHistoryImage((historyImage) =>
            historyImage?.concat([
              {
                listPath: data.source?.listPath,
                id: data.source?.id,
                popSubject: data.source?.popSubject,
                popId: data.source?.popId,
              },
            ]),
          );
          getActivityImage(data.source?.id);
        }
      });
  }

  function getActId(id: string) {
    if (id != undefined) {
      getActivityData(id);
    }
  }

  useEffect(() => {
    getActivityData();
  }, []);

  return (
    <SimpleBar style={{ height: "100%" }} ref={scrollElementRef}>
      <Box width="100%" display="flex" justifyContent="center">
        <Box maxWidth={1348} width={"100%"} className={classes.root}>
          <SimpleBar className={classes.bar}>
            <ImageList images={historyImage} id={activityData?.id} getActId={getActId} />
          </SimpleBar>
          <Typography className={classes.content_title}>{activityData?.popSubject}</Typography>
          <Typography className={classes.content}>{activityData?.popBack}</Typography>
          <Box className={classes.process}>
            <Typography className={classes.process_title}>约访流程</Typography>
            <Process />
          </Box>
          <Box className={classes.export}>
            {activityData?.experts &&
              activityData?.experts.length > 0 &&
              activityData?.experts.map((item, index) => {
                return (
                  <ExpertItem
                    key={item.id}
                    data={item}
                    index={index}
                    proId={activityData.popId}
                    content={expertDemandContent}
                  />
                );
              })}
          </Box>
        </Box>
      </Box>
    </SimpleBar>
  );
};

export default TrendingExpert;
