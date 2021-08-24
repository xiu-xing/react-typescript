import { Button, Dialog, DialogContent, IconButton, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useMemo, useState } from "react";
import { DiagramItem } from "../../../../models/article/diagram";
import { TransitionProps } from "@material-ui/core/transitions";
import Slide from "@material-ui/core/Slide";
import {
  ArticleListNode,
  ArticleType,
  ArticleUriDocument,
  ArticleUriQuery,
  ArticleUriQueryVariables,
  FetchType,
} from "../../../../generated/graphql";
import { useClient } from "urql";
import ArticleContainer from "../../container";
import { ChevronLeft, ChevronRight, Close } from "mdi-material-ui";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    content: {
      position: "relative",
      display: "flex",
      alignItems: "center",
    },
    container: {
      margin: "auto",
      width: "80%",
    },
    closeButton: {
      position: "absolute",
      right: 24,
      top: 16,
      color: "#666",
    },
    imageBox: {
      maxHeight: 600,
      display: "flex",
      alignItems: "flex-end",
      justifyContent: "center",
    },
    image: {
      maxWidth: "100%",
      maxHeight: 600,
      objectFit: "contain",
    },
    title: {
      fontSize: 18,
      textAlign: "center",
      marginTop: 24,
    },
    preButton: {
      position: "absolute",
      left: "6%",
      top: "50%",
      transform: "translate(0, -50%)",
    },
    nextButton: {
      position: "absolute",
      right: "6%",
      top: "50%",
      transform: "translate(0, -50%)",
    },
    button: {
      position: "absolute",
      right: 48,
      bottom: 48,
      boxShadow: "none",
      "&:hover": {
        boxShadow: "none",
      },
    },
  }),
);

const Transition = React.forwardRef(function Transition(
  props: TransitionProps & { children?: React.ReactElement },
  ref: React.Ref<unknown>,
) {
  return <Slide direction="up" ref={ref} {...props} />;
});

interface FullScreenDialogProps {
  open: boolean;
  index: number;
  list: ArticleListNode[];
  onClose?: () => void;
  onIndexChange?: (index: number) => void;
}

const FullScreenDialog: React.FunctionComponent<FullScreenDialogProps> = (props) => {
  const classes = useStyles();

  const { open, index, list, onClose, onIndexChange } = props;
  const [isLimited, setIsLimited] = useState(false);
  const client = useClient();

  const container = ArticleContainer.useContainer();

  const data = useMemo(() => {
    const node = list[index];
    if (!node || !node.data) {
      return new DiagramItem();
    }
    try {
      const res = DiagramItem.fromJSON(JSON.parse(node.data));
      return res;
    } catch (error) {
      return new DiagramItem();
    }
  }, [index, list]);

  async function onItemClick(): Promise<void> {
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
    <Dialog fullScreen open={open} onClose={onClose} TransitionComponent={Transition}>
      <DialogContent className={classes.content}>
        <div className={classes.container}>
          <IconButton edge="start" color="inherit" onClick={onClose} aria-label="close" className={classes.closeButton}>
            <Close color="inherit" />
          </IconButton>
          <IconButton
            disabled={index <= 0}
            color="primary"
            onClick={() => {
              onIndexChange?.(index - 1);
            }}
            className={classes.preButton}
          >
            <ChevronLeft fontSize="large" />
          </IconButton>
          <IconButton
            disabled={index >= list.length - 1}
            color="primary"
            edge="start"
            onClick={() => {
              onIndexChange?.(index + 1);
            }}
            aria-label="close"
            className={classes.nextButton}
          >
            <ChevronRight fontSize="large" />
          </IconButton>
          <div className={classes.imageBox}>
            <img src={process.env.NEXT_PUBLIC_RESOURCE_PREFIX + data.image} className={classes.image} />
          </div>
          <Typography className={classes.title}>{data.title}</Typography>
          <Button color="primary" variant="contained" size="small" className={classes.button} onClick={onItemClick}>
            查看原文
          </Button>
        </div>
      </DialogContent>
    </Dialog>
  );
};

export default FullScreenDialog;
