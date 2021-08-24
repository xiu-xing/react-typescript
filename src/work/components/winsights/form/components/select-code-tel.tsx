import { createStyles, InputAdornment, makeStyles, MenuItem, Select } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import { REGEX } from "../../../../utils/regex";
import BasicTextField from "./basic-text-field";

const useStyles = makeStyles(() =>
  createStyles({
    selectCode: {
      paddingTop: 6,
      paddingBottom: 12,
      "&:before": {
        border: "none !important",
      },
      "&:after": {
        border: "none !important",
      },
      "& .MuiSelect-icon": {
        marginTop: -4,
      },
    },
  }),
);

interface SelectCodeTelProps {
  onChange: (mobile: string) => void;
}
const SelectCodeTel: React.FunctionComponent<SelectCodeTelProps> = (props) => {
  const classes = useStyles();
  const { onChange } = props;
  const [code, setCode] = useState<string>("+86");
  const [mobile, setMobile] = useState<string>();

  useEffect(() => {
    onChange(code + mobile);
  }, [code, mobile]);

  return (
    <BasicTextField
      required
      type="tel"
      error={mobile ? !REGEX.newPhone.test(mobile) : false}
      helperText={mobile ? (!REGEX.newPhone.test(mobile) ? "请输入正确的手机号" : "") : "请输入手机号"}
      label="手机号"
      value={mobile}
      onChange={(event) => {
        setMobile((event.target as HTMLInputElement).value);
      }}
      InputProps={{
        startAdornment: (
          <InputAdornment position="start">
            <Select
              className={classes.selectCode}
              labelId="select-label"
              id="select"
              value={code}
              onChange={(event) => {
                setCode((event.target as HTMLInputElement).value);
              }}
            >
              <MenuItem value={"+86"}>+86</MenuItem>
              <MenuItem value={"+852"}>+852</MenuItem>
              <MenuItem value={"+853"}>+853</MenuItem>
              <MenuItem value={"+886"}>+886</MenuItem>
            </Select>
          </InputAdornment>
        ),
      }}
    />
  );
};

export default SelectCodeTel;
