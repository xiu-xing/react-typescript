import { Box, Button, IconButton, List, ListItem, ListItemText, Typography } from "@material-ui/core";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import { CheckboxBlankOutline, CheckboxMarked } from "mdi-material-ui";
import React, { ReactNode, useEffect, useState } from "react";
import Dialog from "../../../../common/dialog/dialog";
import SnackbarContainer from "../../../../common/snackbar/snackbarContainer";
import { config } from "../../config";
import VerticalContainer from "../../verticalContainer";
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
    bottomContainer: {
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      flex: 1,
    },
    tips: {
      color: "#333",
      fontSize: 14,
      fontWeight: 400,
    },
    boxGroup: {
      height: 40,
      display: "flex",
      alignItems: "center",
    },
    cancelButton: {
      color: "#666",
    },
  }),
);

const maxSelectedCount = 5;

const EditableColumnsDialog: React.FunctionComponent<{}> = () => {
  const classes = useStyles();

  const { openSnackbar } = SnackbarContainer.useContainer();
  const {
    user,
    editionDialogOpen: open,
    setEditionDialogOpen: setOpen,
    selectedColumnIds: selectedColumns,
    setSelectedColumnIds: updateSelectedColumnIds,
  } = VerticalContainer.useContainer();

  const [selectedColumnIds, setSelectedColumnIds] = useState<Array<string>>([]);

  function deleteColumn(columnId: string): void {
    //   TODO
    const index = selectedColumnIds.indexOf(columnId);
    if (index != -1) {
      const newSelectedColumnIds = Array.from(selectedColumnIds);
      newSelectedColumnIds.splice(index, 1);
      setSelectedColumnIds(newSelectedColumnIds);
    }
  }

  function addColumn(columnId: string): void {
    if (selectedColumnIds.length >= maxSelectedCount) {
      openSnackbar("最多可添加5列", "warning");
      return;
    }
    //   TODO
    const index = selectedColumnIds.indexOf(columnId);
    if (index == -1) {
      const newSelectedColumnIds = Array.from(selectedColumnIds);
      newSelectedColumnIds.push(columnId);
      setSelectedColumnIds(newSelectedColumnIds);
    }
  }

  function isSelected(columnId: string): boolean {
    //   TODO
    return selectedColumnIds.indexOf(columnId) != -1;
  }

  useEffect(
    () => {
      if (open) {
        setSelectedColumnIds(Array.from(selectedColumns));
      }
    },
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [open],
  );

  function checkboxListComponent(): ReactNode {
    return (
      <List className={clsx(classes.list, classes.columnList)}>
        {Object.entries(config.columns).map((entry) => {
          const columnId = entry[0];
          const column = entry[1];
          if (columnId && column) {
            const isLocked = column["isLocked"];
            const selected = isSelected(columnId);

            return (
              <ListItem
                key={columnId}
                disabled={isLocked}
                button
                onClick={(): void => {
                  if (selected) {
                    deleteColumn(columnId);
                  } else {
                    addColumn(columnId);
                  }
                }}
              >
                <IconButton size="small" style={{ marginRight: 8 }} disabled={isLocked}>
                  {isLocked ? (
                    <CheckboxMarked style={{ color: "#ccc" }} className={clsx(classes.iconSize)} />
                  ) : selected ? (
                    <CheckboxMarked color="primary" className={clsx(classes.iconSize)} />
                  ) : (
                    <CheckboxBlankOutline className={clsx(classes.iconSize)} />
                  )}
                </IconButton>

                <ListItemText primary={column.name} classes={{ primary: classes.listItemText }} />
              </ListItem>
            );
          } else {
            return null;
          }
        })}
      </List>
    );
  }

  function selectedColumnList(): ReactNode {
    return selectedColumnIds.map((columnId: string, index: number) => {
      const column = config.columns[columnId];
      if (column) {
        return (
          <SelectedColumn
            key={index}
            columnName={column["name"]}
            columnId={columnId}
            isLocked={column["isLocked"]}
            onClickDeleteButton={deleteColumn}
          />
        );
      }
    });
  }

  return (
    <Dialog
      disableScrollLock={false}
      fullWidth={true}
      dialogTitle={<Typography className={classes.dialogTitle}>编辑列</Typography>}
      width={600}
      minWidth={600}
      height={500}
      open={open}
      onClickCloseButton={(): void => setOpen(false)}
      onClose={(): void => setOpen(false)}
      actions={
        <Box className={classes.bottomContainer}>
          <Typography className={classes.tips}>* 最多展示 5 列</Typography>
          <Box className={classes.boxGroup}>
            <Button
              className={classes.cancelButton}
              onClick={(): void => {
                setOpen(false);
              }}
            >
              取消
            </Button>
            <Button
              color="primary"
              onClick={(): void => {
                const columnIdsCopy = Array.from(selectedColumnIds);

                updateSelectedColumnIds(columnIdsCopy);
                setOpen(false);
              }}
            >
              保存
            </Button>
          </Box>
        </Box>
      }
    >
      <Box className={classes.content}>
        {checkboxListComponent()}
        <Box className={clsx(classes.list, classes.selectedColumnList)}>{selectedColumnList()}</Box>
      </Box>
    </Dialog>
  );
};

export default EditableColumnsDialog;
