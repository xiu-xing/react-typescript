import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import { ArticleListNode } from "../../../generated/graphql";
import FullScreenDialog from "./components/full-screen-dialog";
import ResearchDiagram from "./item";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      flexWrap: "wrap",
    },
  }),
);

interface DiagramListProps {
  list: ArticleListNode[];
}

const DiagramList: React.FunctionComponent<DiagramListProps> = (props) => {
  const classes = useStyles();

  const { list: data } = props;
  const [index, setIndex] = useState(0);
  const [open, setOpen] = useState(false);

  return data ? (
    <div className={classes.root}>
      {data.map((v, k) => {
        return (
          <ResearchDiagram
            key={k}
            data={v}
            onClick={() => {
              setIndex(k);
              setOpen(true);
            }}
          />
        );
      })}
      <FullScreenDialog
        open={open}
        list={data}
        index={index}
        onIndexChange={(i) => setIndex(i)}
        onClose={() => setOpen(false)}
      />
    </div>
  ) : null;
};

export default DiagramList;
