import { Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { isArray } from "lodash";
import React from "react";
import { CellBlock as CellBlockModel } from "../../../../../generated/graphql";
import { RichTextModel } from "../../../../../models/richText/index-next";
import { isJson } from "../../../../../utils/tools";
import RichTextNext from "../../../rich-text-next";
import Statistic from "../../../statistic";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
    },
    title: {
      fontSize: 16,
      marginBottom: 16,
      lineHeight: "24px",
      fontWeight: theme.typography.fontWeightMedium,
    },
    blocks: {
      display: "grid",
      gridGap: "24px",
      gridTemplateColumns: "repeat(auto-fill, minmax(200px,1fr))",
    },
  }),
);

interface CellBlockProps {
  model: CellBlockModel;
  disableTitle?: boolean;
}

const CellBlock: React.FunctionComponent<CellBlockProps> = (props) => {
  const classes = useStyles();
  const { model, disableTitle } = props;
  return (
    <div className={classes.root}>
      {!disableTitle && <Typography className={classes.title}>{model.name}</Typography>}
      {model.cells && (
        <div className={classes.blocks}>
          {model.cells.map((c, i) => {
            const data = isJson(c.subValue) ? JSON.parse(c.subValue as string) : null;
            return (
              <Statistic
                key={c.name + i}
                title={c.name}
                content={
                  c.precision
                    ? `${c.value.toLocaleString("en-US", { minimumFractionDigits: c.precision })} ${c.unit}`
                    : `${c.value.toLocaleString("en-US")} ${c.unit}`
                }
                contentColor={c.color ?? ""}
                sub={isArray(data) && <RichTextNext models={data.map((d) => RichTextModel.fromJSON(d))} />}
              />
            );
          })}
        </div>
      )}
    </div>
  );
};

export default CellBlock;
