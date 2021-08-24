import DateFnsUtils from "@date-io/date-fns";
import { Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { DatePicker, DatePickerView, MuiPickersUtilsProvider } from "@material-ui/pickers";
import { fromUnixTime } from "date-fns";
import { zhCN } from "date-fns/locale";
import React, { useEffect, useState } from "react";
import { FilterItemCommonProps } from ".";
import { DayFilter, MonthFilter, YearFilter } from "../../../generated/graphql";

const DatePickerData: Record<DatePickerView, { format: string; views: DatePickerView[]; width: number }> = {
  year: {
    format: "yyyy",
    views: ["year"],
    width: 40,
  },
  month: {
    format: "yyyy-MM",
    views: ["year", "month"],
    width: 60,
  },
  date: {
    format: "yyyy-MM-dd",
    views: ["year", "month", "date"],
    width: 82,
  },
};

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      display: "inline-flex",
      alignItems: "center",
    },
    label: {
      color: "#666",
      fontSize: 14,
      marginRight: "1rem",
      minWidth: "max-content",
    },
    datePicker: {
      width: "min-content",
      minWidth: "min-content",
    },
    input: {
      padding: "10px 12px",
      lineHeight: "24px",
      fontSize: 14,
      color: "#333",
      minWidth: (props: { type: DatePickerView }): number => DatePickerData[props.type].width,
    },
  }),
);

interface DatePickerFilterProps extends FilterItemCommonProps {
  filter: YearFilter | MonthFilter | DayFilter;
  type: DatePickerView;
}

const DatePickerFilter: React.FunctionComponent<DatePickerFilterProps> = (props) => {
  const { filter, disableLabel, type = "year", onChange } = props;
  const classes = useStyles({ type });
  const [selectedDate, setSelectedDate] = useState<Date>(
    fromUnixTime(filter.max ?? filter.min ?? +(Date.now() / 1000).toFixed(0)),
  );

  const handleDateChange = (date: Date | null) => {
    if (date) setSelectedDate(date);
  };

  useEffect(() => {
    const unixTime = +(selectedDate.getTime() / 1000).toFixed(0);
    if (onChange)
      onChange({
        filterID: filter.id,
        name: filter.name,
        operator: filter.operator,
        timestamp: unixTime,
        type: "DateFilterInput",
      });
  }, [selectedDate]);

  return (
    <div className={classes.root}>
      {!disableLabel && !!filter.name ? (
        <Typography noWrap className={classes.label}>
          {filter.name}
        </Typography>
      ) : null}
      <MuiPickersUtilsProvider utils={DateFnsUtils} locale={zhCN}>
        <DatePicker
          className={classes.datePicker}
          variant="inline"
          format={DatePickerData[type].format}
          size="small"
          margin="none"
          disableToolbar
          autoOk
          minDate={filter.min ? fromUnixTime(filter.min) : undefined}
          maxDate={filter.max ? fromUnixTime(filter.max) : undefined}
          value={selectedDate}
          inputVariant="outlined"
          views={DatePickerData[type].views}
          InputProps={{
            classes: { input: classes.input },
          }}
          onChange={handleDateChange}
        />
      </MuiPickersUtilsProvider>
    </div>
  );
};

export default DatePickerFilter;
