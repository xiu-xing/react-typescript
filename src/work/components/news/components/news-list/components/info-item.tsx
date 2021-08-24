import { ListItem, makeStyles, Typography } from "@material-ui/core";
import { useClient } from "@momentum-valley/muse-js";
import clsx from "clsx";
import React, { FunctionComponent } from "react";
import TimeAgo from "timeago-react";
import { getResourceUrl } from "../../../../../utils/url";
import { NewsEntityProps } from "../../../newsContainer";
import CommonCellTag from "./cell/components/Tag";
const useStyles = makeStyles({
  infoItemRoot: {
    padding: "13px 16px",
    flexDirection: "column",
  },
  descriptionBox: {
    width: "100%",
    display: "flex",
    justifyContent: "space-between",
    marginBottom: "1rem",
  },
  titleBox: {
    marginRight: 24,
  },
  title: {
    display: "-webkit-box",
    WebkitBoxOrient: "vertical",
    overflow: "hidden",
    WebkitLineClamp: 2,
    color: "#333333",
    fontWeight: 500,
    lineHeight: "26px",
    fontSize: 16,
    marginBottom: 8,
    cursor: "pointer",
  },
  subtitle: {
    color: "#666666",
    lineHeight: "24px",
    fontSize: 12,
  },
  img: {
    width: 120,
    height: 80,
    objectFit: "cover",
    pointerEvents: "none",
  },
  tagBox: {
    width: "100%",
    display: "flex",
    justifyContent: "space-between",
  },
  infoItemBox: {
    display: "flex",
    flexWrap: "wrap",
    maxWidth: "calc(100% - 6rem)",
  },
  publishedTime: {
    fontSize: 12,
    color: "#989898",
  },
});

interface InfoItemProps {
  tags: string[];
  title?: string | null;
  content?: string | null;
  publishedTime?: string | null;
  link?: string | null;
  imgSrc?: string | null;
  entities?: NewsEntityProps[];
  keywords?: string[];
  classes?: {
    tag?: string;
  };
}

const InfoItem: FunctionComponent<InfoItemProps> = ({ tags, ...props }) => {
  const classes = useStyles();
  const muse = useClient();
  const tagClasses = props.classes;

  const clickHandler = (): void => {
    if (props.entities) {
      muse.sendTrackingEvent("news.item_tap", {
        entities: props.entities.map((e) => ({
          id: e.id,
          type: e.entityType,
        })),
      });
    }

    if (process.browser && props.link) {
      window.open(props.link);
    }
  };

  return (
    <ListItem button classes={{ root: classes.infoItemRoot }} onClick={clickHandler}>
      <div className={classes.descriptionBox}>
        <div className={classes.titleBox}>
          <Typography className={classes.title}>{props.title}</Typography>
          <Typography className={classes.subtitle}>{props.content}</Typography>
        </div>

        <div>{props.imgSrc ? <img className={classes.img} src={getResourceUrl(props.imgSrc)} alt="" /> : null}</div>
      </div>

      <div className={classes.tagBox}>
        <div className={classes.infoItemBox}>
          {(tags ?? []).map((tag, index) => (
            <CommonCellTag key={tag + index} className={clsx(tagClasses?.tag)} tag={tag} />
          ))}
        </div>
        <div>
          <span className={classes.publishedTime}>
            {props.publishedTime && <TimeAgo datetime={props.publishedTime} locale="zh_CN" />}
          </span>
        </div>
      </div>
    </ListItem>
  );
};

export default InfoItem;
