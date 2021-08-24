import { TextField, TextFieldProps } from "@material-ui/core";
import React, { useRef, useState } from "react";
import { Subtract } from "utility-types";

type NumericInputProps = {
  defaultValue?: number;
  min?: number;
  max?: number;
  onChange?: (value?: number) => void;
} & Subtract<TextFieldProps, { onChange?: React.ChangeEventHandler<HTMLTextAreaElement | HTMLInputElement> }>;

const NumericInput: React.FunctionComponent<NumericInputProps> = ({
  defaultValue,
  min = 0,
  max = Infinity,
  onChange,
  ...restProps
}) => {
  const [value, setValue] = useState<string>(defaultValue ? defaultValue + "" : "");

  const timer = useRef();

  const onInput = (e: React.ChangeEvent<HTMLTextAreaElement | HTMLInputElement>) => {
    setValue(() => {
      clearTimeout(timer.current);

      timer.current = setTimeout(() => {
        let v;

        if (!isNaN(Number(e.target.value))) {
          v = Number(e.target.value);

          if (v > max) {
            v = Number(max);
          } else if (v < min) {
            v = Number(min);
          }
        } else {
          v = undefined;
        }

        setValue(typeof v === "undefined" ? "" : v + "");
        onChange?.(v);
      }, 500) as any;

      return e.target.value;
    });
  };

  return <TextField {...restProps} value={value} onChange={onInput} />;
};

export default NumericInput;
