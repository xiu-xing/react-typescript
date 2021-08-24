import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
  }),
);

interface SelectButtonsProps {
  value?: string | number;
  className?: string;
  onChange?: (event: React.MouseEvent<HTMLButtonElement>, value: string | number) => void;
}

const SelectButtons: React.FunctionComponent<SelectButtonsProps> = (props) => {
  const classes = useStyles();
  const { className, value, onChange } = props;

  const children = React.Children.map(props.children, (child, childIndex) => {
    if (!React.isValidElement(child)) {
      return null;
    }

    const childValue = child.props.value === undefined ? childIndex : child.props.value;

    const selected = childValue === value;

    return React.cloneElement(child, {
      value: childValue,
      selected,
      onChange,
    });
  });

  return <Box className={clsx(classes.root, className)}>{children}</Box>;
};

export default SelectButtons;
