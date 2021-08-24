import { Box, MenuItem, Select, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { Check } from "mdi-material-ui";
import React, { ReactNode } from "react";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {},
    select: {
      position: "relative",
      padding: "0 !important",
      "& .MuiSelect-root": {
        paddingTop: 6,
        paddingBottom: 6,
        paddingLeft: 12,
        fontSize: 14,
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
    selectHasIcon: {
      "& .MuiSelect-root": {
        paddingLeft: 32,
      },
    },
    menuItem: {
      "&[aria-selected='true']": {
        backgroundColor: "white",
      },
    },
    selectText: {
      fontSize: 14,
      color: "#333",
      fontWeight: theme.typography.fontWeightRegular,
      lineHeight: "24px",
    },
  }),
);

export const ITEM_HEIGHT = 36;
export const ITEM_PADDING_TOP = 8;

export const MenuProps = {
  PaperProps: {
    style: {
      maxHeight: ITEM_HEIGHT * 5 + ITEM_PADDING_TOP * 2,
    },
  },
};
export interface SelectItem {
  id: any;
  name: string;
}
interface ConditionSelectProps {
  values: any[];
  selectItemList: SelectItem[];
  onChange?: (selectOptions: any) => void;
  icon?: ReactNode;
  renderValue?: string | JSX.Element;
  multiple?: boolean;
  moreOptionButton?: boolean;
  onMoreOptionClick?: () => void;
  showCheck?: boolean;
}

const ConditionSelect: React.FunctionComponent<ConditionSelectProps> = (props) => {
  const classes = useStyles();
  const {
    values,
    renderValue,
    selectItemList,
    icon,
    multiple = false,
    moreOptionButton,
    onChange,
    onMoreOptionClick,
    showCheck = true,
  } = props;

  function gerRenderValue() {
    if (typeof renderValue === "string") return <Typography className={classes.selectText}>{renderValue}</Typography>;

    return renderValue;
  }

  function getSelectItemList() {
    const checkedList = values.map((item: any) => JSON.stringify(item));

    return selectItemList.map((select) => (
      <MenuItem key={JSON.stringify(select.id)} value={JSON.stringify(select.id)} className={classes.menuItem}>
        {select.name}
        <Box flex={1} />
        {showCheck && checkedList.includes(JSON.stringify(select.id)) && <Check color="primary" />}
      </MenuItem>
    ));
  }

  function getValues() {
    const res: string[] = values.map((value) => JSON.stringify(value));
    if (multiple) return res;

    return res[0] ?? "";
  }

  return (
    <div className={classes.root}>
      <Select
        variant="outlined"
        multiple={multiple}
        displayEmpty
        value={getValues()}
        className={clsx(classes.select, { [classes.selectHasIcon]: !!icon })}
        startAdornment={icon}
        renderValue={renderValue ? gerRenderValue : undefined}
        onChange={(e) => {
          onChange && onChange(e.target.value);
        }}
        MenuProps={{
          anchorOrigin: {
            vertical: "bottom",
            horizontal: "center",
          },
          transformOrigin: {
            vertical: "top",
            horizontal: "center",
          },
          getContentAnchorEl: undefined,
          ...MenuProps,
        }}
      >
        {getSelectItemList()}
        {moreOptionButton && (
          <MenuItem className={classes.menuItem} key="more" onClick={onMoreOptionClick}>
            更多选项
          </MenuItem>
        )}
      </Select>
    </div>
  );
};

export default ConditionSelect;
