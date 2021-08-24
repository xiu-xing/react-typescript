import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import _ from "lodash";
import React, { ReactNode, useEffect, useState } from "react";
import AppContainer, { FixedTopStyleProps } from "../../../containers/appContainer";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      position: "sticky",
      top: ({ fixedTopHeight }: FixedTopStyleProps): number => fixedTopHeight,
      zIndex: 1,
      padding: "24px 6px 16px",
      backgroundColor: "#fff",
    },
    shadow: {
      boxShadow: "4px 1px 4px 0px rgba(0, 0, 0, 0.2)",
    },
    toolBar: {
      width: 1100,
      minHeight: 30,

      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
    },
    title: {
      fontSize: 20,
    },
  }),
);

interface ToolbarProps {
  title: string | ReactNode;
  action?: ReactNode;
}

const Toolbar: React.FunctionComponent<ToolbarProps> = (props) => {
  const { fixedTopHeight } = AppContainer.useContainer();
  const classes = useStyles({ fixedTopHeight });

  const { title, action } = props;

  const [showShadow, setShowShadow] = useState(false);

  const scrollHandler = _.throttle(() => {
    if (document.documentElement.scrollTop == 0) {
      setShowShadow(false);
    } else {
      setShowShadow(true);
    }
  }, 150);

  useEffect(() => {
    window.addEventListener("scroll", scrollHandler);
    return (): void => {
      window.removeEventListener("scroll", scrollHandler);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div className={clsx(classes.root, showShadow ? classes.shadow : undefined)}>
      <div className={classes.toolBar}>
        {typeof title === "string" ? <Typography className={classes.title}>{title}</Typography> : title}
        {action ? <div>{action}</div> : null}
      </div>
    </div>
  );
};

export default Toolbar;
