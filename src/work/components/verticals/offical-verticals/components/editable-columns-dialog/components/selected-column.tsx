import { createStyles, IconButton, ListItem, ListItemProps, ListItemText, makeStyles } from "@material-ui/core";
import { CloseCircleOutline, Lock } from "mdi-material-ui";
import React, { useState } from "react";

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
  columnName: string;
  columnId: string;
  isLocked?: boolean;
  onClickDeleteButton?: (columnId: string) => void;
}

/**
 * 已选列 SelectedColumn Component
 * @param {SelectedColumnProps} props
 */
const SelectedColumn: React.FunctionComponent<SelectedColumnProps> = (props) => {
  const [isHover, setIsHover] = useState(false);
  const { columnId, columnName, isLocked, onClickDeleteButton } = props;

  const classes = useStyles();

  return (
    <ListItem
      disabled={isLocked}
      button
      onClick={(): void => {
        if (!isLocked && onClickDeleteButton) {
          onClickDeleteButton(columnId);
        }
      }}
      onMouseEnter={(): void => {
        setIsHover(true);
      }}
      onMouseLeave={(): void => {
        setIsHover(false);
      }}
    >
      <ListItemText primary={columnName} classes={{ primary: classes.listItemText }} />
      {isLocked ? (
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
