import { Button, Checkbox, ListItem, Menu, Typography } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import clsx from "clsx";
import { MenuDown } from "mdi-material-ui";
import { OverlayScrollbarsComponent } from "overlayscrollbars-react";
import React, { useMemo, useRef, useState } from "react";
import { FilterItemCommonProps } from ".";
import ConfigContainer from "../../../containers/configContainer";
import { NestedCheckboxFilter } from "../../../generated/graphql";
import { ContentItem } from "../../../models/filter/filterConfig-next";

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
      padding: 0,
    },
    bottom: {
      display: "flex",
      alignItems: "center",
      justifyContent: "space-between",
      borderTop: "1px solid #eee",
      padding: "6px 8px",
    },
    content: {
      display: "grid",
      outline: "none",
      gridTemplateColumns: "repeat(2,1fr)",
      "& .os-host>:not(:first-child)": {
        borderLeft: "1px solid #eee",
      },
    },
    contentBox: {
      padding: 0,
      paddingTop: 16,
      paddingBottom: 8,
      maxHeight: 204,
      height: 204,
    },
    listItem: {
      minWidth: 219,
      padding: "4px 16px",
    },
    listItemCheck: {
      backgroundColor: "#0000000a",
      "&:hover": {
        backgroundColor: "#0000000a",
      },
    },
    indeterminate: {
      color: theme.palette.primary.main,
    },
    checkbox: {
      padding: 0,
    },
    listItemLabel: {
      fontSize: 14,
      color: "#333",
      marginInlineStart: "4px",
      lineHeight: "24px",
    },
    primary: {
      color: theme.palette.primary.main,
    },
    buttonDefaultLabel: {
      color: "#666",
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

interface NestedCheckBoxFilterProps extends FilterItemCommonProps {
  filter: NestedCheckboxFilter;
}

const NestedCheckBoxFilter: React.FunctionComponent<NestedCheckBoxFilterProps> = (props) => {
  const classes = useStyles();
  const { filter, disableLabel, onChange } = props;

  const anchorEl = useRef<HTMLButtonElement | null>(null);
  const [open, setOpen] = useState(false);
  const [selectedKeys, setSelectedKeys] = useState<string[]>([]);
  const { nextFilterConfigs } = ConfigContainer.useContainer();

  const [currentParent, setCurrentParent] = useState(0);
  const options = nextFilterConfigs?.[filter.id as string]?.content ?? [];

  const secondLevel = useMemo(() => {
    if (currentParent < options.length) {
      return options[currentParent].children;
    }
    return [] as ContentItem[];
  }, [currentParent, options]);

  const handleClose = () => {
    setOpen(false);
  };

  const handleSubmit = () => {
    if (onChange)
      onChange({
        filterID: filter.id,
        values: selectedKeys,
        name: filter.name,
        operator: filter.operator,
        type: "CheckboxFilterInput",
      });

    setOpen(false);
  };

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
          {selectedKeys.length === 0 ? "请选择" : `已选择 ${selectedKeys.length}`}
          <MenuDown className={classes.menuIcon} />
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
        MenuListProps={{
          disablePadding: true,
        }}
        getContentAnchorEl={null}
      >
        <div className={classes.content}>
          <OverlayScrollbarsComponent
            className={classes.contentBox}
            options={{
              overflowBehavior: {
                y: "scroll",
                x: "hidden",
              },
              scrollbars: {
                autoHide: "l",
              },
            }}
          >
            {options.length > 0 &&
              options.map((f, i) => (
                <ListItem
                  button
                  className={clsx(classes.listItem, { [classes.listItemCheck]: currentParent === i })}
                  key={f.name + i}
                  onClick={() => setCurrentParent(i)}
                >
                  <Checkbox
                    size="small"
                    color="primary"
                    className={classes.checkbox}
                    classes={{ indeterminate: classes.indeterminate }}
                    indeterminate={
                      f.children.some((t) => selectedKeys.includes(t.value)) &&
                      !f.children.every((t) => selectedKeys.includes(t.value))
                    }
                    checked={Boolean(f.children.every((t) => selectedKeys.includes(t.value)))}
                    onChange={(_, c) => {
                      if (c) {
                        setSelectedKeys((prev) => [
                          ...prev,
                          ...f.children.filter((t) => !prev.includes(t.value)).map((t) => t.value),
                        ]);
                      } else {
                        setSelectedKeys((prev) => prev.filter((p) => !f.children.map((t) => t.value).includes(p)));
                      }
                    }}
                  />
                  <Typography
                    className={clsx(classes.listItemLabel, {
                      [classes.primary]: f.children.every((t) => selectedKeys.includes(t.value)),
                    })}
                  >
                    {f.name}
                  </Typography>
                </ListItem>
              ))}
          </OverlayScrollbarsComponent>
          <OverlayScrollbarsComponent
            className={classes.contentBox}
            options={{
              overflowBehavior: {
                y: "scroll",
                x: "hidden",
              },
              scrollbars: {
                autoHide: "l",
              },
            }}
          >
            {secondLevel.map((t) => (
              <ListItem
                button
                key={t.value}
                className={classes.listItem}
                onClick={() =>
                  setSelectedKeys((prev) => {
                    if (prev.includes(t.value)) {
                      return prev.filter((p) => p !== t.value);
                    } else {
                      return [...prev, t.value];
                    }
                  })
                }
              >
                <Checkbox
                  className={classes.checkbox}
                  size="small"
                  color="primary"
                  checked={Boolean(selectedKeys.includes(t.value))}
                />
                <Typography className={classes.listItemLabel}>{t.name}</Typography>
              </ListItem>
            ))}
          </OverlayScrollbarsComponent>
        </div>
        <div className={classes.bottom}>
          <Button variant="text" color="primary" size="medium" onClick={() => setSelectedKeys([])}>
            全部清除
          </Button>
          <div>
            <Button
              variant="text"
              onClick={handleClose}
              color="secondary"
              size="medium"
              classes={{ textSecondary: classes.buttonDefaultLabel }}
            >
              取消
            </Button>
            <Button variant="text" color="primary" size="medium" onClick={handleSubmit}>
              确认
            </Button>
          </div>
        </div>
      </Menu>
    </div>
  );
};

export default NestedCheckBoxFilter;
