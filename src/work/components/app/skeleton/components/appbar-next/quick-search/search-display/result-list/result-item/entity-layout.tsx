import { ListItem, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { CSSProperties, ReactNode } from "react";
import { useClient } from "urql";
import { withAlphaHex } from "with-alpha-hex";
import {
  Action,
  IncrementEntityClickThroughDocument,
  IncrementEntityClickThroughQuery,
  IncrementEntityClickThroughQueryVariables,
  Tag as TagModel,
} from "../../../../../../../../../generated/graphql";
import { ActionModel, onAction } from "../../../../../../../../../models/action/action-next";
import CommonCellTag from "../../../../../../../../common/cell/components/tag";
import EntityAvatar from "../../../../../../../../common/entity-avatar-next/entity-avatar";
import Space from "../../../../../../../../common/space";
import Tag from "../../../../../../../../common/tag";
import HighlightText from "./highlight-text";

const textEllipsisStyle: CSSProperties = {
  whiteSpace: "nowrap",
  overflow: "hidden",
  textOverflow: "ellipsis",
};

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    resultItemRoot: {
      display: "flex",
      alignItems: "start",
      borderRadius: 2,
      minHeight: "min-content",
      flexDirection: "row",
      padding: "8px 16px",
      maxWidth: 1316,
      marginBottom: 8,
    },
    entityLogo: {
      width: 30,
      minWidth: 30,
      height: 30,
      margin: "4px 8px 0px 0px",
    },
    descriptionBox: {
      minWidth: 200,
      height: "100%",
      display: "flex",
      justifyContent: "center",
      flexDirection: "column",
    },
    title: {
      fontSize: 16,
      color: theme.palette.grey[800],
      ...textEllipsisStyle,
    },
    subtitleText: {
      fontSize: 14,
      color: theme.palette.grey[600],
      marginBottom: 4,
      ...textEllipsisStyle,
    },
    description: {
      fontSize: 14,
      marginBottom: 4,
      color: theme.palette.grey[500],
      ...textEllipsisStyle,
    },
    tag: {
      width: "min-content",
      height: 24,
      minWidth: 75,
      maxWidth: 260,
      padding: "2px 4px",
      borderRadius: 2,
      display: "flex",
      flexDirection: "row",
    },
    linkIcon: {
      width: 20,
      maxHeight: 20,
      marginRight: 2,
    },
    tagText: {
      fontSize: 12,
      color: theme.palette.grey[600],
      ...textEllipsisStyle,
    },
  }),
);

interface EntityLayoutProps {
  nodeId?: string;
  searchType?: string;
  title?: string | null;
  subtitle?: string | null;
  description?: string | null;
  logoURI?: string | null;
  tags?: TagModel[] | null;
  highlightTexts?: string[] | null;
  action?: Action | null;
}

export const EntityLayout: React.FunctionComponent<EntityLayoutProps> = (props) => {
  const classes = useStyles();
  const { title, subtitle, description, logoURI, tags, highlightTexts, nodeId, searchType, action } = props;

  const client = useClient();

  function executeIncrementEntityClickThrough() {
    client
      .query<IncrementEntityClickThroughQuery, IncrementEntityClickThroughQueryVariables>(
        IncrementEntityClickThroughDocument,
        { nodeId: nodeId ?? "", searchType: searchType ?? "" },
      )
      .toPromise()
      // eslint-disable-next-line @typescript-eslint/no-empty-function
      .then((result) => {})
      // eslint-disable-next-line @typescript-eslint/no-empty-function
      .catch((error) => {});
  }

  function tagsComponent(tag: TagModel, index: number): ReactNode {
    switch (tag.__typename) {
      case "QuickSearchTag":
        return (
          <CommonCellTag
            key={tag.nameType ?? "" + index}
            className={classes.tag}
            backgroundColor={withAlphaHex("#C2C2C2", 0.22)}
          >
            {tag.icon && <img src={tag.icon ?? ""} className={classes.linkIcon} />}
            <div style={{ display: "flex", overflow: "hidden" }}>
              <Typography className={classes.tagText} style={{ overflow: "visible" }}>
                {tag.nameType + "："}
              </Typography>
              {highlightTexts ? (
                <HighlightText text={tag.matchedName ?? ""} keywords={highlightTexts} className={classes.tagText} />
              ) : (
                <Typography className={classes.tagText}>{tag.matchedName}</Typography>
              )}
            </div>
          </CommonCellTag>
        );
      case "TextTag":
        return <Tag key={(tag.name as string) + index} label={tag.name as string} />;
    }
  }

  return (
    <ListItem
      button
      classes={{ root: classes.resultItemRoot }}
      onClick={onAction(ActionModel.fromJSON(props.action), executeIncrementEntityClickThrough)}
    >
      <EntityAvatar src={logoURI ?? ""} className={classes.entityLogo} />
      <div className={classes.descriptionBox}>
        {highlightTexts ? (
          <HighlightText text={title ?? ""} keywords={highlightTexts} className={classes.title} />
        ) : (
          <Typography className={classes.title}>{title}</Typography>
        )}
        {subtitle && <Typography className={classes.subtitleText}>{subtitle}</Typography>}
        {description && highlightTexts ? (
          <HighlightText text={description ?? ""} keywords={highlightTexts} className={classes.description} />
        ) : (
          description && <Typography className={classes.description}>{description}</Typography>
        )}
        <Space size={12} wrap>
          {tags && tags.length > 0 && tags.map(tagsComponent)}
        </Space>
      </div>
    </ListItem>
  );
};
