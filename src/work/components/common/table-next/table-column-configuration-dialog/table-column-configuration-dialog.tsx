import { Box, Button, IconButton, List, ListItem, ListItemText, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import { useClient } from "@momentum-valley/muse-js";
import clsx from "clsx";
import { CheckboxBlankOutline, CheckboxMarked, ChevronRight, Lock } from "mdi-material-ui";
import React, { ReactNode, useEffect, useRef, useState } from "react";
import ConfigContainer from "../../../../containers/configContainer";
import UserContainer from "../../../../containers/userContainer";
import { Role } from "../../../../generated/graphql";
import { EditableColumn } from "../../../../models/table/editableColumn";
import { EditableColumnGroup } from "../../../../models/table/editableColumnGroup";
import { TableColumnNextModel } from "../../../../models/table/tableColumnNext";
import { combineStashes, useStash } from "../../../../utils/hooks";
import Dialog from "../../dialog/dialog";
import TableContainer from "../tableContainer";
import SelectedColumn from "./components/selected-column";

const useStyles = makeStyles(() =>
  createStyles({
    content: {
      width: "100%",
      height: "100%",
      display: "flex",
    },
    list: {
      minWidth: 300,
      overflow: "auto",
      padding: 0,
    },
    columnList: {
      borderRight: "solid 2px rgba(0, 0, 0, 0.11)",
      padding: 0,
    },
    firstColumnListItem: {
      paddingLeft: 24,
    },
    selectedColumnList: {
      height: "100%",
    },
    proIcon: {
      height: 21,
      width: 21,
      marginLeft: 4,
      marginRight: 12,
    },
    iconSize: {
      fontSize: 16,
    },
    iconChevronRight: {
      color: "rgba(0, 0, 0, 0.6)",
    },
    dialogTitle: {
      fontSize: 16,
      color: "#737373",
      fontWeight: 500,
    },
    listItemText: {
      fontSize: 14,
    },
    boxGroup: {
      height: 40,
      display: "flex",
      alignItems: "center",
    },
    cancelButton: {
      color: "#666",
    },
    rimeActiveIcon: {
      marginRight: "5px",
    },
    svgRime: {
      height: "24px",
      width: "24px",
      color: "#CCC",
    },
  }),
);

/**
 * TableColumnConfigurationDialog 可选列编辑框
 * @param props
 */
const TableColumnConfigurationDialog: React.FunctionComponent = () => {
  const { accessControlConfigs } = ConfigContainer.useContainer();

  const classes = useStyles();
  const {
    // 配置，从中取已选列、列配置
    updateColumns,
    tableConfig,
    columnConfigurationDialogOpen,
    setColumnConfigurationDialogOpen,
  } = TableContainer.useContainer();

  const { user, setTrailServiceDialogOpen, setInstitutionAuthenticationDialog, setActiveServiceDialogOpen } =
    UserContainer.useContainer();

  const muse = useClient();
  // 已选的列
  const [selectedColumns, setSelectedColumns] = useState<TableColumnNextModel[]>([]);
  // 可选的列选项
  const [editableColumnGroups, setEditableColumnGroups] = useState<Array<EditableColumnGroup>>([]);
  // 一级选项选中的下标
  const [activeColumnGroupIndex, setActiveColumnGroupIndex] = useState<number>(0);
  // subColumns
  const [editableColumns, setEditableColumns] = useState<EditableColumn[]>([]);

  const [stashTableColumnConfigurationDialogState, applyTableColumnConfigurationDialogStash] = combineStashes(
    useStash([selectedColumns, setSelectedColumns]),
    useStash([editableColumnGroups, setEditableColumnGroups]),
    useStash([activeColumnGroupIndex, setActiveColumnGroupIndex]),
    useStash([editableColumns, setEditableColumns]),
  );

  const clearRef = useRef<null | Function>(null);

  useEffect(() => {
    if (columnConfigurationDialogOpen) {
      clearRef.current = null;
      stashTableColumnConfigurationDialogState();
    } else {
      setTimeout(() => clearRef.current?.(), 0);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [columnConfigurationDialogOpen]);

  useEffect(() => {
    if (tableConfig && tableConfig.columnEditLayout) {
      setEditableColumnGroups(tableConfig.columnEditLayout.subGroup);
      if (tableConfig.columnEditLayout.subGroup.length) {
        setEditableColumns(tableConfig.columnEditLayout.subGroup[0].columns);
      }
      // 设置默认列为已选列
      setSelectedColumns(tableConfig.defaultColumns);
    }
  }, [tableConfig]);

  // Operations 选中一级
  function selectColumn(index: number): void {
    setActiveColumnGroupIndex(index);
  }

  useEffect(() => {
    setEditableColumns(() => editableColumnGroups[activeColumnGroupIndex]?.columns ?? []);
  }, [activeColumnGroupIndex, editableColumnGroups]);

  useEffect(() => {
    if (columnConfigurationDialogOpen) {
      setActiveColumnGroupIndex(0);
    }
  }, [columnConfigurationDialogOpen]);

  // checkbox checked
  function addColumn(column: TableColumnNextModel): void {
    setSelectedColumns((oldValue) => {
      const newValue = Array.from(oldValue);
      const findIndex = selectedColumns.findIndex((selectedColumn) => selectedColumn.name === column.name);
      if (findIndex === -1) {
        newValue.push(column);
      }
      return newValue;
    });
  }

  // checkbox unchecked
  function deleteColumn(columnId: string): void {
    setSelectedColumns((oldValue) => {
      const newValue = Array.from(oldValue);
      const findIndex = selectedColumns.findIndex((selectedColumn) => selectedColumn.name === columnId);
      if (findIndex !== -1) {
        newValue.splice(findIndex, 1);
      }
      return newValue;
    });
  }

  function isSelected(columnId: string): boolean {
    const findIndex = selectedColumns.findIndex((selectedColumn) => selectedColumn.name === columnId);
    if (findIndex === -1) {
      return false;
    }
    return true;
  }

  // 一级列渲染
  function activeColumnsLists(): ReactNode {
    return (
      <List className={clsx(classes.list, classes.columnList)}>
        {editableColumnGroups.map((activeColumn, index) => {
          return activeColumn ? (
            <ListItem
              key={index}
              button
              selected={activeColumnGroupIndex === index}
              onClick={(): void => {
                selectColumn(index);
              }}
              className={classes.firstColumnListItem}
            >
              <ListItemText primary={activeColumn.groupName} classes={{ primary: classes.listItemText }} />
              <ChevronRight className={clsx(classes.iconSize, classes.iconChevronRight)} />
            </ListItem>
          ) : null;
        })}
      </List>
    );
  }

  // 子项列表（checkbox）渲染
  function activeSubColumnsLists(): ReactNode {
    return (
      <List className={clsx(classes.list, classes.columnList)}>
        {editableColumns.map((editableColumn, index: number) => {
          if (!editableColumn.columnId || !tableConfig) {
            return null;
          }
          const column = tableConfig.columns[editableColumn.columnId];
          if (!column) {
            return null;
          }
          const isLocked = column.isLocked;
          const selected = isSelected(editableColumn.columnId);
          let disabledColum = false;

          if (user && user.role && accessControlConfigs) {
            const disable = accessControlConfigs[editableColumn.columnId + ".disable"];
            if (disable && disable[user.role] === true) {
              disabledColum = true;
            }
          }

          return (
            <ListItem
              key={index}
              disabled={isLocked}
              button
              onClick={(): void => {
                if (disabledColum) {
                  if (user?.role == Role.IndividualFree || user?.role == Role.IndividualPremium) {
                    setInstitutionAuthenticationDialog(true);
                  }
                  if (user?.role == Role.Basic) {
                    setTrailServiceDialogOpen(true);
                  }
                  if (user?.role == Role.Expired) {
                    setActiveServiceDialogOpen(true);
                  }
                  return;
                }
                if (selected) {
                  deleteColumn(editableColumn.columnId);
                } else {
                  addColumn(column);
                }
              }}
            >
              {disabledColum ? (
                <Lock className={classes.svgRime} />
              ) : (
                <IconButton size="small" style={{ marginRight: 8 }} disabled={isLocked}>
                  {isLocked ? (
                    <CheckboxMarked style={{ color: "#ccc" }} className={clsx(classes.iconSize)} />
                  ) : selected ? (
                    <CheckboxMarked color="primary" className={clsx(classes.iconSize)} />
                  ) : (
                    <CheckboxBlankOutline className={clsx(classes.iconSize)} />
                  )}
                </IconButton>
              )}
              <ListItemText primary={column.title} classes={{ primary: classes.listItemText }} />
            </ListItem>
          );
        })}
      </List>
    );
  }

  // 已选列 Item 渲染
  function selectedColumnListItem(key: number, column: TableColumnNextModel): ReactNode {
    return (
      <SelectedColumn
        key={key}
        column={column}
        onClickDeleteButton={(column: TableColumnNextModel): void => {
          deleteColumn(column.name);
        }}
      />
    );
  }

  // 已选列最外层 List
  function selectedColumnList(): ReactNode {
    return <List>{selectedColumns.map((selectedColumn, index) => selectedColumnListItem(index, selectedColumn))}</List>;
  }

  return (
    <Dialog
      fullWidth={true}
      dialogTitle={<Typography className={classes.dialogTitle}>编辑列</Typography>}
      width={900}
      minWidth={900}
      height={500}
      actions={
        <Box className={classes.boxGroup}>
          <Button
            className={classes.cancelButton}
            onClick={(): void => {
              setColumnConfigurationDialogOpen(false);
              clearRef.current = applyTableColumnConfigurationDialogStash;
            }}
          >
            取消
          </Button>
          <Button
            color="primary"
            onClick={(): void => {
              muse.sendTrackingEvent("advance_search.column_edit", {
                columns: selectedColumns.map((c) => {
                  return {
                    id: c.name,
                    name: c.title,
                  };
                }),
              });
              updateColumns([...selectedColumns]);
              setColumnConfigurationDialogOpen(false);
            }}
          >
            保存
          </Button>
        </Box>
      }
      open={columnConfigurationDialogOpen}
      onClickCloseButton={(): void => setColumnConfigurationDialogOpen(false)}
      onClose={(): void => setColumnConfigurationDialogOpen(false)}
    >
      <Box className={classes.content}>
        {activeColumnsLists()}
        {activeSubColumnsLists()}
        <Box className={clsx(classes.list, classes.selectedColumnList)}>{selectedColumnList()}</Box>
      </Box>
    </Dialog>
  );
};

export default TableColumnConfigurationDialog;
