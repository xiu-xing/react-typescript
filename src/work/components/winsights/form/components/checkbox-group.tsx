import { Checkbox, FormControlLabel, Box, Theme, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import _ from "lodash";
import React, { ChangeEvent, useEffect, useState } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    title: {
      fontSize: 14,
      color: "#666",
    },
    gridBox: {
      display: "grid",
      gridTemplateColumns: "1fr 1fr",
      gridGap: "12px",
    },
    error: {
      color: "#E00000",
    },
    formControlLabel: {
      margin: 0,
      marginLeft: -2,
      width: "100%",
      minWidth: 50,
      "& .MuiRadio-root": {
        padding: 0,
      },
      "& .MuiCheckbox-root": {
        padding: 0,
      },
      "& .MuiSvgIcon-root": {
        fontSize: 17,
      },
      "& .MuiFormControlLabel-label": {
        marginLeft: 4,
        fontSize: 14,
        lineHeight: 1.71,
        color: "#333",
        fontWeight: theme.typography.fontWeightRegular,
        whiteSpace: "nowrap",
        overflow: "hidden",
        textOverflow: "ellipsis",
        width: "100%",
      },
    },
  }),
);

interface CheckBoxGroup {
  labels: string[];
  itemId: string[];
  currentIndex: number;
  onValueChange: (values: string[]) => void;
}

const CheckBoxGroup: React.FunctionComponent<CheckBoxGroup> = (props) => {
  const classes = useStyles();
  const [onSelect, setOnSelect] = useState<string[]>([props.itemId[0], "0", "0", "0", "0", "0"]);

  useEffect(() => {
    const expertList: string[] = [];
    props.itemId.forEach((value, i) => {
      if (props.currentIndex == i) {
        expertList.push(value);
      } else {
        expertList.push("0");
      }
    });
    setOnSelect(expertList);
  }, []);

  useEffect(() => {
    props.onValueChange(onSelect);
  }, [onSelect]);

  function selectHandel(e: ChangeEvent<{}>, checked: boolean, index: number) {
    if (onSelect.filter((p) => p == "0").length == 5 && !checked) return;
    if (checked) {
      setOnSelect((oldValue) => {
        const newValue = _.cloneDeep(oldValue);
        newValue[index] = props.itemId[index];
        return newValue;
      });
    }
    if (!checked) {
      setOnSelect((oldValue) => {
        const newValue = _.cloneDeep(oldValue);
        newValue[index] = "0";
        return newValue;
      });
    }
  }

  return (
    <>
      <Box display="flex">
        <Typography className={classes.title}>约访专家</Typography>
        <Box width={2} />
        <Typography className={classes.error}>*</Typography>
      </Box>
      <Box height={12} />
      <Box className={classes.gridBox}>
        {props.labels.map((value, index) => (
          <FormControlLabel
            key={index}
            className={classes.formControlLabel}
            control={<Checkbox color="primary" />}
            value={props.itemId[index]}
            checked={onSelect.includes(props.itemId[index])}
            label={value}
            onChange={(event: ChangeEvent<{}>, checked: boolean) => {
              selectHandel(event, checked, index);
            }}
          />
        ))}
      </Box>
    </>
  );
};

export default CheckBoxGroup;
