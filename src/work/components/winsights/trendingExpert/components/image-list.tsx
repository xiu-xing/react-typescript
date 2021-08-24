import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import { ImageSource } from "..";

const useStyles = makeStyles((theme) => ({
  root: {
    backgroundColor: theme.palette.background.paper,
  },
  imageList: {
    display: "flex",
  },
  item: {
    width: "260px !important",
    height: "146px !important",
    marginRight: "36px",
    margin: "2px 0",
    position: "relative",
    cursor: "pointer",
  },
  img: {
    width: "250px",
    height: "146px",
    objectFit: "cover",
    objectPosition: "center",
    borderRadius: "4px",
  },
  currentImage: {
    color: "#FFFFFF",
    fontSize: "32px",
    lineHeight: "34px",
    fontFamily: "YouSheBiaoTiHei",
    fontWeight: 400,
    textAlign: "center",
    wordBreak: "break-all",
    wordWrap: "break-word",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    padding: "10px",
    width: "250px",
    height: "146px",
    borderRadius: "4px",
    position: "absolute",
    left: 0,
    top: 0,
    backgroundColor: "rgba(0, 0, 0, 0.8)",
  },
}));

interface SingleLineImageListProps {
  images: ImageSource[];
  getActId: Function;
  id?: string;
}

const SingleLineImageList: React.FunctionComponent<SingleLineImageListProps> = (props) => {
  const classes = useStyles();

  function handleImage(actId?: string) {
    props.getActId(actId);
  }

  return (
    <div className={classes.root}>
      <div className={classes.imageList}>
        {props.images.length > 0 &&
          props.images.map((item, index) => (
            <div
              className={classes.item}
              key={index}
              onClick={() => {
                handleImage(item.id);
              }}
            >
              <img src={`${process.env.NEXT_PUBLIC_WINSIGHTS}/${item.listPath}`} className={classes.img} />
              <div className={`${item.id == props.id ? "" : classes.currentImage}`}>
                {item.id == props.id ? "" : item.popSubject?.split("——")[1]}
              </div>
            </div>
          ))}
      </div>
    </div>
  );
};
export default SingleLineImageList;
