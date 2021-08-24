import {
  Box,
  Button,
  ButtonBase,
  Checkbox,
  createStyles,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControlLabel,
  InputBase,
  makeStyles,
  Theme,
  Typography,
} from "@material-ui/core";
import clsx from "clsx";
import _ from "lodash";
import { Magnify, Refresh } from "mdi-material-ui";
import React, { useCallback, useEffect, useState } from "react";
import { OrderColumn } from "../../../../generated/graphql";
import { GridColumn } from "../../grid/core/types";
import { CommonGridConfig } from "../grid/types";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    EditColumnsButtonRoot: {
      whiteSpace: "nowrap",
    },
    dialogTitle: {
      padding: "16px 24px",
      borderBottom: "1px solid #EEE",
      "& h2": {
        display: "flex",
        alignItems: "center",
        justifyContent: "space-between",
      },
    },
    dialogTitleText: {
      fontSize: 16,
      fontWeight: 500,
      color: "#333",
    },
    searchInputBox: {
      display: "flex",
      alignItems: "center",
      borderRadius: 4,
      border: "1px solid #EEEEEE",
      color: "#999",
      paddingLeft: 4,
      fontSize: 16,
    },
    dialogRoot: {
      "& .MuiDialog-paperWidthSm": {
        width: 1000,
        minWidth: 800,
        maxWidth: "unset",
        margin: 0,
      },
      "& .MuiDialogContent-root": {
        height: 500,
        transition: "height 200ms ease-out",
      },
    },
    dialogContent: {
      width: "100%",
    },
    groupName: {
      fontSize: 14,
      color: "#666",
      padding: "10px 0",
    },
    columnName: {
      fontSize: 14,
      color: "#333",
    },
    columnCheckBox: {
      display: "flex",
      flexWrap: "wrap",
    },
    formControlLabel: {
      margin: 0,
      marginLeft: -2,
      padding: "8px 0",
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
      },
    },
    disableColor: {
      color: "#999 !important",
    },
    dialogActions: {
      borderTop: "1px solid #EEE",
      justifyContent: "space-between",
      padding: "10px 24px",
    },
    cancelButton: {
      color: "#666",
    },
    refreshButton: {
      color: theme.palette.primary.main,
      transition: "all 200ms ease-out",
    },
    refreshButtonDisable: {
      color: "#666",
    },
    defalutText: {
      display: "flex",
      fontSize: 14,
      color: "#333",
    },
    heightLightText: {
      fontSize: 14,
      color: theme.palette.primary.main,
      fontFamily: " NotoSansSC-Regular, NotoSansSC",
      fontWeight: 400,
    },
    boxStyle: {
      width: "20%",
    },
    checkBox: {
      width: "fit-content",
      marginRight: 32,
    },
  }),
);

interface CommonGridColumnsEditorProps {
  gridConfig: CommonGridConfig;
  columns: GridColumn[];
  setColumns: React.Dispatch<React.SetStateAction<GridColumn[]>>;
  paginationEditorOpen: boolean;
  setPaginationEditorOpen: React.Dispatch<React.SetStateAction<boolean>>;
  sortColumns: OrderColumn[];
  setSortColumns: React.Dispatch<React.SetStateAction<OrderColumn[]>>;
}

