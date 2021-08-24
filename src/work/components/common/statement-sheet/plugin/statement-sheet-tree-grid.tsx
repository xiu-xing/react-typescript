import { createStyles, IconButton, makeStyles, Popover, Theme, Typography } from "@material-ui/core";
import _ from "lodash";
import { MinusBoxOutline, PlusBoxOutline } from "mdi-material-ui";
import toArray from "rc-util/lib/Children/toArray";
import React, { ReactNode } from "react";
import { StatementSheetHeaderConfig } from "../../../../generated/graphql";
import { GridTreeDataPlugin } from "../../grid/core/plugin";
import { GridColumn } from "../../grid/core/types";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    popover: {
      pointerEvents: "auto",
      minWidth: 140,
      maxWidth: 560,
    },
    paper: {
      padding: theme.spacing(1),
    },
    paperText: {
      fontSize: 14,
      fontFamily: "Noto Sans SC",
      color: "#333",
    },
    placeholder: {
      width: 32,
      height: 32,
    },
  }),
);

export default class StatementSheetTreeGridPlugin implements GridTreeDataPlugin {
  private _expandColumnId: string;
  private _defaultExpandedRows: Array<number | string>;
  private _headerConfig: Map<string, StatementSheetHeaderConfig>;

  constructor(
    expandColumnId: string,
    defaultExpandedRows: Array<number | string>,
    headerConfig: Map<string, StatementSheetHeaderConfig>,
  ) {
    this._expandColumnId = expandColumnId;
    this._defaultExpandedRows = defaultExpandedRows;
    this._headerConfig = headerConfig;
  }

  expandColumnId() {
    return this._expandColumnId;
  }

  defaultExpandedRows() {
    return this._defaultExpandedRows;
  }

  renderingExpandButton(visible: boolean, expanded: boolean, onToggle: () => void) {
    return (
      <IconButton
        onClick={(e) => {
          e.stopPropagation();
          onToggle();
        }}
        style={{ visibility: visible ? "visible" : "hidden", width: 32, height: 32, margin: "2px 0px" }}
      >
        {expanded ? (
          <MinusBoxOutline style={{ width: 16, height: 16 }} />
        ) : (
          <PlusBoxOutline style={{ width: 16, height: 16 }} />
        )}
      </IconButton>
    );
  }

  renderingTreeCell(row: unknown, column: GridColumn, children: ReactNode) {
    const classes = useStyles();
    const cellValues = _.get(row, column.name);
    const parentId = _.get(row, "parentId");
    const rowId = _.get(row, "id");
    const [anchorEl, setAnchorEl] = React.useState<HTMLElement | null>(null);
    const childrenComponents = toArray(children);
    let spliceEndIndex = childrenComponents.length - 1;

    const handlePopoverOpen = (event: React.MouseEvent<HTMLElement, MouseEvent>) => {
      setAnchorEl(event.currentTarget);
    };

    const handlePopoverClose = () => {
      setAnchorEl(null);
    };

    if (!this._headerConfig.get(rowId)?.foldable) {
      spliceEndIndex = childrenComponents.length - 2;
    }

    return (
      <>
        {childrenComponents.splice(0, spliceEndIndex)}
        {!this._headerConfig.get(rowId)?.foldable ? <div className={classes.placeholder} /> : null}
        <Typography
          onMouseEnter={handlePopoverOpen}
          onMouseLeave={handlePopoverClose}
          style={{
            marginLeft: 4,
            fontSize: 14,
            color: parentId ? "#666" : "#333",
            overflow: "hidden",
            textOverflow: "ellipsis",
            fontWeight: this._headerConfig.get(rowId)?.isBold ? 500 : 400,
            fontFamily: "Noto Sans SC",
          }}
        >
          {cellValues}
        </Typography>
        {this._headerConfig.has(rowId) && this._headerConfig.get(rowId)?.description && (
          <Popover
            id="row-description-popover"
            className={classes.popover}
            classes={{
              paper: classes.paper,
            }}
            open={Boolean(anchorEl)}
            anchorEl={anchorEl}
            anchorOrigin={{
              vertical: "top",
              horizontal: "center",
            }}
            transformOrigin={{
              vertical: "bottom",
              horizontal: "center",
            }}
            onClose={handlePopoverClose}
            disableRestoreFocus
          >
            <Typography className={classes.paperText}>{this._headerConfig.get(rowId)?.description}</Typography>
          </Popover>
        )}
      </>
    );
  }
}
