import { Button } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { format } from "date-fns";
import _ from "lodash";
import React, { useMemo, useState } from "react";
import { useClient } from "urql";
import {
  ArticleUriQuery,
  ArticleUriQueryVariables,
  ArticleUriDocument,
  ArticleType,
  ArticleListNode,
  FetchType,
} from "../../../generated/graphql";
import { ReportItem } from "../../../models/article/report";
import BasicEllipsisText from "../../common/ellipsis-text/basic-ellipsis-text";
import ArticleContainer from "../container";
import FullScreenDialog from "./components/full-screen-dialog";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "relative",
      padding: "24px 16px",
    },
    title: {
      fontSize: 18,
      color: "#333",
      fontWeight: 500,
      paddingRight: 24,
    },
    description: {
      fontSize: 14,
      color: "#333",
      lineHeight: 1.71,
      marginTop: 8,
      textAlign: "justify",
    },
    imageContainer: {
      display: "flex",
      marginTop: 16,
      height: 220,
      alignItems: "center",
      justifyContent: "center",
    },
    imageBox: {
      overflow: "hidden",
      width: "25%",
      maxWidth: "25%",
      height: "100%",
      marginLeft: 24,
      "&:first-child": {
        marginLeft: 0,
      },
      border: "1px solid #eee",
      borderRadius: 4,
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
    },
    imageStub: {
      width: "25%",
      maxWidth: "25%",
      height: "100%",
      marginLeft: 24,
    },
    image: {
      maxWidth: "100%",
      maxHeight: "100%",
      cursor: "pointer",
      "&:hover": {
        transform: "scale(1.1)",
        transition: "transform .5s",
      },
      transform: "scale(1)",
      transition: "transform .5s",
      objectFit: "contain",
    },
    bottom: {
      marginTop: 16,
      display: "flex",
      justifyContent: "space-between",
      alignItems: "flex-end",
    },
    button: {
      position: "relative",
      boxShadow: "none",
      "&:hover": {
        boxShadow: "none",
      },
    },
    bottomLeft: {
      display: "flex",
      alignItems: "center",
    },
    span: {
      marginRight: 16,
      fontSize: 14,
      lineHeight: 1.71,
      color: "#666",
    },
    favorButton: {
      position: "absolute",
      right: 12,
      top: 24,
    },
  }),
);

// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface ResearchReportItemProps {
  data: ArticleListNode;
}

const ResearchReportItem: React.FunctionComponent<ResearchReportItemProps> = (props) => {
  const classes = useStyles();

  const { data: node } = props;
  const client = useClient();
  const [isLimited, setIsLimited] = useState(false);
  const [index, setIndex] = useState(0);
  const [open, setOpen] = useState(false);

  const container = ArticleContainer.useContainer();

  const data = useMemo(() => {
    if (!node.data) {
      return new ReportItem();
    }
    try {
      const res = ReportItem.fromJSON(JSON.parse(node.data));
      return res;
    } catch (error) {
      return new ReportItem();
    }
  }, [node]);

  async function onItemClick(): Promise<void> {
    if (isLimited) {
      container.setLimitedDialogOpen(true);
      return;
    }
    const res = await client
      .query<ArticleUriQuery, ArticleUriQueryVariables>(ArticleUriDocument, {
        id: data.id,
        articleType: node.articleType as ArticleType,
        articleModuleID: node.articleID || "",
        fetchType: FetchType.FetchTypeRead,
      })
      .toPromise();
    if (res.error) {
      return;
    }
    if (
      res.data?.articleUri?.resourceURI &&
      res.data?.articleUri?.numOfUnusedRead &&
      res.data?.articleUri?.numOfUnusedRead > 0
    ) {
      window.open(`/viewer?id=${data.id}&url=${encodeURIComponent(res.data?.articleUri?.resourceURI)}`);
    } else {
      setIsLimited(true);
      container.setNumberOfUnusedCount(res.data?.articleUri?.numOfUnusedRead ?? undefined);
      container.setNumberOfUsedCount(res.data?.articleUri?.numOfUsedRead ?? undefined);
      container.setLimitedDialogOpen(true);
    }
  }

  const images = data.charts.length > 4 ? data.charts.slice(0, 4) : data.charts;

  return (
    <div className={classes.root}>
      {/* <IconButton className={classes.favorButton} size="small">
        <Star fontSize="small" />
      </IconButton> */}
      <BasicEllipsisText className={classes.title}>{data.title}</BasicEllipsisText>
      <BasicEllipsisText className={classes.description} lineClamp={2}>
        {data.description}
      </BasicEllipsisText>
      {images.length > 0 && (
        <div className={classes.imageContainer}>
          {images.map((v, index) => {
            if (v.uri == "") {
              return null;
            }
            return (
              <div
                key={index}
                className={classes.imageBox}
                onClick={(): void => {
                  setIndex(index);
                  setOpen(true);
                }}
              >
                <img className={classes.image} src={process.env.NEXT_PUBLIC_RESOURCE_PREFIX + v.uri} />
              </div>
            );
          })}
          {_.range(0, 4 - images.length).map((_, index) => {
            return <div key={index} className={classes.imageStub} />;
          })}
        </div>
      )}
      <div className={classes.bottom}>
        <div className={classes.bottomLeft}>
          <span className={classes.span}>{data.publishDate}</span>
          <span className={classes.span}>{data.publishCompanyName}</span>
        </div>
        <Button color="primary" variant="contained" size="small" className={classes.button} onClick={onItemClick}>
          查看原文
        </Button>
      </div>
      <FullScreenDialog
        open={open}
        reportId={data.id}
        images={images}
        index={index}
        onIndexChange={(i) => setIndex(i)}
        onClose={() => setOpen(false)}
      />
    </div>
  );
};

export default ResearchReportItem;
