import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { useEffect, useRef, useState } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    cellTitle: {
      fontSize: 14,
      color: "#333",
      lineHeight: "24px",
      paddingBottom: 12,
    },
    hidden: {
      overflow: "hidden",
      display: "-webkit-box",
      "-webkit-line-clamp": 1,
      "-webkit-box-orient": "vertical",
    },
  }),
);

interface AdaptiveTextProps {
  value: string;
}

const AdaptiveText: React.FunctionComponent<AdaptiveTextProps> = (props) => {
  const classes = useStyles();
  const { value } = props;
  const [titleFontSize, setTitleFontSize] = useState(14);
  const areaRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (areaRef.current) {
      if (areaRef.current.clientHeight < areaRef.current.scrollHeight) {
        setTitleFontSize((oldFontSize) => oldFontSize - 2);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [areaRef.current]);

  return (
    <Typography
      ref={areaRef}
      className={clsx(classes.cellTitle, titleFontSize == 12 ? "" : classes.hidden)}
      style={{ fontSize: titleFontSize ?? 14 }}
    >
      {value}
    </Typography>
  );
};

export default AdaptiveText;
