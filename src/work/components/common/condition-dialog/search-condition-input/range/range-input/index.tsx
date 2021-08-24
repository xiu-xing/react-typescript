import DateFnsUtils from "@date-io/date-fns";
import { Box, IconButton, InputAdornment, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { DatePicker, DatePickerView, MuiPickersUtilsProvider } from "@material-ui/pickers";
import {
  endOfDay,
  endOfMonth,
  endOfYear,
  format,
  fromUnixTime,
  getUnixTime,
  startOfDay,
  startOfMonth,
  startOfYear,
} from "date-fns";
import { zhCN } from "date-fns/locale";
import _ from "lodash";
import { Close, MenuDown } from "mdi-material-ui";
import React, { ReactNode, useState } from "react";
import { SourceType } from "../../../types";
import FormatInput from "./components/format-input";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "flex",
      alignItems: "center",
    },
    input: {
      width: 160,
      "& .MuiInputBase-root": {
        fontSize: 14,
        lineHeight: "24px",
      },
      "& .MuiOutlinedInput-notchedOutline": {
        borderColor: "#EEE",
      },
    },
    paper: {
      "& .MuiPickersToolbarText-toolbarBtnSelected": {
        color: "inherit",
      },
      "& .MuiPickersToolbarText-toolbarTxt": {
        color: "inherit",
      },
    },
  }),
);

interface RangeInputProps {
  inputType: SourceType;
  unit?: string;
  datePickerView?: DatePickerView;
  initialValue?: { start?: string; end?: string };
  onChange?: (value: { start?: string; end?: string }, rangeLabel?: string) => void;
}

