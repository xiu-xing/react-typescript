import { Box, fade, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode } from "react";
import { Tag as TagModel, TagBlock as TagBlockModel } from "../../../../../../generated/graphql";
import Space from "../../../../../common/space";
import { ActionModel, getActionHandler } from "../action";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
    },
    title: {
      fontSize: 14,
      color: "#666",
      paddingRight: 8,
      whiteSpace: "nowrap",
      width: 78,
    },
    labelBox: {
      width: "max-content",
      borderRadius: 2,
      padding: 4,
      backgroundColor: fade(theme.palette.primary.main, 0.12),
      color: theme.palette.primary.main,
    },
    label: {
      fontSize: 12,
      lineHeight: 1.2,
      fontWeight: theme.typography.fontWeightMedium,
    },
  }),
);

interface TagBlockProps {
  block: TagBlockModel;
}

const TagBlock: React.FunctionComponent<TagBlockProps> = (props) => {
  const classes = useStyles();
  const { block } = props;

  function TagItem(tag: TagModel): ReactNode {
    switch (tag.__typename) {
      case "TextTag":
        return (
          <Box
            key={tag.name as string}
            className={classes.labelBox}
            onClick={tag.action ? getActionHandler(ActionModel.fromJSON(tag.action)) : undefined}
          >
            <Typography noWrap className={classes.label}>
              {tag.name}
            </Typography>
          </Box>
        );
      case "QuickSearchTag":
      case "RiskTag":
      default:
        break;
    }
  }

  return (
    <div className={classes.root}>
      {block.name && <Typography className={classes.title}>{block.name}</Typography>}
      <Space wrap size={8}>
        {block.tags.map((tag) => TagItem(tag))}
      </Space>
    </div>
  );
};

export default TagBlock;
