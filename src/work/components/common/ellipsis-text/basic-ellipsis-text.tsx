import { Typography, TypographyProps } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { useEffect, useRef, useState } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "-webkit-box",
      WebkitBoxOrient: "vertical",
      textOverflow: "ellipsis",
      overflow: "hidden",
      wordBreak: "break-all",
    },
  }),
);

interface BasicEllipsisTextProps extends TypographyProps {
  lineClamp?: number;
  showTooltip?: boolean;
}

const BasicEllipsisText: React.FunctionComponent<BasicEllipsisTextProps> = (props) => {
  const classes = useStyles();

  const { lineClamp, showTooltip, children, className, ...restProps } = props;

  const [tooltip, setTooltip] = useState<string>();
  const rootRef = useRef<HTMLParagraphElement>(null);

  useEffect(() => {
    if (!showTooltip) {
      return;
    }
    if (
      (rootRef.current?.scrollHeight ?? 0) > (rootRef.current?.clientHeight ?? 0) ||
      (rootRef.current?.scrollWidth ?? 0) > (rootRef.current?.clientWidth ?? 0)
    ) {
      setTooltip(rootRef.current?.innerText);
      return;
    }
    setTooltip(undefined);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <Typography
      className={clsx(classes.root, className)}
      style={{
        WebkitLineClamp: lineClamp || 1,
      }}
      title={tooltip}
      {...restProps}
      ref={rootRef}
    >
      {children}
    </Typography>
  );
};

export default BasicEllipsisText;
