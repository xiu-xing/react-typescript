import DateFnsUtils from "@date-io/date-fns";
import { Box, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { DatePicker, MuiPickersUtilsProvider } from "@material-ui/pickers";
import { fromUnixTime } from "date-fns";
import { zhCN } from "date-fns/locale";
import React, { useEffect, useMemo, useState } from "react";
import { FilterItemCommonProps } from ".";
import { DateRangeFilter as DateRangeFilterModel } from "../../../generated/graphql";
import { ReactComponent as Calender } from "./assets/calender.svg";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      display: "grid",
      gridTemplateColumns: "max-content 1fr",
      gridColumnGap: "1rem",
      alignItems: "center",
    },
    label: {
      color: "#666",
      fontSize: 14,
      minWidth: "max-content",
    },
    datepicker: {
      width: 72,
      "& input": {
        padding: 0,
        cursor: "pointer",
        height: 24,
      },
      "& .MuiInput-underline:before": {
        borderWidth: 0,
      },
      "& .MuiInput-underline:hover:not(.Mui-disabled):before": {
        borderWidth: 0,
      },
      "& .MuiInput-underline:after": {
        borderWidth: 0,
      },
      "& .MuiInputBase-root": {
        fontSize: "14px",
        lineHeight: "24px",
      },
    },
  }),
);

interface DateRangeFilterProps extends FilterItemCommonProps {
  filter: DateRangeFilterModel;
}

const DateRangeFilter: React.FC<DateRangeFilterProps> = (props) => {
  const classes = useStyles();
  const { filter, disableLabel, onChange } = props;
  const [start, setStart] = useState(filter.defaultStartDate);
  const [end, setEnd] = useState(filter.defaultEndDate);

  const min = useMemo(() => start, [filter.min, start, end]);

  const max = useMemo(() => end, [filter.max, start, end]);

  useEffect(() => {
    onChange?.({
      type: "DateRangeFilterInput",
      id: filter.id,
      name: filter.name,
      start: start,
      end: end,
    });
  }, [start, end]);

  return (
    <div className={classes.root}>
      {!disableLabel && !!filter.name ? (
        <Typography noWrap className={classes.label}>
          {filter.name}
        </Typography>
      ) : null}
      <Box
        display="grid"
        padding="6px 12px"
        border="1px solid #EEE"
        borderRadius="4px"
        alignItems="center"
        gridTemplateColumns="repeat(4, max-content)"
      >
        <MuiPickersUtilsProvider utils={DateFnsUtils} locale={zhCN}>
          <DatePicker
            className={classes.datepicker}
            value={fromUnixTime(start)}
            variant="inline"
            size="small"
            autoOk
            margin="none"
            format="yyyy.MM.dd"
            disableToolbar
            minDate={filter.min ? fromUnixTime(filter.min) : undefined}
            maxDate={fromUnixTime(max)}
            inputVariant="standard"
            onChange={(date) => {
              if (date) {
                setStart(Math.round(date.getTime() / 1000));
              }
            }}
          />
          <svg height="24" width="13" style={{ marginInline: "8px" }}>
            <rect y="12" height="1" width="13" fill="#EEE" />
          </svg>
          <DatePicker
            className={classes.datepicker}
            autoOk
            value={fromUnixTime(end)}
            onChange={(date) => {
              if (date) {
                setEnd(Math.round(date.getTime() / 1000));
              }
            }}
            variant="inline"
            size="small"
            margin="none"
            format="yyyy.MM.dd"
            disableToolbar
            minDate={fromUnixTime(min)}
            maxDate={filter.max ? fromUnixTime(filter.max) : undefined}
            inputVariant="standard"
          />
        </MuiPickersUtilsProvider>
        <Calender style={{ marginLeft: "12px" }} />
      </Box>
    </div>
  );
};

export default DateRangeFilter;
