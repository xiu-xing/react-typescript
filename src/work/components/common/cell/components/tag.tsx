import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { HTMLProps } from "react";
import { withAlphaHex } from "with-alpha-hex";
import theme from "../../../../theme";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: 24,
      borderRadius: 4,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      padding: "0px 4px",
      fontSize: 12,
      fontWeight: 500,
      color: theme.palette.primary.main,
      marginRight: 12,
      marginBottom: 4,
    },
  }),
);

export interface CommonCellTagProps extends HTMLProps<HTMLDivElement> {
  backgroundColor?: string;
}

const CommonCellTag: React.FunctionComponent<CommonCellTagProps> = (props) => {
  const classes = useStyles();
  const { backgroundColor, children, className } = props;

  return (
    <div
      className={clsx(classes.root, className)}
      style={{ backgroundColor: backgroundColor ?? withAlphaHex(theme.palette.primary.main, 0.16) }}
    >
      {children}
    </div>
  );
};

export default CommonCellTag;
