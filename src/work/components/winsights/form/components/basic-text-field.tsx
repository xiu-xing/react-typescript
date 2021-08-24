import { TextField, TextFieldProps } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";

const useStyles = makeStyles(() =>
  createStyles({
    textField: {
      "& input": {
        paddingTop: 6,
        paddingBottom: 12,
      },
      "& .MuiFormLabel-root": {
        color: "#999",
      },
      "& .MuiInputLabel-formControl": {
        transform: " translate(0, 30px) scale(1)",
      },
      "& .MuiFormHelperText-root": {
        // color: "#666",
        fontSize: 14,
      },
      "& label + .MuiInput-formControl": {
        marginTop: 24,
      },
      "& .MuiInput-underline.Mui-disabled:before": {
        borderBottomColor: "#EEE",
      },
      "& .MuiInput-underline:before": {
        borderBottomColor: "#EEE",
      },
      "& .MuiInputLabel-asterisk": {
        color: "#E00000",
      },
      "& .MuiInputLabel-shrink": {
        transform: "translate(0, 4px) scale(0.875)",
      },
    },
    verificationCodeText: {
      fontSize: "12px",
      cursor: "pointer",
      color: "#989898",
    },
    verificationCodeDisabledText: {
      color: "#999",
    },
  }),
);

// 固定了样式
const BasicTextField: React.FunctionComponent<TextFieldProps> = (props) => {
  const classes = useStyles();

  return <TextField className={classes.textField} {...props} fullWidth />;
};

export default BasicTextField;
