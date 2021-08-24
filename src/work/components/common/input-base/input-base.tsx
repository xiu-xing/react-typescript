import { InputBase as MuiInputBase, InputBaseProps as MuiInputBaseProps } from "@material-ui/core";
import React, { useEffect, useRef, useState } from "react";

interface InputBaseProps extends Omit<MuiInputBaseProps, "onChange"> {
  onChange?: (value: string) => void;
}

/**
 * 输入框，区分英文输入和中文输入,当中文输入时，只有完整输入才会有值的改变
 * @param props
 */
const InputBase: React.FunctionComponent<InputBaseProps> = (props) => {
  const { onChange, value: controlValue, ...restProps } = props;

  const [value, setValue] = useState("");
  const isTyping = useRef(false);

  function onInputChange(event: React.ChangeEvent<HTMLInputElement>): void {
    const value = event.target.value;
    setValue(value);
    if (isTyping.current) {
      return;
    }
    onChange?.(value);
  }

  useEffect(() => {
    if (typeof controlValue === "string") {
      setValue(controlValue);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [controlValue]);

  return (
    <MuiInputBase
      onChange={onInputChange}
      onCompositionStart={(): void => {
        isTyping.current = true;
      }}
      onCompositionEnd={(): void => {
        isTyping.current = false;
        onChange?.(value);
      }}
      value={value}
      {...restProps}
    />
  );
};

export default InputBase;
