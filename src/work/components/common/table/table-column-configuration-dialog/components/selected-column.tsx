import { createStyles, IconButton, ListItem, ListItemProps, ListItemText, makeStyles } from "@material-ui/core";
import { CloseCircleOutline, Lock } from "mdi-material-ui";
import React, { useState } from "react";
import { TableColumnModel } from "../../../../../models/table/tableColumn";

const useStyles = makeStyles(() =>
  createStyles({
    iconLock: {
      fontSize: 16,
    },
    iconCancel: {
      fontSize: 18,
    },
    listItemText: {
      fontSize: 14,
      color: "#333",
    },
  }),
);

interface SelectedColumnProps extends ListItemProps {
  column: TableColumnModel;
  onClickDeleteButton?: (column: TableColumnModel) => void;
}

/**
 * 已选列 SelectedColumn Component
 * @param {SelectedColumnProps} props
 */
const SelectedColumn: React.FunctionComponent<SelectedColumnProps> = props => {
  const [isHover, setIsHover] = useState(false);
  const { column, onClickDeleteButton } = props;

  const classes = useStyles();

  return (
    <ListItem
      disabled={column.isLocked}
      button
      onClick={(): void => {
        if (!column.isLocked && onClickDeleteButton) {
          onClickDeleteButton(column);
        }
      }}
      onMouseEnter={(): void => {
        setIsHover(true);
      }}
      onMouseLeave={(): void => {
        setIsHover(false);
      }}
    >
      <ListItemText primary={column.title} classes={{ primary: classes.listItemText }} />
      {column.isLocked ? (
        <IconButton disabled={true} size="small">
          <Lock className={classes.iconLock} />
        </IconButton>
      ) : isHover ? (
        <IconButton size="small">
          <CloseCircleOutline className={classes.iconCancel} />
        </IconButton>
      ) : null}
    </ListItem>
  );
};

export default SelectedColumn;
