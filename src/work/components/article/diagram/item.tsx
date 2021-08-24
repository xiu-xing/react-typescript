import { Button } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useClient } from "urql";
import React, { useMemo, useState } from "react";
import { DiagramItem } from "../../../models/article/diagram";
import BasicEllipsisText from "../../common/ellipsis-text/basic-ellipsis-text";
import {
  ArticleListNode,
  ArticleType,
  ArticleUriDocument,
  ArticleUriQuery,
  ArticleUriQueryVariables,
  FetchType,
} from "../../../generated/graphql";
import ArticleContainer from "../container";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      padding: "24px 16px",
      maxWidth: 300,
      width: 300,
      overflow: "hidden",
      cursor: "pointer",
    },
    title: {
      fontSize: 18,
      color: "#333",
      fontWeight: 500,
      height: 52,
      maxWidth: "100%",
    },
    imageContainer: {
      marginTop: 16,
      height: 220,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      border: "1px solid #eee",
      borderRadius: 4,
    },
    imageBox: {
      maxHeight: "100%",
      marginTop: 16,
      overflow: "hidden",
      textAlign: "center",
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
    },
    bottom: {
      marginTop: 16,
      display: "flex",
      flexDirection: "row",
      justifyContent: "space-between",
      alignItems: "center",
    },
    span: {
      marginRight: 16,
      fontSize: 14,
      lineHeight: 1.71,
      color: "#666",
    },
    buttonContainer: {
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
    },
    favorButton: {},
    button: {
      boxShadow: "none",
      "&:hover": {
        boxShadow: "none",
      },
    },
  }),
);

interface ResearchDiagramProps {
  data: ArticleListNode;
  onClick?: () => void;
}

const ResearchDiagram: React.FunctionComponent<ResearchDiagramProps> = (props) => {
  const classes = useStyles();
  const client = useClient();
  const { data: node, onClick } = props;
  const [isLimited, setIsLimited] = useState(false);

  const container = ArticleContainer.useContainer();

  const data = useMemo(() => {
    if (!node.data) {
      return new DiagramItem();
    }
    try {
      const res = DiagramItem.fromJSON(JSON.parse(node.data));
      return res;
    } catch (error) {
      return new DiagramItem();
    }
  }, [node]);

  async function onItemClick(event: React.MouseEvent<HTMLButtonElement>): Promise<void> {
    event.stopPropagation();
    if (isLimited) {
      container.setLimitedDialogOpen(true);
      return;
    }
    const res = await client
      .query<ArticleUriQuery, ArticleUriQueryVariables>(ArticleUriDocument, {
        id: data.id,
        articleType: ArticleType.ArticleTypeResearchReport,
        articleModuleID: "research.research_report",
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

  return (
    <div className={classes.root} onClick={onClick}>
      <BasicEllipsisText className={classes.title} lineClamp={2}>
        {data.title}
      </BasicEllipsisText>
      <div className={classes.imageContainer}>
        <div className={classes.imageBox}>
          <img src={process.env.NEXT_PUBLIC_RESOURCE_PREFIX + data.image} className={classes.image} />
        </div>
      </div>
      <div className={classes.bottom}>
        <div>
          <span className={classes.span}>{data.publishDate}</span>
        </div>
        <div className={classes.buttonContainer}>
          <Button color="primary" variant="contained" size="small" className={classes.button} onClick={onItemClick}>
            查看原文
          </Button>
          {/* <IconButton className={classes.favorButton} size="small">
            <Star fontSize="small" />
          </IconButton> */}
        </div>
      </div>
    </div>
  );
};

export default ResearchDiagram;
