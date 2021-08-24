import { Popover } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
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
    paper: {
      pointerEvents: "auto",
    },
    popover: {
      pointerEvents: "none",
    },
    popoverContent: {
      display: "flex",
      flexDirection: "row",
      flexWrap: "wrap",
      maxWidth: 450,
      width: "min-content",
      minWidth: 300,
      padding: 8,
    },
    ellipsis: {
      width: 8,
      height: "100%",
      position: "absolute",
      right: 20,
      top: 0,
    },
  }),
);

interface EllipsisTextProps {
  lineClamp: number;
}

const EllipsisText: React.FunctionComponent<EllipsisTextProps> = (props) => {
  const classes = useStyles();
  const [popoverOpen, setPopoverOpen] = useState(false);
  const [showModal, setShowModal] = useState(false);
  const { lineClamp, children } = props;
  const ellipsisRef = useRef<HTMLDivElement | null>(null);
  const rootRef = useRef<HTMLDivElement | null>(null);

  useEffect(() => {
    if (
      (rootRef.current?.scrollHeight ?? 0) > (rootRef.current?.clientHeight ?? 0) ||
      (rootRef.current?.scrollWidth ?? 0) > (rootRef.current?.clientWidth ?? 0)
    ) {
      setShowModal(true);
      return;
    }
    setShowModal(false);
  }, []);

  const resizeHandler = _.debounce(() => {
    if (
      (rootRef.current?.scrollHeight ?? 0) > (rootRef.current?.clientHeight ?? 0) ||
      (rootRef.current?.scrollWidth ?? 0) > (rootRef.current?.clientWidth ?? 0)
    ) {
      setShowModal(true);
      return;
    }
    setShowModal(false);
  }, 300);

  useEffect(() => {
    window.addEventListener("resize", resizeHandler);
    return (): void => {
      window.removeEventListener("resize", resizeHandler);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <>
      <div
        ref={rootRef}
        className={classes.root}
        style={{
          WebkitLineClamp: lineClamp,
        }}
      >
        {children}
      </div>
      {showModal ? (
        <div
          ref={ellipsisRef}
          className={classes.ellipsis}
          onMouseEnter={(): void => setPopoverOpen(true)}
          onMouseLeave={(): void => setPopoverOpen(false)}
        />
      ) : null}

      <Popover
        disableScrollLock
        hideBackdrop
        disableRestoreFocus
        className={classes.popover}
        classes={{
          paper: classes.paper,
        }}
        anchorEl={ellipsisRef.current}
        anchorOrigin={{
          vertical: "top",
          horizontal: "left",
        }}
        transformOrigin={{
          vertical: "top",
          horizontal: "right",
        }}
        open={popoverOpen}
        onClose={(): void => setPopoverOpen(false)}
      >
        <div
          className={classes.popoverContent}
          onMouseOver={(): void => {
            setPopoverOpen(true);
          }}
          onMouseOut={(): void => {
            setPopoverOpen(false);
          }}
        >
          {children}
        </div>
      </Popover>
    </>
  );
};

export default EllipsisText;
