import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import NumberFormat, { NumberFormatProps } from "react-number-format";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
  }),
);

const CurrencyNumberFomat: React.FunctionComponent<NumberFormatProps> = props => {
  const classes = useStyles();

  return <NumberFormat {...props} className={classes.root} displayType="text" thousandSeparator isNumericString />;
};

export default CurrencyNumberFomat;
