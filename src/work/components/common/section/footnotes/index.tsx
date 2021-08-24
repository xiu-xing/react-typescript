import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { Footnote } from "../../../../generated/graphql";

const useStyles = makeStyles(() =>
  createStyles({
    gridContent: {
      display: "grid",
      gridAutoFlow: "row",
      gridColumnGap: "16px",
      gridTemplateColumns: "10px 1fr",
      maxWidth: "250px",
    },
    root: {
      marginTop: 16,
    },
    text: {
      color: "#666",
      fontSize: "12px",
      wordBreak: "break-word",
      marginRight: "5px",
    },
  }),
);

interface FootnotesProps {
  footnotes: Footnote[];
}

const Footnotes: React.FunctionComponent<FootnotesProps> = (props) => {
  const classes = useStyles();
  const { footnotes } = props;

  const item = (footnote: Footnote, index: number) => {
    if (footnote.key) {
      return (
        <div key={index + footnote.id} className={classes.gridContent}>
          {footnote.key && <sup className={classes.text}>{footnote.key}</sup>}
          <Typography className={classes.text}>{footnote.description}</Typography>
        </div>
      );
    }
    return (
      <div key={index + footnote.id} className={classes.root}>
        <Typography className={classes.text}>{footnote.description}</Typography>
      </div>
    );
  };

  return <div>{footnotes.map(item)}</div>;
};

export default Footnotes;
