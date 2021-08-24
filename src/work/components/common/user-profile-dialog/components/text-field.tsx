import { Box, InputBase, InputBaseClassKey, InputBaseProps, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import React, { FunctionComponent } from "react";

const useStyles = makeStyles(() =>
  createStyles({
    inputBox: {
      backgroundColor: "rgba(248,248,248,1)",
      borderRadius: 4,
      display: "flex",
      height: 36,
    },
    inputBase: {
      width: "100%",
      fontSize: 14,
    },
    input: {
      height: "100%",
      padding: "0 12px",
      borderRadius: 4,
    },
    mutilineInputBox: {
      height: "auto",
    },
    helpText: {
      fontSize: 12,
      // color: "#999",
      padding: "0 12px",
    },
  }),
);

type TextFieldClassKey = InputBaseClassKey | "box";

interface TextFieldProps extends InputBaseProps {
  helperText?: string;
  // classes: Partial<Record<TextFieldClassKey, string>> | undefined;
}

const TextField: FunctionComponent<TextFieldProps> = (props) => {
  const classes = useStyles();

  const { helperText, ...restProps } = props;

  return (
    <Box>
      <Box className={clsx(classes.inputBox, props.multiline ? classes.mutilineInputBox : "")}>
        <InputBase
          classes={{
            input: classes.input,
          }}
          className={classes.inputBase}
          {...restProps}
        />
      </Box>
      <Typography color="error" className={classes.helpText}>
        {helperText}
      </Typography>
    </Box>
  );
};

export default TextField;
