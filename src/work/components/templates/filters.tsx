import { Box, MenuItem, Select, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Check } from "mdi-material-ui";
import React, { useEffect, useState } from "react";
import { SearchTemplatesSortBy } from "../../generated/graphql";
import { MenuProps } from "../common/condition-dialog/search-condition-input";
import Space from "../common/space";
import { Realm, REALMTITLE } from "../realm/types";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    title: {
      fontSize: 14,
      color: "#666",
    },
    select: {
      position: "relative",
      padding: "0 !important",
      "& .MuiSelect-root": {
        paddingTop: 6,
        paddingBottom: 6,
        paddingLeft: 12,
      },
      // start icon box
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
      fontSize: 14,
      color: "#333",
      fontWeight: theme.typography.fontWeightRegular,
      lineHeight: "24px",
    },
    menuItem: {
      "&[aria-selected='true']": {
        backgroundColor: "white",
      },
    },
  }),
);

interface FiltersProps {
  onChange?: (sortBy: SearchTemplatesSortBy, realmId?: string) => void;
}

const Filters: React.FunctionComponent<FiltersProps> = (props) => {
  const classes = useStyles();
  const { onChange } = props;
  const [sortBy, setSortBy] = useState<SearchTemplatesSortBy>(SearchTemplatesSortBy.LastViewedAt);
  const [realmId, setRealmId] = useState<string>("");

  const types: Array<{ name: string; value: string }> = [
    {
      value: "",
      name: "全部",
    },
    ...Object.entries(REALMTITLE).map(([value, name]) => ({ name, value })),
  ];
  const orders: Array<{ name: string; value: SearchTemplatesSortBy }> = [
    {
      name: "最近查看时间",
      value: SearchTemplatesSortBy.LastViewedAt,
    },
    {
      name: "最近执行时间",
      value: SearchTemplatesSortBy.LastNotifiedAt,
    },
  ];

  useEffect(() => {
    onChange?.(sortBy, !realmId ? undefined : realmId);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sortBy, realmId]);

  return (
    <Space className={classes.root} wrap size={["large", "middle"]}>
      <Box display="inline-flex" alignItems="center">
        <Typography noWrap className={classes.title}>
          模版类型
        </Typography>
        <Box width={12} />
        <Select
          variant="outlined"
          value={realmId}
          displayEmpty
          className={classes.select}
          onChange={(e) => setRealmId(e.target.value as Realm)}
          renderValue={(value) => (
            <Typography className={classes.selectText}>
              {types[types.findIndex((o) => o.value === (value as string))].name}
            </Typography>
          )}
          MenuProps={{
            ...MenuProps,
            anchorOrigin: {
              vertical: "bottom",
              horizontal: "center",
            },
            transformOrigin: {
              vertical: "top",
              horizontal: "center",
            },
            getContentAnchorEl: undefined,
          }}
        >
          {types.length > 0 ? (
            types.map((o) => (
              <MenuItem className={classes.menuItem} key={o.value} value={o.value}>
                {o.name}
                <Box flex={1} />
                {o.value === realmId && <Check color="primary" />}
              </MenuItem>
            ))
          ) : (
            <Box paddingY="12px">
              <Typography align="center">暂无选项</Typography>
            </Box>
          )}
        </Select>
      </Box>
      <Box display="inline-flex" alignItems="center">
        <Typography noWrap className={classes.title}>
          排列方式
        </Typography>
        <Box width={12} />
        <Select
          variant="outlined"
          value={sortBy}
          className={classes.select}
          onChange={(e) => setSortBy(e.target.value as SearchTemplatesSortBy)}
          renderValue={(value) => (
            <Typography className={classes.selectText}>
              {orders[orders.findIndex((o) => o.value === (value as string))].name}
            </Typography>
          )}
          MenuProps={{
            ...MenuProps,
            anchorOrigin: {
              vertical: "bottom",
              horizontal: "center",
            },
            transformOrigin: {
              vertical: "top",
              horizontal: "center",
            },
            getContentAnchorEl: undefined,
          }}
        >
          {orders.length > 0 ? (
            orders.map((o) => (
              <MenuItem className={classes.menuItem} key={o.value} value={o.value}>
                {o.name}
                <Box flex={1} />
                {o.value === sortBy && <Check color="primary" />}
              </MenuItem>
            ))
          ) : (
            <Box paddingY="12px">
              <Typography align="center">暂无选项</Typography>
            </Box>
          )}
        </Select>
      </Box>
    </Space>
  );
};

export default Filters;
