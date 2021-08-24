import { ButtonBase, CircularProgress, SvgIconTypeMap, Typography } from "@material-ui/core";
import { OverridableComponent } from "@material-ui/core/OverridableComponent";
import React, { useState } from "react";
import { useStyles } from "../table-selection-operation-bar";

interface TableSelectionBaseProps {
  onClick(): Promise<void>;
  title: string;
  startIcon?: OverridableComponent<SvgIconTypeMap>  ;
}

const TableSelectionBaseButton: React.FunctionComponent<TableSelectionBaseProps> = (props) => {
  const classes = useStyles();
  const [loading, setLoading] = useState(false);

  return (
    <ButtonBase
      onClick={async (): Promise<void> => {
        if (loading) {
          return;
        }
        try {
          setLoading(true);
          await props.onClick();
        } finally {
          setLoading(false);
        }
      }}
      disabled={loading}
      className={classes.action}
      color="inherit"
    >
      {loading && <CircularProgress className={classes.tableActionIcon} color="inherit" size={16} disableShrink />}
      {props.startIcon && !loading && <props.startIcon className={classes.tableActionIcon} color="inherit" />}
      <Typography className={classes.actionText}>{props.title}</Typography>
    </ButtonBase>
  );
};

export default TableSelectionBaseButton;
