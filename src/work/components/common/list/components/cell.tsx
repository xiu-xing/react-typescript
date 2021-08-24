import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { ColumnWidths } from "../list";

interface BoxStyleProps {
  grow: number;
  basisWidth: number;
}

const useStyles = makeStyles(() =>
  createStyles({
    box: {
      flexGrow: ({ grow }: BoxStyleProps): number => grow,
      flexBasis: ({ basisWidth }: BoxStyleProps): number => basisWidth,
      width: ({ basisWidth }: BoxStyleProps): number => basisWidth,
    },
  }),
);

interface CellProps {
  columnIndex: number;
  columnWidths: ColumnWidths;
}

const Cell: React.FunctionComponent<CellProps> = ({ columnIndex, columnWidths, children }) => {
  const { grow = 1, basisWidth = 100 } = columnWidths[columnIndex] || {};
  const classes = useStyles({ grow, basisWidth });
  return <Box className={classes.box}>{children}</Box>;
};

export default Cell;
