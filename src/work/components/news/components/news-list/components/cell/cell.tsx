import { Typography } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import React, { HTMLProps } from "react";

const useStyles = makeStyles({
  root: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    padding: "12px 16px",
  },
  entityInfo: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    maxWidth: "50%",
    margin: "10px 0",
  },
  title: {
    display: "-webkit-box",
    WebkitBoxOrient: "vertical",
    overflow: "hidden",
    fontSize: 16,
  },
  image: {
    width: 30,
    height: 30,
    objectFit: "cover",
    borderRadius: 4,
    marginRight: 8,
  },
  topRightCorner: {
    maxWidth: "50%",
    display: "flex",
    alignItems: "center",
  },
  newsPublishedInfo: {
    display: "flex",
    flexDirection: "column",
    justifyContent: "center",
    marginRight: 17,
    fontSize: 12,
    lineHeight: 2,
  },
  expand: {
    transform: "rotateZ(-180deg)",
    transition: "all 0.3s ease-out",
  },
  collapse: {
    transition: "all 0.3s ease-out",
  },
  countNumber: {
    marginLeft: 12,
    fontWeight: 500,
  },
  disabled: {
    color: "#bcbcbcde",
  },
});

interface CommonCellProps {
  imgSrc?: string;
  title?: string;
  titleLineLimit?: number;
  subtitle?: string;
  tags?: HTMLProps<HTMLDivElement>[];
}

const CommonCell: React.FunctionComponent<CommonCellProps> = (props) => {
  const classes = useStyles();
  const { title, titleLineLimit } = props;

  return (
    <div className={classes.root}>
      <div className={classes.entityInfo}>
        {props.imgSrc && <img className={classes.image} src={props.imgSrc} alt="" />}
        <Typography className={classes.title} style={{ WebkitLineClamp: titleLineLimit ? titleLineLimit : 1 }}>
          {title}
        </Typography>
      </div>

      <div className={classes.newsPublishedInfo}>
        <span>今日</span>
        <div>
          <span>新闻</span>
          <span className={classes.countNumber}>123</span>
        </div>
      </div>
    </div>
  );
};

export default CommonCell;
