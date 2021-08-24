import { createStyles, makeStyles } from "@material-ui/core";
import nanoid from "nanoid";
import React, { useMemo } from "react";
import { ProgressNode } from "../../../../../generated/graphql";
import ProgressBarItem from "./item";

const useStyles = makeStyles(() =>
  createStyles({
    onData: {
      width: "100%",
      minHeight: 100,
      fontSize: 16,
      color: "#666",
      display: "grid",
      placeItems: "center",
    },
  }),
);

interface ProgressBarProp {
  nodes?: ProgressNode[];
}

const ProgressBar: React.FunctionComponent<ProgressBarProp> = (props) => {
  const classes = useStyles();
  const { nodes } = props;

  const component = useMemo(() => {
    if (nodes && nodes.length > 0) {
      return (
        <>
          {nodes?.map((v, i) => {
            if (i < 50) {
              return <ProgressBarItem key={nanoid(8)} hasArrow={i !== 0} node={v} />;
            }
          })}
        </>
      );
    }
    return <div className={classes.onData}>暂无数据</div>;
  }, [nodes]);

  return component;
};

export default ProgressBar;
