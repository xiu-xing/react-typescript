import { InputBase, InputBaseProps } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { SearchOutlined } from "@material-ui/icons";
import clsx from "clsx";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      border: "1px solid #ccc",
      borderRadius: 18,
      padding: "0 12px",
      height: 36,
    },
    input: {
      fontSize: 14,
      "& ::placeholder": {
        fontSize: 14,
      },
    },
  }),
);

type SearchInputBaseProps = InputBaseProps;

const SearchInputBase: React.FunctionComponent<SearchInputBaseProps> = (props) => {
  const classes = useStyles();
  return (
    <InputBase
      startAdornment={<SearchOutlined htmlColor="#ccc" />}
      {...props}
      classes={{ ...props.classes, root: clsx(classes.root, props.classes?.root), input: classes.input }}
    />
  );
};

export default SearchInputBase;
