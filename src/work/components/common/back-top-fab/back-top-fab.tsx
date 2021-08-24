import { Fab, Fade } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import { ChevronUp } from "mdi-material-ui";
import React, { useCallback, useEffect, useState } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "fixed",
      right: 36,
      bottom: 36,
    },
  }),
);

// interface BackTopFabProps {
// }

const BackTopFab: React.FunctionComponent<{}> = () => {
  const classes = useStyles();
  const [show, setShow] = useState(false);
  const onPageScroll = useCallback(
    _.debounce(() => {
      const viewPortHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
      const scrollTop = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
      if (scrollTop >= (viewPortHeight / 3) * 2) {
        if (!show) {
          setShow(true);
        }
      } else if (show) {
        setShow(false);
      }
    }, 50),
    [show, setShow],
  );
  useEffect(() => {
    window.addEventListener("scroll", onPageScroll, false);
    return (): void => {
      window.removeEventListener("scroll", onPageScroll, false);
    };
  }, [onPageScroll]);
  return (
    <Fade in={show}>
      <Fab
        className={classes.root}
        color="primary"
        onClick={(): void => {
          document.documentElement.scrollTo({
            top: 0,
            behavior: "smooth",
          });
        }}
      >
        <ChevronUp />
      </Fab>
    </Fade>
  );
};

export default BackTopFab;