const RangeInput: React.FunctionComponent<RangeInputProps> = (props) => {
  const classes = useStyles();
  const { inputType, initialValue, onChange, unit, datePickerView = "date" } = props;
  const [startInputValue, setStartInputValue] = useState<string>(initialValue?.start || "");
  const [endInputValue, setEndInputValue] = useState<string>(initialValue?.end || "");
  const [startDatePickerOpen, setStartDatePickerOpen] = useState(false);
  const [endDatePickerOpen, setEndDatePickerOpen] = useState(false);

  const isNotNumber = (value?: number) => {
    return value !== value;
  };

  function dateFormat(view: DatePickerView): "yyyy/MM/dd" | "yyyy/MM" | "yyyy" {
    if (view === "date") {
      return "yyyy/MM/dd";
    }
    if (view === "month") {
      return "yyyy/MM";
    }
    if (view === "year") {
      return "yyyy";
    }
    return "yyyy/MM/dd";
  }

  const label = (strings: TemplateStringsArray, start?: string, end?: string) => {
    const middle = strings[1];

    const s = start ? Number(start) : NaN;
    const e = end ? Number(end) : NaN;

    if (!isNotNumber(s) && isNotNumber(e)) {
      if (inputType === "date_picker") {
        return `${format(fromUnixTime(s), dateFormat(datePickerView))} 之后`;
      }

      if (inputType === "number") {
        return `大于 ${s} ${unit}`;
      }
    }

    if (isNotNumber(s) && !isNotNumber(e)) {
      if (inputType === "date_picker") {
        return `${format(fromUnixTime(e), dateFormat(datePickerView))} 之前`;
      }

      if (inputType === "number") {
        return `小于 ${e} ${unit}`;
      }
    }

    if (!isNotNumber(s) && !isNotNumber(e)) {
      if (inputType === "date_picker") {
        return `${format(fromUnixTime(s), dateFormat(datePickerView))}${middle}${format(
          fromUnixTime(e),
          dateFormat(datePickerView),
        )}`;
      }

      if (inputType === "number") {
        return `${s} ${unit}${middle}${e} ${unit}`;
      }
    }

    return "";
  };

  function handleStartInputValueChange(newStartInputValue: string): void {
    if (startInputValue === newStartInputValue) {
      return;
    }
    setStartInputValue(newStartInputValue);
    onChange?.(
      {
        start: newStartInputValue,
        end: endInputValue,
      },
      label`${newStartInputValue} - ${endInputValue}`,
    );
  }

  function checkStartInputValue(newStartInputValue: string): void {
    if (newStartInputValue === "") {
      handleStartInputValueChange(newStartInputValue);
      return;
    }

    if (endInputValue) {
      if (parseFloat(newStartInputValue) > parseFloat(endInputValue)) {
        newStartInputValue = endInputValue;
      }
    }
    if (parseFloat(newStartInputValue) > 1000000000000) {
      newStartInputValue = "1000000000000";
    }
    handleStartInputValueChange(Number(newStartInputValue).toString());
  }

  function handleEndInputValueChange(newEndInputValue: string): void {
    if (endInputValue === newEndInputValue) {
      return;
    }
    setEndInputValue(newEndInputValue);
    onChange?.(
      {
        start: startInputValue,
        end: newEndInputValue,
      },
      label`${startInputValue} - ${newEndInputValue}`,
    );
  }

  function checkEndInputValue(newEndInputValue: string): void {
    if (newEndInputValue === "") {
      handleEndInputValueChange(newEndInputValue);
      return;
    }

    if (startInputValue) {
      if (parseFloat(newEndInputValue) < parseFloat(startInputValue)) {
        newEndInputValue = startInputValue;
      }
    }

    if (parseFloat(newEndInputValue) > 1000000000000) {
      newEndInputValue = "1000000000000";
    }
    handleEndInputValueChange(Number(newEndInputValue).toString());
  }

  function input(): ReactNode {
    let startNow = new Date();
    let endNow = new Date();

    switch (datePickerView) {
      case "year":
        startNow = startOfYear(startNow);
        break;
      case "month":
        startNow = startOfMonth(startNow);
        break;
      case "date":
        startNow = startOfDay(startNow);
        break;
    }

    switch (datePickerView) {
      case "year":
        endNow = endOfYear(endNow);
        break;
      case "month":
        endNow = endOfMonth(endNow);
        break;
      case "date":
        endNow = endOfDay(endNow);
        break;
    }

    switch (inputType) {
      case "date_picker":
        return (
          <MuiPickersUtilsProvider utils={DateFnsUtils} locale={zhCN}>
            <DatePicker
              open={startDatePickerOpen}
              autoOk
              PopoverProps={{
                classes: {
                  paper: classes.paper,
                },
              }}
              onOpen={() => setStartDatePickerOpen(true)}
              onClose={() => setStartDatePickerOpen(false)}
              className={classes.input}
              size="small"
              variant="inline"
              placeholder="开始时间"
              maxDate={endInputValue ? fromUnixTime(Number(endInputValue)) : startNow}
              value={startInputValue ? fromUnixTime(Number(startInputValue)) : null}
              format={dateFormat(datePickerView)}
              inputVariant="outlined"
              InputProps={{
                endAdornment: startInputValue ? (
                  <IconButton
                    size="small"
                    onClick={(event): void => {
                      event.stopPropagation();
                      handleStartInputValueChange("");
                    }}
                  >
                    <Close />
                  </IconButton>
                ) : (
                  <MenuDown
                    style={{
                      color: "#656565",
                      transition: "transform 0.5s",
                      ...(startDatePickerOpen && { transform: "rotate(180deg)" }),
                    }}
                  />
                ),
              }}
              views={[datePickerView]}
              onChange={(date): void => {
                let processedDate = date || Date.now();
                switch (datePickerView) {
                  case "year":
                    processedDate = startOfYear(processedDate);
                    break;
                  case "month":
                    processedDate = startOfMonth(processedDate);
                    break;
                  case "date":
                    processedDate = startOfDay(processedDate);
                    break;
                }
                handleStartInputValueChange(getUnixTime(processedDate).toString());
              }}
            />
            <svg width="13" height="20" style={{ marginInline: "10px" }}>
              <rect y="10" height="2" width="13" fill="#979797" />
            </svg>
            <DatePicker
              className={classes.input}
              open={endDatePickerOpen}
              PopoverProps={{
                classes: {
                  paper: classes.paper,
                },
              }}
              autoOk
              onOpen={() => setEndDatePickerOpen(true)}
              onClose={() => setEndDatePickerOpen(false)}
              variant="inline"
              size="small"
              placeholder="结束时间"
              minDate={startInputValue ? fromUnixTime(Number(startInputValue)) : undefined}
              maxDate={endNow}
              value={endInputValue ? fromUnixTime(Number(endInputValue)) : null}
              format={dateFormat(datePickerView)}
              inputVariant="outlined"
              InputProps={{
                endAdornment: endInputValue ? (
                  <IconButton
                    size="small"
                    onClick={(event): void => {
                      event.stopPropagation();
                      handleEndInputValueChange("");
                    }}
                  >
                    <Close />
                  </IconButton>
                ) : (
                  <MenuDown
                    style={{
                      color: "#656565",
                      transition: "transform 0.5s",
                      ...(endDatePickerOpen && { transform: "rotate(180deg)" }),
                    }}
                  />
                ),
              }}
              views={[datePickerView]}
              onChange={(date): void => {
                let processedDate = date || Date.now();
                switch (datePickerView) {
                  case "year":
                    processedDate = endOfYear(processedDate);
                    break;
                  case "month":
                    processedDate = endOfMonth(processedDate);
                    break;
                  case "date":
                    processedDate = endOfDay(processedDate);
                    break;
                }
                handleEndInputValueChange(getUnixTime(processedDate).toString());
              }}
            />
          </MuiPickersUtilsProvider>
        );
      case "number":
        return (
          <>
            <FormatInput
              className={classes.input}
              value={startInputValue}
              placeholder="开始值"
              thousandSeparator
              InputProps={{
                endAdornment: unit && (
                  <InputAdornment position="end">
                    <Typography style={{ whiteSpace: "nowrap", color: "#999999" }}>{unit}</Typography>
                  </InputAdornment>
                ),
              }}
              onBlur={(event): void => {
                const newStartInputValue = _.replace(event.target.value, /,/g, "");
                checkStartInputValue(newStartInputValue);
              }}
              onKeyUp={(event): void => {
                if (event.keyCode === 13) {
                  const newEndInputValue: string = _.replace(event.target["value"], /,/g, "");
                  checkStartInputValue(newEndInputValue);
                }
              }}
            />
            <svg width="13" height="20" style={{ marginInline: "10px" }}>
              <rect y="10" height="2" width="13" fill="#979797" />
            </svg>
            <FormatInput
              className={classes.input}
              value={endInputValue}
              placeholder="结束值"
              thousandSeparator
              InputProps={{
                endAdornment: unit && (
                  <InputAdornment position="end">
                    <Typography style={{ whiteSpace: "nowrap", color: "#999999" }}>{unit}</Typography>
                  </InputAdornment>
                ),
              }}
              onBlur={(event): void => {
                const newEndInputValue: string = _.replace(event.target.value, /,/g, "");
                checkEndInputValue(newEndInputValue);
              }}
              onKeyUp={(event): void => {
                if (event.keyCode === 13) {
                  const newEndInputValue: string = _.replace(event.target["value"], /,/g, "");
                  checkEndInputValue(newEndInputValue);
                }
              }}
            />
          </>
        );
      default:
        return null;
    }
  }

  return <Box className={classes.root}>{input()}</Box>;
};

export default RangeInput;
