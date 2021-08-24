import { ButtonBase, Menu } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { getYear } from "date-fns";
import _ from "lodash";
import { MenuDown } from "mdi-material-ui";
import React, { useEffect, useRef, useState } from "react";
import { SqlOperator } from "../../../../../generated/graphql";
import FilterItem, { ChartFilterItemValueType } from "./filter-item";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "6px 10px",
      backgroundColor: "#f8f8f8",
      borderRadius: 2,
      color: "#666666",
    },
    icon: {
      fontSize: 16,
      color: "#000",
    },
  }),
);

export type ChartFilterType = "region" | "dealType" | "year";

interface ChartFilterProps {
  type: ChartFilterType;
  onValueChange?: (value: ChartFilterItemValueType) => void;
}

const ChartFilter: React.FunctionComponent<ChartFilterProps> = ({ type, onValueChange }) => {
  const classes = useStyles();
  const [selectedItemValue, setSelectedItemValue] = useState<ChartFilterItemValueType | null>(null);
  const [itemMenuOpen, setItemMenuOpen] = useState(false);
  const buttonRef = useRef<HTMLButtonElement | null>(null);
  const [itemValues, setItemValues] = useState<ChartFilterItemValueType[]>([]);

  function setupItemData() {
    switch (type) {
      case "year":
        {
          const currentYear = getYear(new Date());
          const years = _.rangeRight(currentYear - 10, currentYear + 1);
          let newItemValues: ChartFilterItemValueType[] = years.map<ChartFilterItemValueType>((year) => {
            return {
              name: year.toString(),
              operator: SqlOperator.Equal,
              value: [year.toString()],
            };
          });
          newItemValues = [
            {
              name: "全部年份",
              operator: SqlOperator.Any,
              value: [""],
            },
            ...newItemValues,
            {
              name: (_.last(years)?.toString() ?? "") + " 以前",
              operator: SqlOperator.LessThan,
              value: [_.last(years)?.toString() ?? ""],
            },
          ];
          setItemValues(newItemValues);
        }
        break;
      case "dealType":
        setItemValues([
          {
            name: "种子 - A 轮",
            operator: SqlOperator.In,
            value: [
              "105001100",
              "10101",
              "105001200",
              "105001201",
              "10102",
              "105001300",
              "105001301",
              "105001302",
              "105001303",
              "105001304",
            ],
          },
          {
            name: "B - C 轮",
            operator: SqlOperator.In,
            value: [
              "10103",
              "105001400",
              "105001401",
              "105001402",
              "105001403",
              "105001404",
              "10104",
              "105001500",
              "105001501",
              "105001502",
              "105001503",
              "105001504",
            ],
          },
          {
            name: "D 轮 - Pre-IPO",
            operator: SqlOperator.In,
            value: [
              "10105",
              "105001600",
              "105001601",
              "105001602",
              "105001603",
              "105001604",
              "10106",
              "105001700",
              "105001701",
              "105001702",
              "105001703",
              "105001704",
              "105002800",
              "105001800",
              "105001900",
              "105001901",
              "105002000",
              "105002200",
            ],
          },
          {
            name: "IPO",
            operator: SqlOperator.In,
            value: ["105002201", "105002202"],
          },
          {
            name: "M&A",
            operator: SqlOperator.In,
            value: ["105002502", "105002905", "105002508", "105002510", "105002511", "105002503"],
          },
        ]);
        break;
      case "region":
        setItemValues([
          {
            name: "国内/海外",
            operator: SqlOperator.Any,
            value: [""],
          },
          {
            name: "国内",
            operator: SqlOperator.Equal,
            value: ["0300000000"],
          },
          {
            name: "海外",
            operator: SqlOperator.UnEqual,
            value: ["0300000000"],
          },
        ]);
        break;
    }
  }

  useEffect(() => {
    setupItemData();
  }, []);

  useEffect(() => {
    if (selectedItemValue == null && itemValues.length > 0) {
      setSelectedItemValue(itemValues[0]);
    }
  }, [itemValues]);

  useEffect(() => {
    if (onValueChange && selectedItemValue) {
      onValueChange(selectedItemValue);
    }
  }, [selectedItemValue]);

  function onItemClick(value: ChartFilterItemValueType) {
    setItemMenuOpen(false);
    setSelectedItemValue(value);
  }

  return (
    <>
      <ButtonBase ref={buttonRef} className={classes.root} onClick={(): void => setItemMenuOpen(true)}>
        {selectedItemValue?.name}
        <MenuDown className={classes.icon} />
      </ButtonBase>
      <Menu anchorEl={buttonRef.current} open={itemMenuOpen} onClose={(): void => setItemMenuOpen(false)}>
        {itemValues.map((itemValue, index) => (
          <FilterItem key={index} value={itemValue} selected={itemValue == selectedItemValue} onClick={onItemClick} />
        ))}
      </Menu>
    </>
  );
};

export default ChartFilter;
