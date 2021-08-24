import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { HTMLProps } from "react";
import { withAlphaHex } from "with-alpha-hex";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: 24,
      borderRadius: 4,
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
      padding: "0px 4px",
      marginRight: 6,
      backgroundColor: withAlphaHex(theme.palette.primary.main, 0.16),
      fontSize: 10,
      color: theme.palette.primary.main,
      minWidth: 56,
    },
  }),
);

interface CommonCellTagProps extends HTMLProps<HTMLDivElement> {
  tag: string;
}

const CommonCellTag: React.FunctionComponent<CommonCellTagProps> = (props) => {
  const classes = useStyles();
  const { className, tag } = props;

  return <div className={clsx(className, classes.root)}>{tag}</div>;
};

export default CommonCellTag;