const CommonGridColumnsEditor: React.FunctionComponent<CommonGridColumnsEditorProps> = (props) => {
  const classes = useStyles();
  const {
    gridConfig,
    columns,
    setColumns,
    paginationEditorOpen,
    setPaginationEditorOpen,
    sortColumns,
    setSortColumns,
  } = props;

  const [checkColumns, setCheckColumns] = useState<string[]>([]);
  const [requireList, setRequireList] = useState<string[]>([]);
  const [allColumnsList, setAllColumnsList] = useState<string[]>([]);

  const [defaultColumnsList, setDefaultColumnsList] = useState<string[]>([]);

  const [keyValue, setKeyValue] = useState("");

  const getDisabled = useCallback(() => {
    if (!(checkColumns.length === defaultColumnsList.length)) return false;

    if (_.difference(checkColumns, defaultColumnsList).length === 0) return true;

    return false;
  }, [checkColumns, defaultColumnsList]);

  const onApply = () => {
    setKeyValue("");
    setPaginationEditorOpen(false);

    const newColumns: GridColumn[] = [];

    checkColumns.forEach((id) => {
      newColumns.push(gridConfig.columns[id]);
    });

    const newColumnIDs = newColumns.map((item) => item.name);
    const newSortColumns = sortColumns.filter((sortColumn) => newColumnIDs.includes(sortColumn.columnId));
    if (!_.isEqual(newSortColumns, sortColumns)) setSortColumns(newSortColumns);

    const newDeletedColumns = _.difference(
      newColumnIDs,
      columns.map((column) => column.name),
    );
    newDeletedColumns.forEach((id) => {
      gridConfig.columns[id].isFixed = false;
      gridConfig.columns[id].sortType = "none";
      gridConfig.columns[id].showChart = false;
    });

    setColumns(newColumns);
  };

  const onSelectAllChange = () => {
    if (allColumnsList.every((id) => checkColumns.includes(id))) return setCheckColumns(requireList);

    const newCheckColumns = Array.from(allColumnsList);
    newCheckColumns.push(..._.difference(requireList, allColumnsList));

    setCheckColumns(newCheckColumns);
  };

  useEffect(() => {
    setCheckColumns(columns.map((item) => item.name));
  }, [columns]);

  useEffect(() => {
    if (gridConfig) {
      const requireList: string[] = [];
      const allColumnsList: string[] = [];

      Object.entries(gridConfig.columns).forEach(([id, value]) => {
        value.isRequired && requireList.push(id);
      });

      gridConfig.columnEditLayout.forEach((editLayoutItem) => {
        editLayoutItem.columnIds.forEach((id) => allColumnsList.push(id));
      });

      setCheckColumns(gridConfig.defaultColumns);
      setDefaultColumnsList(gridConfig.defaultColumns);
      setAllColumnsList(allColumnsList);
      setRequireList(requireList);
    }
  }, [gridConfig]);

  const checkBoxItem = (id: string, hidden = false) => {
    return (
      <Box key={id} className={classes.boxStyle} hidden={hidden}>
        <FormControlLabel
          className={classes.formControlLabel}
          control={<Checkbox color="primary" />}
          disabled={requireList.includes(id)}
          value={id}
          checked={requireList.includes(id) || checkColumns.includes(id)}
          label={_.get(gridConfig?.columns[id], "title", "")}
          onChange={(e, checked: boolean) => {
            if (checked) {
              setCheckColumns([...checkColumns, id]);
            }
            if (!checked) {
              setCheckColumns([...checkColumns.filter((p) => p !== id)]);
            }
          }}
        />
      </Box>
    );
  };

  const optionsDisplay = () => {
    if (keyValue)
      return gridConfig?.columnEditLayout.map((layoutListItem) => (
        <div className={classes.columnCheckBox} key={layoutListItem.groupId}>
          {layoutListItem.columnIds.map((id) => {
            const title = gridConfig.columns[id].title;
            const reg = new RegExp("[" + keyValue + "]", "g");
            const hidden = title ? title.search(reg) === -1 : true;

            return checkBoxItem(id, hidden);
          })}
        </div>
      ));

    return gridConfig?.columnEditLayout.map((layoutListItem) => (
      <div key={layoutListItem.groupId}>
        <Typography className={classes.groupName}>{layoutListItem.groupName}</Typography>
        <div className={classes.columnCheckBox}>{layoutListItem.columnIds.map((id) => checkBoxItem(id))}</div>
      </div>
    ));
  };

  return (
    <Dialog open={paginationEditorOpen} className={classes.dialogRoot}>
      <DialogTitle className={classes.dialogTitle}>
        <Typography className={classes.dialogTitleText}>编辑列</Typography>
        <div className={classes.searchInputBox}>
          <Magnify />
          <InputBase
            placeholder="搜索关键字"
            onChange={(e) => setKeyValue(e.target.value)}
            style={{ paddingLeft: 4 }}
          />
        </div>
      </DialogTitle>
      <DialogContent className={classes.dialogContent}>{optionsDisplay()}</DialogContent>
      <DialogActions className={classes.dialogActions}>
        <div style={{ display: "flex", flex: 1 }}>
          <Box className={clsx(classes.checkBox, !keyValue && classes.disableColor)}>
            <FormControlLabel
              disabled={keyValue ? true : false}
              className={classes.formControlLabel}
              control={<Checkbox color="primary" />}
              checked={allColumnsList.every((id) => checkColumns.includes(id))}
              label={<Typography style={{ color: "#666", fontSize: 14 }}>全选</Typography>}
              onChange={onSelectAllChange}
            />
          </Box>
          <ButtonBase
            className={clsx(classes.refreshButton, getDisabled() && classes.refreshButtonDisable)}
            disabled={getDisabled()}
            onClick={() => setCheckColumns(defaultColumnsList)}
          >
            <Refresh style={{ fontSize: 20 }} />
            <Typography style={{ fontSize: 14, paddingLeft: 4 }}>恢复默认</Typography>
          </ButtonBase>
        </div>
        <div>
          <Button
            variant="text"
            className={classes.cancelButton}
            onClick={() => {
              setCheckColumns(columns.map((item) => item.name));
              setKeyValue("");
              setPaginationEditorOpen(false);
            }}
          >
            取消
          </Button>
          <Button variant="text" color="primary" onClick={onApply}>
            应用
          </Button>
        </div>
      </DialogActions>
    </Dialog>
  );
};

export default CommonGridColumnsEditor;
