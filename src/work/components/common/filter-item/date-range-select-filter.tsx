import { Box, Button, ButtonGroup, Popover, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React, { useEffect, useMemo, useState } from "react";
import { FilterItemCommonProps } from ".";
import { DateRangeSelectorFilter as DateRangeSelectorFilterModel } from "../../../generated/graphql";
import YearPicker from "../year-picker";

const useStyles = makeStyles(() =>
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
    text: {
      color: "#333333",
      fontSize: 14,
      minWidth: 50,
    },
    focusVisible: {
      color: "transparent",
    },
    activeButton: {
      borderColor: "#E9EDF3",
      minWidth: 76,
      fontWeight: 400,
      backgroundColor: "#E9EDF3",
    },
    normalButton: {
      borderColor: "#E3E3E3",
      fontWeight: 400,
      minWidth: 76,
    },
    popoverContent: {
      display: "flex",
      flexDirection: "row",
    },
  }),
);

interface DateRangeSelectFilterProps extends FilterItemCommonProps {
  filter: DateRangeSelectorFilterModel;
}

const DateRangeSelectFilter: React.FC<DateRangeSelectFilterProps> = (props) => {
  const classes = useStyles();
  const { filter, disableLabel, onChange } = props;

  const now = new Date(Date.now()).getFullYear();
  const [startTimestamp, setStartTimestamp] = useState<number>();
  const [endTimestamp, setEndTimestamp] = useState<number>();
  const [cStartYear, setCStartYear] = useState<number>();
  const [cEndYear, setCEndYear] = useState<number>(now);
  const [displayValue, setDisplayValue] = useState(filter.options && filter.options[0]?.key);
  const [activeIndex, setActiveIndex] = useState(filter.options && filter.options[0]?.value);
  const [anchorEl, setAnchorEl] = useState<HTMLButtonElement | null>(null);

  const minYear = useMemo(() => cStartYear, [cStartYear]);

  const maxYear = useMemo(() => cEndYear, [cEndYear]);

  useEffect(() => {
    const nowTimestamp = Math.ceil(Date.now() / 1000);
    onChange?.({
      type: "DateRangeSelectorFilterInput",
      filterID: filter.id ?? "",
      name: filter.name,
      startTimestamp: startTimestamp ?? nowTimestamp,
      endTimestamp: endTimestamp ?? nowTimestamp,
      displayValue: displayValue,
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [startTimestamp, endTimestamp, displayValue, filter]);

  useEffect(() => {
    if (!activeIndex || activeIndex === "customize") return;
    const nowYear = new Date(Date.now()).getFullYear();
    const startYear = new Date(`${nowYear - Number(activeIndex)}-01-01`);
    setStartTimestamp(Math.ceil(startYear.getTime() / 1000));
    setEndTimestamp(Math.ceil(Date.now() / 1000));
  }, [activeIndex]);

  const handleClose = (): void => {
    setAnchorEl(null);
    const startDate = new Date(`${cStartYear}-01-01`);
    const endDate = new Date(`${cEndYear}-12-31`);
    setStartTimestamp(Math.ceil(startDate.getTime() / 1000));
    setEndTimestamp(Math.ceil(endDate.getTime() / 1000));
    setDisplayValue(cStartYear + " —— " + cEndYear);
  };

  const calender = (active: boolean) => {
    return (
      <svg width="20px" height="20px" style={{ marginRight: 2 }} viewBox="0 0 20 20" version="1.1">
        <g id="详情页（上市）" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
          <g id="上市企业2" transform="translate(-666.000000, -2388.000000)">
            <g id="结果" transform="translate(258.000000, 2308.000000)">
              <g id="编组备份-8" transform="translate(193.000000, 71.000000)">
                <g id="按钮/筛选/outline-方形备份-2" transform="translate(69.000000, 0.000000)">
                  <g id="icon/16x16/箭头/down" transform="translate(146.000000, 9.000000)">
                    <g id="矩形" />
                    <path
                      d="M6.38888889,0.875 L6.38888889,2.68055556 L13.6111111,2.68055556 L13.6111111,0.875 L15.4166667,0.875 L15.4166667,2.68055556 L16.3194444,2.68055556 C17.254085,2.68055556 18.028787,3.40027874 18.1166944,4.31286892 L18.125,4.48611111 L18.125,17.125 C18.125,18.0596405 17.4052768,18.8343426 16.4926866,18.9222499 L16.3194444,18.9305556 L3.68055556,18.9305556 C2.74591503,18.9305556 1.971213,18.2108324 1.88330563,17.2982422 L1.875,17.125 L1.875,4.48611111 C1.875,3.55147059 2.58672626,2.77676855 3.50590214,2.68886118 L3.68055556,2.68055556 L4.58333333,2.68055556 L4.58333333,0.875 L6.38888889,0.875 Z M16.3194444,7.19444444 L3.68055556,7.19444444 L3.68055556,17.125 L16.3194444,17.125 L16.3194444,7.19444444 Z M13.8575,9.605 L13.8575,10.3325 L11.81,10.3325 L11.6825,11.75 C11.915,11.63 12.14,11.555 12.44,11.555 C13.3625,11.555 14.12,12.1025 14.12,13.31 C14.12,14.5325 13.2275,15.2225 12.26,15.2225 C11.4690909,15.2225 10.9447107,14.9311777 10.5628926,14.5908321 L10.4525,14.4875 L10.865,13.925 C11.18,14.24 11.5775,14.5175 12.155,14.5175 C12.7775,14.5175 13.25,14.075 13.25,13.34 C13.25,12.605 12.83,12.185 12.2,12.185 C11.90625,12.185 11.7114583,12.2579167 11.4680556,12.40375 L11.315,12.5 L10.895,12.2225 L11.06,9.605 L13.8575,9.605 Z M7.49,9.5 C8.5025,9.5 9.155,10.16 9.155,11.1575 C9.155,12.2225 8.3075,13.325 7.1375,14.4425 C7.3275,14.4225 7.54416667,14.4058333 7.7475,14.3969444 L8.0375,14.39 L9.4175,14.39 L9.4175,15.125 L5.855,15.125 L5.855,14.6225 C7.4825,13.1825 8.3225,12.11 8.3225,11.2025 C8.3225,10.6025 8,10.19 7.385,10.19 C7.004375,10.19 6.68117188,10.4024609 6.41036621,10.6816748 L6.2975,10.805 L5.81,10.325 C6.2825,9.815 6.77,9.5 7.49,9.5 Z"
                      id="形状"
                      fill={active ? "#4F709B" : "#000000"}
                      opacity={active ? "1" : "0.603562128"}
                      mask="url(#mask-2)"
                    />
                  </g>
                </g>
              </g>
            </g>
          </g>
        </g>
      </svg>
    );
  };

  return (
    <div className={classes.root}>
      {!disableLabel && !!filter.name ? (
        <Typography noWrap className={classes.label}>
          {filter.name}
        </Typography>
      ) : null}
      <ButtonGroup style={{ height: 36 }}>
        {filter.options?.map((v) => {
          if (v?.value === "customize") {
            return (
              <Button
                key={v?.value}
                className={activeIndex === v?.value ? classes.activeButton : classes.normalButton}
                focusVisibleClassName={classes.focusVisible}
                onClick={(event: React.MouseEvent<HTMLButtonElement>) => {
                  setAnchorEl(event.currentTarget);
                  setActiveIndex(v?.value ?? "0");
                }}
              >
                {calender(activeIndex === v?.value)}
                <Typography className={classes.text}>{cStartYear ?? "自定义"}</Typography>
                {cStartYear && (
                  <svg height="24" width="13" style={{ marginInline: "2px" }}>
                    <rect y="12" height="1" width="13" fill="#333" />
                  </svg>
                )}
                {cStartYear && <Typography className={classes.text}>{cEndYear ?? "自定义"}</Typography>}
              </Button>
            );
          }
          return (
            <Button
              key={v?.value}
              className={activeIndex === v?.value ? classes.activeButton : classes.normalButton}
              onClick={() => {
                if (activeIndex === v?.value) return;
                setActiveIndex(v?.value ?? "0");
                setDisplayValue(v?.key ?? "");
              }}
            >
              {v?.key}
            </Button>
          );
        })}
      </ButtonGroup>
      <Popover
        anchorEl={anchorEl}
        open={Boolean(anchorEl)}
        onClose={handleClose}
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "center",
        }}
        transformOrigin={{
          vertical: "top",
          horizontal: "center",
        }}
        keepMounted
        disableScrollLock
      >
        <Box className={classes.popoverContent}>
          <YearPicker
            minValue={filter.min ? new Date(filter.min * 1000).getFullYear() : now - 20}
            maxValue={maxYear}
            onChange={(value) => {
              if (Boolean(anchorEl) === true) setCStartYear(value);
            }}
          />
          <YearPicker
            minValue={minYear ?? now - 20}
            maxValue={filter.max ? new Date(filter.max * 1000).getFullYear() : now}
            onChange={(value) => {
              if (Boolean(anchorEl) === true) setCEndYear(value);
            }}
          />
        </Box>
      </Popover>
    </div>
  );
};

export default DateRangeSelectFilter;
