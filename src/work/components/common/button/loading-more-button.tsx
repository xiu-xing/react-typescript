import {
  ButtonBase,
  ButtonBaseClassKey,
  ButtonBaseProps,
  CircularProgress,
  StyledComponentProps,
  Typography,
} from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { ChevronDown, ChevronRight } from "mdi-material-ui";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      height: 52,
    },
    text: {
      fontSize: 14,
      fontWeight: 500,
    },
    icon: {
      fontSize: 16,
    },
  }),
);

type LoadingMoreButtonClassesKey = ButtonBaseClassKey | "icon" | "text";

interface LoadingMoreButtonProps
  extends Omit<ButtonBaseProps, "classes">,
    StyledComponentProps<LoadingMoreButtonClassesKey> {
  iconType?: "down" | "right";
  text?: string;
  loading?: boolean;
}

const LoadingMoreButton: React.FunctionComponent<LoadingMoreButtonProps> = (props) => {
  const classes = useStyles();

  const { iconType, text, className, classes: externalClasses, loading, ...restProps } = props;

  return (
    <ButtonBase
      className={clsx(classes.root, className)}
      classes={{
        root: externalClasses?.root,
        disabled: externalClasses?.disabled,
        focusVisible: externalClasses?.focusVisible,
      }}
      {...restProps}
    >
      {loading ? (
        <CircularProgress color="primary" size="small" />
      ) : (
        <>
          <Typography className={clsx(classes.text, externalClasses?.text)} color="primary">
            {text || "加载更多"}
          </Typography>
          {iconType === "down" ? (
            <ChevronDown className={clsx(classes.icon, externalClasses?.icon)} color="primary" />
          ) : (
            <ChevronRight className={clsx(classes.icon, externalClasses?.icon)} color="primary" />
          )}
        </>
      )}
    </ButtonBase>
  );
};

export default LoadingMoreButton;
