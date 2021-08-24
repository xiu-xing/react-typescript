import DateFnsUtils from "@date-io/date-fns";
import { Box } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { DatePicker, MuiPickersUtilsProvider } from "@material-ui/pickers";
import { fromUnixTime } from "date-fns";
import { zhCN } from "date-fns/locale";
import React, { useMemo } from "react";
import { FilterInputCommonProps } from ".";
import {
  DatePrecise,
  DateRangeSelectorFilter,
  DateRangeSelectorFilterInput,
  FilterOption,
} from "../../../../generated/graphql";
import { first } from "../../../../utils/tools";
import SelectButtons from "../select-buttons";
import SelectButton from "../select-buttons/select-button";

const useStyles = makeStyles(() =>
  createStyles({
    root: {},
    buttons: {
      display: "grid",
      gridTemplateColumns: "repeat(auto-fit,minmax(100px,1fr))",
      gridGap: "12px",
    },
    datepicker: {
      borderRadius: 4,
      background: "transparent",
      "& .MuiInputBase-input": {
        height: 16,
      },
      "& .MuiInputBase-root": {
        fontSize: 12,
        color: "#666",
        lineHeight: "16px",
      },
      "& .MuiFilledInput-input": {
        padding: "8px 18px",
      },
      "& .MuiFilledInput-root": {
        background: "#f8f8f8",
        borderRadius: 4,
      },
      "& .MuiFilledInput-underline:before": {
        borderWidth: 0,
      },
      "& .MuiFilledInput-underline:hover:not(.Mui-disabled):before": {
        borderWidth: 0,
      },
      "& .MuiFilledInput-underline:after": {
        borderWidth: 0,
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

interface DateRangeSelectorProps extends FilterInputCommonProps {
  filter: DateRangeSelectorFilter;
}

const DateRangeSelector: React.FC<DateRangeSelectorProps> = (props) => {
  const classes = useStyles();
  const { filter, value, onChange } = props;

  const options = useMemo(() => filter.options as FilterOption[], [filter]);

  const format = useMemo(() => {
    switch (filter.precise as DatePrecise) {
      case DatePrecise.Year:
        return "yyyy";
      case DatePrecise.Month:
        return "yyyy.MM";
      case DatePrecise.Day:
        return "yyyy.MM.dd";
      default:
        break;
    }
  }, [filter]);

  const start = useMemo(() => {
    const s = (value as DateRangeSelectorFilterInput)?.startTimestamp;

    if (s) {
      return fromUnixTime(s);
    }

    return null;
  }, [value]);

  const end = useMemo(() => {
    const e = (value as DateRangeSelectorFilterInput)?.endTimestamp;

    if (e) {
      return fromUnixTime(e);
    }

    return null;
  }, [value]);

  const selected = useMemo(() => {
    if (start || end) {
      return undefined;
    }
    return (value as DateRangeSelectorFilterInput)?.selectedValue ?? first(options).value;
  }, [options, value, start, end]);

  return (
    <Box className={classes.root}>
      <SelectButtons
        className={classes.buttons}
        value={selected}
        onChange={(_, v) =>
          onChange?.({
            type: "DateRangeSelectorFilterInput",
            filterID: filter.id as string,
            name: filter.name,
            selectedValue: v as string,
            displayValue: v as string,
          })
        }
      >
        {options.map((o) => (
          <SelectButton key={o.key} value={o.value} label={o.key} />
        ))}
      </SelectButtons>
      <Box height={12} />
      <Box display="grid" gridTemplateColumns="1fr max-content 1fr">
        <MuiPickersUtilsProvider utils={DateFnsUtils} locale={zhCN}>
          <DatePicker
            className={classes.datepicker}
            okLabel="确认"
            cancelLabel="取消"
            DialogProps={{
              PaperProps: {
                className: classes.paper,
              },
            }}
            value={start}
            variant="dialog"
            size="small"
            // autoOk
            margin="none"
            format={format}
            // disableToolbar
            placeholder="开始值"
            minDate={filter.min ? fromUnixTime(filter.min) : undefined}
            maxDate={end}
            inputVariant="filled"
            onChange={(date) => {
              if (date) {
                const d = Math.round(date.getTime() / 1000);
                onChange?.({
                  ...(value ?? {}),
                  type: "DateRangeSelectorFilterInput",
                  filterID: filter.id as string,
                  name: filter.name,
                  startTimestamp: d,
                  selectedValue: undefined,
                });
              }
            }}
          />
          <svg height="32" width="13" style={{ margin: "0 6px" }}>
            <rect y="15" height="1" width="13" fill="#999" />
          </svg>
          <DatePicker
            className={classes.datepicker}
            DialogProps={{
              PaperProps: {
                className: classes.paper,
              },
            }}
            // autoOk
            value={end}
            onChange={(date) => {
              if (date) {
                const e = Math.round(date.getTime() / 1000);
                onChange?.({
                  ...(value ?? {}),
                  type: "DateRangeSelectorFilterInput",
                  filterID: filter.id as string,
                  name: filter.name,
                  endTimestamp: e,
                  selectedValue: undefined,
                });
              }
            }}
            okLabel="确认"
            cancelLabel="取消"
            variant="dialog"
            placeholder="结束值"
            size="small"
            margin="none"
            format={format}
            // disableToolbar
            minDate={start}
            maxDate={filter.max ? fromUnixTime(filter.max) : undefined}
            inputVariant="filled"
          />
        </MuiPickersUtilsProvider>
      </Box>
    </Box>
  );
};

export default DateRangeSelector;
