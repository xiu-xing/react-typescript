import { fade, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { ReactNode } from "react";
import { Cell, CellBlock as CellBlockModel } from "../../../../../../generated/graphql";
import { ActionModel, getActionHandler } from "../action";
import AdaptiveText from "./adaptive-text";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "grid",
      gridAutoFlow: "row",
      gridTemplateColumns: "1fr 1fr 1fr",
      gridAutoRows: "max-content",
      gridGap: 16,
    },
    cell: {
      display: "flex",
      flexDirection: "column",
      justifyContent: "space-between",
      backgroundColor: fade(theme.palette.primary.main, 0.04),
      borderRadius: 4,
      padding: 12,
    },
    disableCell: {
      "& p": {
        color: "#999",
      },
    },
    cellTitle: {
      fontSize: 14,
      color: "#333",
      lineHeight: "24px",
      paddingBottom: 12,
    },
    hidden: {
      overflow: "hidden",
      display: "-webkit-box",
      "-webkit-line-clamp": 1,
      "-webkit-box-orient": "vertical",
    },
    cellValue: {
      color: theme.palette.primary.main,
      fontSize: 14,
      lineHeight: "24px",
      wordBreak: "break-all",
      fontWeight: 500,
    },
    img: {
      width: 16,
      height: 16,
      marginTop: 4,
    },
    disable: {
      color: "#666",
    },
  }),
);

interface CellBlockProps {
  block: CellBlockModel;
}

const CellBlock: React.FunctionComponent<CellBlockProps> = (props) => {
  const classes = useStyles();
  const { block } = props;

  function CellItem(cell: Cell, index: number): ReactNode {
    const disable = !cell.value && !cell.action;
    const onCellClick = cell.action ? getActionHandler(ActionModel.fromJSON(cell.action)) : undefined;

    return (
      <div key={index} className={clsx(classes.cell, disable && classes.disableCell, "cellItem")} onClick={onCellClick}>
        <AdaptiveText value={cell.name} />
        {!cell.icon && (
          <Typography className={classes.cellValue}>
            {cell.value} {cell.unit}
          </Typography>
        )}
        {cell.icon && <img src={cell.icon} className={classes.img} />}
      </div>
    );
  }

  return <div className={classes.root}>{block.cells.map((cell, index) => CellItem(cell, index))}</div>;
};

export default CellBlock;
