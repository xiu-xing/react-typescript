import React, {
  useRef,
  FunctionComponent,
  useState,
  useCallback,
  useEffect,
  HTMLProps,
} from "react";
import { throttle, has } from "lodash";
import { ButtonBase } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import { ChevronRight, ChevronLeft } from "@material-ui/icons";
import clsx from "clsx";

export const useStyles = makeStyles({
  cards: {
    height: 254,
    display: "flex",
    flexDirection: "row",
    overflowY: "hidden",
    position: "relative",
  },
  leftShadow: {
    width: 8,
    right: 0,
    height: "100%",
    position: "absolute",
    background: "linear-gradient(left, rgba(255, 255, 255, 0), #ccc7c76e)",
  },
  rightShadow: {
    width: 8,
    left: 0,
    height: "100%",
    position: "absolute",
    background: "linear-gradient(right, rgba(255, 255, 255, 0), #ccc7c76e)",
  },
  cardsInnerContainer: {
    height: "100%",
    display: "flex",
    overflowX: "scroll",
    overflowY: "hidden",
    flexDirection: "row",
    alignItems: "center",
    scrollSnapType: "x mandatory",
    scrollbarWidth: "none",
    "-ms-overflow-style": "none",
    "&::-webkit-scrollbar": {
      display: "none",
    },
  },
  cardRoot: {
    width: 20,
    height: 234,
    margin: "0 20px 0 0",
    flexShrink: 0,
    backgroundColor: "#f8f8f8",
  },
  leftIcon: {
    top: "42%",
    left: 12,
    width: 32,
    height: 32,
    zIndex: 3,
    borderRadius: 20,
    position: "absolute",
    backgroundColor: "#ffffff",
    boxShadow:
      "0px 1px 18px 0px rgba(0,0,0,0.12),0px 6px 10px 0px rgba(0,0,0,0.14),0px 3px 5px -1px rgba(0,0,0,0.2);",
  },
  rightIcon: {
    top: "42%",
    right: 12,
    width: 32,
    height: 32,
    zIndex: 3,
    borderRadius: 20,
    position: "absolute",
    backgroundColor: "#ffffff",
    boxShadow:
      "0px 1px 18px 0px rgba(0,0,0,0.12),0px 6px 10px 0px rgba(0,0,0,0.14),0px 3px 5px -1px rgba(0,0,0,0.2);",
  },
});

interface ScrollBoxProps extends HTMLProps<HTMLDivElement> {
  // when card scroll to container out, whether show shadow
  hasOverShadow?: number;
  // left and right padding  
  hasPadding?: boolean;
}

const ScrollBox: FunctionComponent<ScrollBoxProps> = (props) => {
    const { hasOverShadow = false, hasPadding } = props;
  const classes = useStyles({ hasPadding });
  const [isAtEnd, setIsAtEnd] = useState<boolean | void>();
  const [hasScrolling, setHasScrolling] = useState<boolean | void>();
  const [isAtBeginning, setIsAtBeginning] = useState<boolean | void>();

  const containerRef = useRef<HTMLDivElement>(null);

  const goTo = (direction: "left" | "right"): void => {
    const container = containerRef.current;

    if (!container) {
      return;
    }

    const walkInPx = container.offsetWidth;
    let scrollLeft = container.scrollLeft;

    if (direction === "left") {
      scrollLeft = scrollLeft - walkInPx + 80;
    } else {
      scrollLeft = scrollLeft + walkInPx - 80;
    }

    if (container.scrollTo) {
      container.scrollTo({
        left: scrollLeft,
        behavior: "smooth",
      });
    } else {
      // IE fallback
      container.scrollLeft = scrollLeft;
    }
  };

  const checkBoundaries = useCallback(
    throttle(() => {
      if (containerRef.current) {
        const { scrollLeft, scrollWidth, offsetWidth } = containerRef.current;

        if (scrollWidth > offsetWidth) {
          setHasScrolling(true);
        } else {
          setHasScrolling(false);
        }

        if (scrollLeft === 0) {
          setIsAtBeginning(true);
        } else {
          setIsAtBeginning(false);
        }

        if (Math.ceil(scrollLeft + offsetWidth) === scrollWidth) {
          setIsAtEnd(true);
        } else {
          setIsAtEnd(false);
        }
      }
    }, 25),
    [containerRef.current]
  );

  useEffect(() => {
    if (containerRef.current) {
      checkBoundaries();
      containerRef.current.addEventListener("scroll", checkBoundaries);
    }

    return (): void => {
      if (containerRef.current) {
        // eslint-disable-next-line react-hooks/exhaustive-deps
        containerRef.current.removeEventListener("scroll", checkBoundaries);
      }
    };
  }, [checkBoundaries]);

  const ShiftButton: FunctionComponent<{ direction: "left" | "right" }> = ({
    direction,
  }) => {
    return (
      <ButtonBase
        aria-label={`Shift ${direction}`}
        classes={{
          root: direction === "left" ? classes.leftIcon : classes.rightIcon,
        }}
        onClick={(): void => {
          goTo(direction);
        }}
      >
        {direction === "left" ? (
          <ChevronLeft color="primary" fontSize="small" />
        ) : (
          <ChevronRight color="primary" fontSize="small" />
        )}
      </ButtonBase>
    );
  };

  return (
    <div className={clsx(classes.cards, props.className)}>
      {hasOverShadow && hasScrolling && isAtEnd === false && <div className={classes.leftShadow} />}
      {props.children && hasScrolling && isAtBeginning === false &&  <ShiftButton direction="left" />}
      <div ref={containerRef} className={classes.cardsInnerContainer}>
        {props.children}
      </div>
      {props.children && hasScrolling && isAtEnd === false && <ShiftButton direction="right" />}
      {hasOverShadow && hasScrolling && isAtBeginning === false && <div className={classes.rightShadow} />}
    </div>
  );
};

export default ScrollBox;
