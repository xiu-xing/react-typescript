import { Box, ButtonBase, MenuItem, Select, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { set as setDate } from "date-fns";
import _ from "lodash";
import React, { useEffect, useState } from "react";
import { FilterInputs, TrackerTheme } from "../../../../../generated/graphql";
import CommonGridContainer from "../../../../common/common-grid-components/grid/container";
import TrackContainer from "../../../container";
import TrackGridTabContainer from "../container";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: "20px 24px 8px 24px",
      display: "flex",
      flexWrap: "wrap",
      columnGap: "12px",
      rowGap: "6px",
    },
    title: {
      fontSize: "14px",
      color: "#666",
      whiteSpace: "nowrap",
      paddingRight: "12px",
    },
    selectFilter: {
      display: "flex",
      alignItems: "center",
    },
    timeFilters: {
      marginRight: "12px",
      display: "flex",
      flexWrap: "nowrap",
      borderRadius: 4,
      overflow: "hidden",
      border: "1px solid #E6E6E6",
      "& button:nth-child(1n+2)": {
        borderLeft: "1px solid #E6E6E6",
      },
    },
    filterItem: {
      cursor: "pointer",
      "& p": {
        fontSize: "14px",
        color: "#333",
        padding: "6px 12px",
        whiteSpace: "nowrap",
      },
    },
    selectedFilter: {
      backgroundColor: theme.palette.primary.main,
      "& p": {
        color: "white",
      },
    },
    select: {
      position: "relative",
      padding: "0 !important",
      "& .MuiSelect-root": {
        minWidth: "30px",
        paddingTop: "6px",
        paddingBottom: "6px",
        paddingLeft: "12px",
      },
      "& .MuiSvgIcon-root:not(.MuiSelect-icon)": {
        position: "absolute",
        left: 12,
      },
      "& .MuiSelect-select:focus": {
        backgroundColor: "transparent",
      },
      "& .MuiSelect-icon": {
        color: theme.palette.primary.main,
      },
      "& .MuiOutlinedInput-notchedOutline": {
        borderColor: "#EEE",
      },
    },
    selectText: {
      fontSize: "14px",
      color: "#333",
      fontWeight: theme.typography.fontWeightRegular,
      lineHeight: "24px",
    },
    menuItem: {
      minWidth: "72px",
      display: "flex",
      justifyContent: "space-between",
      "&[aria-selected='true']": {
        backgroundColor: "white",
      },
    },
    menuItemText: {
      textAlign: "center",
      fontSize: "14px",
      color: "#333",
    },
    radius: {
      borderRadius: "4px",
    },
  }),
);

const filters = [
  {
    name: "近一周",
    value: "7",
  },
  {
    name: "近 30 天",
    value: "30",
  },
  {
    name: "近 90 天",
    value: "90",
  },
  {
    name: "近半年",
    value: "180",
  },
  {
    name: "近一年",
    value: "365",
  },
];

const GridFilter: React.FunctionComponent = () => {
  const classes = useStyles();
  const { gridFilters, setGridFilters, filterTag, setFilterTag } = TrackGridTabContainer.useContainer();
  const { setRowSelections, setUseQueryEndCursor, setPage } = CommonGridContainer.useContainer();

  const { userTagList, trackTheme } = TrackContainer.useContainer();
  const [selectTime, setSelectTime] = useState<string>();

  useEffect(() => {
    switch (trackTheme) {
      case TrackerTheme.TrackerThemeVertical:
        setSelectTime("7");
        break;
      default:
        setSelectTime("365");
        break;
    }
  }, [trackTheme]);

  useEffect(() => {
    if (!filterTag && selectTime === undefined) return;
    const newGridFilters: FilterInputs = _.clone(gridFilters ?? {});
    if (filterTag) {
      const selectorFilterInput = {
        filterID: "tracker_tag_selector_filter_id",
        filterValue: filterTag,
      };
      newGridFilters.selectorFilterInputs = [selectorFilterInput];
    } else {
      newGridFilters.selectorFilterInputs = undefined;
    }

    if (selectTime) {
      // 开始时间为零点往前推
      const data = setDate(new Date(), {
        hours: 0,
        minutes: 0,
        seconds: 0,
        milliseconds: 0,
      });
      const endTime = Math.floor(new Date().getTime() / 1000);
      const startTimestamp = Math.floor(data.getTime() / 1000) - (parseInt(selectTime) - 1) * 24 * 60 * 60;

      const dateRangeSelectorFilterInput = {
        filterID: "tracker_date_selector_filter_id",
        startTimestamp: startTimestamp,
        endTimestamp: endTime,
      };
      newGridFilters.dateRangeSelectorFilterInput = [dateRangeSelectorFilterInput];
    } else {
      newGridFilters.dateRangeSelectorFilterInput = undefined;
    }
    setRowSelections([]);
    setUseQueryEndCursor(null);
    setPage(1);
    setGridFilters(newGridFilters);
  }, [filterTag, selectTime]);

  return (
    <div className={classes.root}>
      <Box className={classes.selectFilter}>
        <Typography className={classes.title}>时间范围</Typography>
        <div className={classes.timeFilters}>
          {filters.map((filter) => (
            <ButtonBase
              key={filter.name}
              onClick={() => setSelectTime(filter.value)}
              className={clsx(classes.filterItem, selectTime === filter.value && classes.selectedFilter)}
            >
              <Typography>{filter.name}</Typography>
            </ButtonBase>
          ))}
        </div>
      </Box>
      <Box className={classes.selectFilter}>
        <Typography className={classes.title}>标签筛选</Typography>
        <Select
          variant="outlined"
          displayEmpty
          value={filterTag ?? ""}
          className={classes.select}
          MenuProps={{
            anchorOrigin: {
              vertical: "bottom",
              horizontal: "center",
            },
            transformOrigin: {
              vertical: "top",
              horizontal: "center",
            },
            PaperProps: {
              style: {
                maxHeight: 224,
              },
            },
            getContentAnchorEl: undefined,
          }}
        >
          <MenuItem value={""} className={classes.menuItem} onClick={() => setFilterTag("")}>
            <Typography className={classes.menuItemText}>全部</Typography>
          </MenuItem>
          {userTagList.map((tag, index) => {
            return (
              <MenuItem
                value={tag.id ?? ""}
                key={index}
                className={classes.menuItem}
                onClick={() => setFilterTag(tag.id ?? "")}
              >
                <Typography className={classes.menuItemText}>{tag.name}</Typography>
              </MenuItem>
            );
          })}
        </Select>
      </Box>
    </div>
  );
};

export default GridFilter;
