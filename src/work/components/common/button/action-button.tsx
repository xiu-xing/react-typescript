import { Button, ButtonProps, CircularProgress } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useState } from "react";
import clsx from "clsx";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    loadingIcon: {
      marginRight: 3,
    },
    cancelButton: {
      color: "#666",
    },
  }),
);

interface CommonButtonProps extends ButtonProps {
  actionType: "cancel" | "confirm" | "save";
  loading?: boolean;
}

const CommonButton: React.FunctionComponent<CommonButtonProps> = ({ actionType, loading = false, onClick, ...leftProps }) => {
  const classes = useStyles();
  const [loadingState, setLoadingState] = useState(false)
  const loadingEl = (loadingState || loading) ? <CircularProgress className={classes.loadingIcon} size={14} disableShrink /> : null;
  const handleClick: typeof onClick = async (e) => {
    try {
      setLoadingState(true)
      await onClick?.(e)
    } finally {
      setLoadingState(false)
    }
  }
  const props = {
    onClick: handleClick,
    ...leftProps,
  }
  switch (actionType) {
    case "cancel":
      return (
        <Button {...props} className={clsx(classes.cancelButton, leftProps.className)}>
          {loadingEl}
          取消
        </Button>
      );
    case "confirm":
      return <Button {...props} color="primary">{loadingEl}确认</Button>;
    case "save":
      return <Button {...props} color="primary">{loadingEl}保存</Button>;
  }
};

export default CommonButton;
