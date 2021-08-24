import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React from "react";
import { ButtonBase } from "@material-ui/core";
import clsx from "clsx";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      minWidth: 102,
      borderRadius: 4,
      padding: 8,
      background: "#f8f8f8",
      color: "#666",
      lineHeight: "16px",
      fontWeight: theme.typography.fontWeightRegular,
      transition: "background 0.6s,color 0.6s",
      fontSize: 12,
    },
    active: {
      background: theme.palette.primary.main,
      color: "#fff",
      fontWeight: theme.typography.fontWeightRegular,
    },
  }),
);

interface SelectButtonProps {
  value?: string | number;
  label: string;
  selected?: boolean;
  onClick?: React.MouseEventHandler<HTMLButtonElement>;
  onChange?: (event: React.MouseEvent<HTMLButtonElement>, value?: string | number) => void;
}

const SelectButton: React.FC<SelectButtonProps> = (props) => {
  const classes = useStyles();
  const { label, value, selected = false, onClick, onChange } = props;

  const handleClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    if (!selected && onChange) {
      onChange(event, value);
    }

    if (onClick) {
      onClick(event);
    }
  };

  return (
    <ButtonBase onClick={handleClick} className={clsx(classes.root, { [classes.active]: selected })}>
      {label}
    </ButtonBase>
  );
};

export default SelectButton;
