import { Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";
import BasicEllipsisText from "../../../common/ellipsis-text/basic-ellipsis-text";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "flex",
      flexDirection: "column",
      justifyContent: "space-between",
      alignItems: "center",
      textAlign: "center",
      padding: 14,
      boxShadow: "0px 1px 4px 0px rgba(0, 0, 0, 0.2)",
      borderRadius: 4,
      width: 100,
      height: 106,
      overflow: "hidden",
      cursor: "pointer",
      userSelect: "none",
    },
    selected: {
      backgroundColor: theme.palette.primary.main,
      boxShadow:
        "0px 1px 18px 0px rgba(0, 0, 0, 0.12), 0px 6px 10px 0px rgba(0, 0, 0, 0.14), 0px 3px 5px -1px rgba(0, 0, 0, 0.2)",
      color: "#fff",
    },
    name: {
      fontSize: 14,
      lineHeight: "24px",
      fontWeight: 500,
    },
    value: {
      fontSize: 12,
    },
  }),
);

interface DataCellProps {
  name: string;
  value: number;
  selected?: boolean;
  onClick?: () => void;
}

const DataCell: React.FunctionComponent<DataCellProps> = (props) => {
  const classes = useStyles();

  const { name, value, onClick, selected } = props;

  return (
    <div className={clsx(classes.root, selected ? classes.selected : undefined)} onClick={onClick}>
      <BasicEllipsisText lineClamp={2} className={classes.name}>
        {name}
      </BasicEllipsisText>
      <Typography className={classes.value}>
        <span>分数 </span>
        <span>{value}</span>
      </Typography>
    </div>
  );
};

export default DataCell;
