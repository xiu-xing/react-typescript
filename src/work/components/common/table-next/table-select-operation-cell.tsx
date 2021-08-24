import { TableSelection } from "@devexpress/dx-react-grid-material-ui";
import { Divider, IconButton, Menu, MenuItem, TableCell } from "@material-ui/core";
import { createStyles, makeStyles, Theme, withStyles } from "@material-ui/core/styles";
import {
  ChevronDownBoxOutline,
  MinusBoxMultipleOutline,
  MinusBoxOutline,
  PlusBoxMultipleOutline,
  PlusBoxOutline,
} from "mdi-material-ui";
import React, { useState } from "react";
import TableContainer, { TableSelectionOperationCellText } from "./tableContainer";

const TableSelectOperationCellStyles = createStyles({
  root: {
    display: "table-cell",
    backgroundColor: "#fff",
    borderBottomColor: "#eee",
    textAlign: "center",
    padding: 0,
  },
});

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    menuIcon: {
      marginRight: theme.spacing(1),
    },
    menu: {},
  }),
);

const defaultSelectionOperationText: TableSelectionOperationCellText = {
  selectPageText: "选择页面结果",
  selectAllText: "选择所有结果",
  deselectPageText: "取消选择页面结果",
  deselectAllText: "取消选择所有结果",
};

const TableSelectOperationCellContent: React.FunctionComponent<TableSelection.HeaderCellProps> = (props) => {
  const classes = useStyles();
  const { tableSelectionOperationCellText, ...tableContainer } = TableContainer.useContainer();
  const [selectionOperationButton, setSelectionOperationButton] = useState<null | HTMLElement>(null);
  const { tableRow, tableColumn, allSelected, someSelected, ...leftProps } = props;

  return (
    <TableCell {...leftProps}>
      <IconButton size="small" onClick={(event): void => setSelectionOperationButton(event.currentTarget)}>
        <ChevronDownBoxOutline />
      </IconButton>
      <Menu
        className={classes.menu}
        anchorEl={selectionOperationButton}
        keepMounted
        open={Boolean(selectionOperationButton)}
        onClose={(): void => setSelectionOperationButton(null)}
        transformOrigin={{
          vertical: -40,
          horizontal: 55,
        }}
      >
        <MenuItem
          onClick={(): void => {
            setSelectionOperationButton(null);
            tableContainer.selectPage();
          }}
        >
          <PlusBoxOutline className={classes.menuIcon} />
          {tableSelectionOperationCellText.selectPageText || defaultSelectionOperationText.selectPageText}
        </MenuItem>
        <MenuItem
          onClick={(): void => {
            setSelectionOperationButton(null);
            tableContainer.selectAll();
          }}
        >
          <PlusBoxMultipleOutline className={classes.menuIcon} />
          {tableSelectionOperationCellText.selectAllText || defaultSelectionOperationText.selectAllText}
        </MenuItem>
        <Divider />
        <MenuItem
          onClick={(): void => {
            setSelectionOperationButton(null);
            tableContainer.deselectPage();
          }}
        >
          <MinusBoxOutline className={classes.menuIcon} />
          {tableSelectionOperationCellText.deselectPageText || defaultSelectionOperationText.deselectPageText}
        </MenuItem>
        <MenuItem
          onClick={(): void => {
            setSelectionOperationButton(null);
            tableContainer.deselectAll();
          }}
        >
          <MinusBoxMultipleOutline className={classes.menuIcon} />
          {tableSelectionOperationCellText.deselectAllText || defaultSelectionOperationText.deselectAllText}
        </MenuItem>
      </Menu>
    </TableCell>
  );
};

export default withStyles(TableSelectOperationCellStyles)((props: TableSelection.HeaderCellProps) => {
  return (
    // <TableSelection.HeaderCell {...props}>
    <TableSelectOperationCellContent {...props} />
    // </TableSelection.HeaderCell>
  );
});
