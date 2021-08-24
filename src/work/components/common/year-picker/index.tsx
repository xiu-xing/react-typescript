import { Box, Button, IconButton, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { ChevronLeft, ChevronRight } from "@material-ui/icons";
import nanoid from "nanoid";
import React, { useEffect, useMemo, useState } from "react";
import { withAlphaHex } from "with-alpha-hex";
import theme from "../../../theme";

const useStyles = makeStyles(() =>
  createStyles({
    content: {
      width: 310,
      height: 305,
      display: "flex",
      padding: "12px 0",
      flexDirection: "column",
      justifyContent: "center",
      border: "1px solid #EEE",
    },
    header: {
      display: "flex",
      alignItems: "center",
      marginBottom: 8,
      justifyContent: "space-between",
    },
    title: {
      width: "100%",
      height: 23,
      justifyContent: "center",
      display: "flex",
      overflow: "hidden",
      fontSize: 16,
      color: "#333",
    },
    body: {
      height: "100%",
      width: "100%",
      display: "grid",
      gridAutoFlow: "row",
      gridTemplateRows: "1fr 1fr 1fr 1fr",
      gridTemplateColumns: "1fr 1fr 1fr 1fr",
    },
  }),
);

interface YearPickerProps {
  minValue?: number;
  maxValue?: number;
  onChange?: (value: number) => void;
}

const YearPicker: React.FC<YearPickerProps> = (props) => {
  const classes = useStyles();
  const nowYear = new Date(Date.now()).getFullYear();
  const [currentValue, setCurrentValue] = useState<number>(nowYear);
  const [page, setPage] = useState(0);
  const { onChange, minValue, maxValue } = props;

  const handlePreviousPage = (): void => {
    const min = minValue ?? nowYear - 165;
    if (nowYear - 5 + page * 16 > min) setPage((prev) => prev - 1);
  };

  const handleNextPage = (): void => {
    const max = maxValue ?? nowYear + 170;
    if (nowYear + 10 + page * 16 < max) setPage((prev) => prev + 1);
  };

  const handleCurrentChange = (c: number): void => {
    setCurrentValue(c);
  };

  useEffect(() => {
    if (currentValue) onChange && onChange(currentValue);
  }, [currentValue, onChange]);

  useEffect(() => {
    if (!maxValue || !minValue) return;
    if (currentValue > maxValue) {
      setCurrentValue(maxValue);
    }
    if (currentValue < minValue) {
      setCurrentValue(minValue);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [minValue, maxValue]);

  const pickerBody = useMemo(() => {
    const yearArray: number[] = [];
    const min: number = nowYear - 5 + page * 16;
    const max: number = min + 15;

    for (let i = min; i <= max; i++) {
      yearArray.push(i);
    }

    return (
      <Box className={classes.body}>
        {yearArray.map((v) => {
          const disabled = v < (minValue ?? 1990) || v > (maxValue ?? nowYear + 100);
          return (
            <Button
              key={nanoid(8)}
              onClick={() => handleCurrentChange(v)}
              disabled={disabled}
              style={{
                background: v === currentValue ? withAlphaHex(theme.palette.primary.main, 0.16) : "#fff",
                color: v === currentValue ? theme.palette.primary.main : disabled ? "#999" : "#333",
              }}
            >
              <Typography>{v}</Typography>
            </Button>
          );
        })}
      </Box>
    );
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page, currentValue, minValue, maxValue]);

  return (
    <Box className={classes.content}>
      <Box className={classes.header}>
        <IconButton onClick={handlePreviousPage} disabled={nowYear - 5 + page * 16 < (minValue ?? nowYear - 165)}>
          <ChevronLeft />
        </IconButton>
        <Box className={classes.title}>{currentValue}</Box>
        <IconButton onClick={handleNextPage} disabled={nowYear + 10 + page * 16 > (maxValue ?? nowYear + 170)}>
          <ChevronRight />
        </IconButton>
      </Box>
      {pickerBody}
    </Box>
  );
};

export default YearPicker;
