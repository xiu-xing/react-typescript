import { ListItem, makeStyles, Theme, Typography } from "@material-ui/core";
import { range } from "lodash";
import { AlertCircle } from "mdi-material-ui";
import React, { FunctionComponent } from "react";
import { withAlphaHex } from "with-alpha-hex";
import { Action, Tag as TagModel } from "../../../../../../generated/graphql";
import { ActionModel, onAction } from "../../../../../../models/action/action-next";
import Space from "../../../../../common/space";
import Tag from "../../../../../common/tag";

const useStyles = makeStyles((theme: Theme) => ({
  infoItemRoot: {
    padding: 16,
    flexDirection: "column",
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
}));

interface InfoItemProps {
  tags?: TagModel[];
  title?: string;
  description?: string;
  action?: Action;
  imgSrc?: string;
  footnote?: string;
}

const InfoItem: FunctionComponent<InfoItemProps> = (props) => {
  const classes = useStyles();
  const { title, description, action, imgSrc, tags = [], footnote } = props;

  const tag = (tag: TagModel, index: number) => {
    switch (tag.__typename) {
      case "TextTag":
        return <Tag key={(tag.name as string) + index} label={tag.name as string} />;
      case "RiskTag":
        return (
          <div
            key={index}
            style={{
              background: withAlphaHex("#E00000", 0.16),
              borderRadius: 2,
              padding: "3px 4px",
              display: "inline-flex",
              alignItems: "center",
            }}
          >
            {range(0, Number(tag.level)).map((i) => (
              <AlertCircle key={i} className={classes.alertIcon} />
            ))}
          </div>
        );
      default:
        break;
    }
  };

  return (
    <ListItem button classes={{ root: classes.infoItemRoot }} onClick={onAction(ActionModel.fromJSON(action))}>
      <div className={classes.descriptionBox}>
        <div className={classes.titleBox}>
          <Typography className={classes.title}>{title}</Typography>
          <Typography className={classes.subtitle}>{description}</Typography>
        </div>
        {imgSrc && <img className={classes.img} src={imgSrc} alt="" />}
      </div>
      <div className={classes.bottom}>
        <Space size={12} wrap>
          {tags.map(tag)}
        </Space>
        <span className={classes.footnote}>{footnote}</span>
      </div>
    </ListItem>
  );
};

export default InfoItem;
