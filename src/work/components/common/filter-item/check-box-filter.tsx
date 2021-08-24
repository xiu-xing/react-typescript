import { Button, Checkbox, ListItem, Menu, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { MenuDown } from "mdi-material-ui";
import React, { useEffect, useRef, useState } from "react";
import { FilterItemCommonProps } from ".";
import { CheckboxFilter } from "../../../generated/graphql";

const useStyles = makeStyles((theme: Theme) =>
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
    paper: {
      padding: "8px 0",
    },
    listItem: {
      padding: "4px 16px",
      minWidth: 100,
    },
    checkbox: {
      padding: 0,
    },
    listItemLabel: {
      fontSize: 14,
      color: "#333",
      marginInlineStart: "8px",
      lineHeight: "24px",
    },
    button: {
      padding: "5px 12px",
      paddingRight: 8,
      "&:hover": {
        background: "transparent",
      },
    },
    buttonLabel: {
      display: "inline-flex",
      alignItems: "center",
      fontSize: 14,
      lineHeight: "24px",
      color: "#333",
    },
    menuIcon: {
      marginInlineStart: "4px",
      color: theme.palette.primary.main,
    },
  }),
);

interface CheckBoxFilterProps extends FilterItemCommonProps {
  filter: CheckboxFilter;
}

const CheckBoxFilter: React.FunctionComponent<CheckBoxFilterProps> = (props) => {
  const { disableLabel, filter, onChange } = props;
  const classes = useStyles();

  const anchorEl = useRef<HTMLButtonElement | null>(null);
  const [open, setOpen] = useState(false);
  const [selectedKeys, setSelectedKeys] = useState<string[]>([]);

  const handleClose = () => {
    setOpen(false);
  };

  useEffect(() => {
    if (onChange) {
      onChange({
        filterID: filter.id,
        values: selectedKeys,
        name: filter.name,
        operator: filter.operator,
        type: "CheckboxFilterInput",
      });
    }
  }, [selectedKeys]);

  return (
    <div className={classes.root}>
      {!disableLabel && filter.name ? <Typography className={classes.label}>{filter.name}</Typography> : null}
      <Button
        className={classes.button}
        onClick={() => setOpen(true)}
        ref={anchorEl}
        variant="outlined"
        disableRipple
        disableFocusRipple
        disableTouchRipple
      >
        <Typography noWrap className={classes.buttonLabel}>
          共 {selectedKeys.length} {filter.name} <MenuDown className={classes.menuIcon} />
        </Typography>
      </Button>
      <Menu
        open={open}
        anchorEl={anchorEl.current}
        onClose={handleClose}
        classes={{ paper: classes.paper }}
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "left",
        }}
        getContentAnchorEl={null}
        MenuListProps={{
          disablePadding: true,
        }}
      >
        {filter.options && filter.options.length > 0 ? (
          filter.options.map((o, i) => (
            <ListItem
              key={i}
              className={classes.listItem}
              button
              onClick={() =>
                setSelectedKeys((prev) => {
                  const value: string = o?.value ?? "";
                  if (prev.includes(value)) {
                    return prev.filter((p) => p !== value);
                  } else {
                    return [...prev, value];
                  }
                })
              }
            >
              <Checkbox
                color="primary"
                size="small"
                disableRipple
                className={classes.checkbox}
                name={o?.value}
                checked={Boolean(selectedKeys.includes(o?.value as string))}
              />
              <Typography className={classes.listItemLabel}>{o?.value}</Typography>
            </ListItem>
          ))
        ) : (
          <div>暂无选项</div>
        )}
      </Menu>
    </div>
  );
};

export default CheckBoxFilter;
