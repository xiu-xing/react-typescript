import { Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { Tag as TagModel, TagBlock as TagBlockModel } from "../../../../../generated/graphql";
import { ActionModel, onAction } from "../../../../../models/action/action-next";
import Space from "../../../space";
import Tag from "../../../tag";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "row",
    },
    title: {
      whiteSpace: "nowrap",
      marginRight: "16px",
      fontSize: "14px",
      color: "#666",
    },
    modalTag: {
      height: 20,
    },
  }),
);

interface TagBlockProp {
  model?: TagBlockModel;
  modal?: boolean;
}

const TagBlock: React.FunctionComponent<TagBlockProp> = (props) => {
  const classes = useStyles();
  const { model, modal } = props;

  const tag = (tag: TagModel, index: number) => {
    switch (tag.__typename) {
      case "TextTag":
        return (
          <Tag
            key={(tag.name as string) + index}
            label={tag.name as string}
            onClick={onAction(ActionModel.fromJSON(tag.action))}
            style={{ cursor: tag.action ? "pointer" : "default" }}
          />
        );

      default:
        break;
    }
  };

  return (
    <div className={classes.root}>
      <Typography
        className={classes.title}
        style={{
          width: modal ? 136 : "",
          minWidth: modal ? 136 : "",
        }}
      >
        {model?.name}
      </Typography>
      <Space wrap size={12}>
        {model?.tags.map(tag)}
      </Space>
    </div>
  );
};

export default TagBlock;
