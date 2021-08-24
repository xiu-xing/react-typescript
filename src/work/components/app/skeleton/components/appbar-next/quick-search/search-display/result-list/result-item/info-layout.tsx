import { ListItem } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import { Action, QuickSearchTag, Tag as TagModel, TextTag } from "../../../../../../../../../generated/graphql";
import { ActionModel, onAction } from "../../../../../../../../../models/action/action-next";
import Space from "../../../../../../../../common/space";
import Tag from "../../../../../../../../common/tag";
import HighlightText from "./highlight-text";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    infoItemRoot: {
      padding: 16,
      flexDirection: "column",
      maxWidth: 1316,
      minHeight: "min-content",
    },
    descriptionBox: {
      width: "100%",
      display: "flex",
      justifyContent: "space-between",
      marginBottom: 8,
    },
    titleBox: {
      marginRight: 24,
      minWidth: 50,
      display: "flex",
      flexDirection: "column",
    },
    title: {
      color: theme.palette.grey[800],
      fontWeight: theme.typography.fontWeightRegular,
      lineHeight: "24px",
      fontSize: 16,
      marginBottom: 8,
      cursor: "pointer",
      whiteSpace: "nowrap",
      overflow: "hidden",
      textOverflow: "ellipsis",
    },
    subtitle: {
      color: theme.palette.grey[600],
      lineHeight: "24px",
      fontSize: 14,
      whiteSpace: "nowrap",
      overflow: "hidden",
      textOverflow: "ellipsis",
      // textOverflow: "-o-ellipsis-lastline",
      // "-webkit-line-clamp":2,
      // "-webkit-box-orient": "vertical",
      // display: "-webkit-box"
    },
    img: {
      width: 120,
      height: 80,
      objectFit: "cover",
      pointerEvents: "none",
    },
    alertIcon: {
      fontSize: "16px",
      color: "#E00000",
    },
    bottom: {
      display: "flex",
      width: "100%",
      justifyContent: "space-between",
      alignItems: "center",
    },
    footnote: {
      fontSize: 12,
      lineHeight: 2,
      color: theme.palette.grey[500],
    },
    tags: {
      width: "min-content",
      height: 24,
      minWidth: 75,
      margin: "8px 0px 0px",
      padding: "2px 4px",
      borderRadius: 2,
      display: "flex",
      flexDirection: "row",
    },
  }),
);

interface InfoLayoutProps {
  title?: string | null;
  subtitle?: string | null;
  tags?: TagModel[];
  footnote?: string | null;
  imageURI?: string | null;
  highlightTexts?: string[] | null;
  action?: Action | null;
}

export const InfoLayout: React.FunctionComponent<InfoLayoutProps> = (props) => {
  const classes = useStyles();
  const { title, subtitle, tags, imageURI, footnote, highlightTexts, action } = props;

  function tagComponent(tag: TagModel, index: number): ReactNode {
    if (tag.__typename === "TextTag") {
      const textTag = tag as TextTag;
      return <Tag key={(textTag.name as string) + index} label={textTag.name as string} />;
    }
    if (tag.__typename === "QuickSearchTag") {
      const textTag = tag as QuickSearchTag;
      return <Tag key={(textTag.matchedName as string) + index} label={textTag.matchedName as string} />;
    }
  }

  return (
    <ListItem button classes={{ root: classes.infoItemRoot }} onClick={onAction(ActionModel.fromJSON(action))}>
      <div className={classes.descriptionBox}>
        <div className={classes.titleBox}>
          <HighlightText text={title ?? ""} keywords={highlightTexts} className={classes.title} />
          <HighlightText text={subtitle ?? ""} keywords={highlightTexts} className={classes.subtitle} />
        </div>
        {imageURI && <img className={classes.img} src={imageURI} />}
      </div>
      <div className={classes.bottom}>
        <Space size={12} wrap>
          {tags && tags.length > 0 ? tags.map(tagComponent) : <div />}
        </Space>
        <span className={classes.footnote}>{footnote}</span>
      </div>
    </ListItem>
  );
};
