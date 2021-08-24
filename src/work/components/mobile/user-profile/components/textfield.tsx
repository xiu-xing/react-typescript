import { Box, StandardTextFieldProps, TextField } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { FunctionComponent } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      height: 68,
      display: "flex",
      flexDirection: "column",
      justifyContent: "flex-end",
      boxSizing: "border-box",
    },

    multiLine: {
      // height: 68,
    },

    input: {
      padding: "12px 0px",
      fontSize: 16,
    },

    underline: {
      "&:after": {},

      "&:before": {
        borderBottom: "1px solid #EEE",
      },
    },
  }),
);

interface InternalTextFieldProps extends StandardTextFieldProps {
  helperText?: string;
}

const InternalTextField: FunctionComponent<InternalTextFieldProps> = (props) => {
  const classes = useStyles();

  const { helperText, label, ...restProps } = props;

  return (
    <Box className={(classes.root, props.multiline ? classes.multiLine : "")}>
      <TextField
        id="standard-basic"
        fullWidth
        label={label}
        helperText={helperText}
        InputProps={{ classes: { input: classes.input, underline: classes.underline } }}
        {...restProps}
      />
    </Box>
  );
};

export default InternalTextField;
