import { Button } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles({
  root: {
    margin: "8px",
    color: (props: FilterButtonProps): string => (props.active ? "#333" : "#999"),
    background: (props: FilterButtonProps): string => (props.active ? "#fff" : "#F8F8F8"),
    borderLeft: "4px solid",
    borderLeftColor: (props: FilterButtonProps): string => (props.active ? "rgba(0,0,0,.6)" : "transparent"),
    boxShadow: (props: FilterButtonProps): string =>
      props.active
        ? "0px 1px 3px 0px rgba(0,0,0,0.2),0px 2px 1px -1px rgba(0,0,0,0.12),0px 1px 1px 0px rgba(0,0,0,0.14)"
        : "0px 1px 4px 0px rgba(0,0,0,0.2)",
  },
});

interface FilterButtonProps {
  active: boolean;
  onClick?: VoidFunction;
}

const FilterButton: React.FunctionComponent<FilterButtonProps> = props => {
  const classes = useStyles(props);

  return (
    <Button
      onClick={(): void => {
        if (props.onClick) {
          props.onClick();
        }
      }}
      variant="contained"
      className={classes.root}
    >
      {props.children}
    </Button>
  );
};

export default FilterButton;
