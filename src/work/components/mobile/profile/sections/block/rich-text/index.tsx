import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { ReactNode, useMemo } from "react";
import RichTextItem from "./item";
import { RichTextModel } from "./model";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      whiteSpace: "normal",
      display: "grid",
    },
    rows: {
      display: "flex",
      flexDirection: "row",
      flexWrap: "wrap",
      alignItems: "center",
    },
  }),
);

interface RichTextProps {
  models?: RichTextModel[];
}

const RichText: React.FunctionComponent<RichTextProps> = (props) => {
  const classes = useStyles();
  const { models } = props;

  const rows = useMemo<React.ReactNode[][]>(() => {
    const rowNodes: ReactNode[][] = [];
    let rowChilde: ReactNode[] = [];

    models &&
      models.length > 0 &&
      models.forEach((model, index) => {
        switch (model.pattern) {
          case "break_line":
            rowNodes.push(Array.from(rowChilde));
            rowChilde = [];
            break;
          default:
            rowChilde.push(<RichTextItem key={index} model={model} />);
            break;
        }
      });

    rowNodes.push(rowChilde);
    return rowNodes;
  }, [models]);

  function content() {
    if (!models || models.length === 0) {
      return <Typography>-</Typography>;
    }

    return rows.map((rowChildren, index) => (
      <div className={classes.rows} key={index}>
        {rowChildren}
      </div>
    ));
  }

  return <div className={classes.root}>{content()}</div>;
};

export default RichText;
