import { TextField } from "@material-ui/core";
import { StandardTextFieldProps } from "@material-ui/core/TextField";
import React, { ReactNode } from "react";
import NumberFormat from "react-number-format";
import { SourceType } from "../../../../types";

interface NumberInputFormatProps {
  sourceType: SourceType;
  inputRef: (instance: NumberFormat | null) => void;
  onChange: (event: { target: { value: string } }) => void;
}

function NumberInputFormat(props: NumberInputFormatProps): JSX.Element {
  const { inputRef, onChange, ...other } = props;

  return (
    <NumberFormat
      {...other}
      getInputRef={inputRef}
      onValueChange={(values): void => {
        onChange({
          target: {
            value: values.value,
          },
        });
      }}
      isNumericString
    />
  );
}

interface CurrencyInputFormatProps {
  sourceType: SourceType;
  inputRef: (instance: NumberFormat | null) => void;
  onChange: (event: { target: { value: string } }) => void;
}

function CurrencyInputFormat(props: CurrencyInputFormatProps): JSX.Element {
  const { inputRef, onChange, ...other } = props;

  return (
    <NumberFormat
      {...other}
      getInputRef={inputRef}
      onValueChange={(values): void => {
        onChange({
          target: {
            value: values.value,
          },
        });
      }}
      thousandSeparator
      isNumericString
    />
  );
}

export interface FormatInputProps extends StandardTextFieldProps {
  thousandSeparator?: boolean;
}

const FormatInput: React.FunctionComponent<FormatInputProps> = (props) => {
  const { thousandSeparator, ...leftProps } = props;

  function input(): ReactNode {
    return (
      <TextField
        {...leftProps}
        size="small"
        variant="outlined"
        InputProps={{
          ...leftProps.InputProps,
          ...{ inputComponent: thousandSeparator ? (CurrencyInputFormat as never) : (NumberInputFormat as never) },
        }}
      />
    );
  }

  return <>{input()}</>;
};

export default FormatInput;
