import { Box, Collapse } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useEffect } from "react";
import TableContainer from "../tableContainer";

export const TABLE_SELECTION_OPERATION_BAR_HEIGHT = 40;

export const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      backgroundColor: theme.palette.primary.main,
      color: theme.palette.primary.contrastText,
      flexDirection: "row",
      alignItems: "center",
      height: TABLE_SELECTION_OPERATION_BAR_HEIGHT,
      padding: "0 16px",
      display: "flex",
      minWidth: (
        props?: Pick<TableSelectionOperationBarProps, "minWidth">,
      ): TableSelectionOperationBarProps["minWidth"] => props?.minWidth,
    },
    action: {
      paddingLeft: 16,
      paddingRight: 16,
      display: "flex",
      flexDirection: "row",
      justifyContent: "center",
      alignItems: "center",
      userSelect: "none",
      height: "100%",
    },
    actionText: {
      fontSize: 14,
      fontWeight: 500,
    },
    inlineText: {
      display: "inline-block",
    },
    tableActionIcon: {
      fontSize: 15,
      marginRight: 4,
      marginTop: 3,
    },
  }),
);

interface TableSelectionOperationBarProps {
  afterAddButtonElement?: JSX.Element;
  onClickAddButton?: () => void;
  minWidth?: number;
  // hidden  默认为 true
  hidden?: boolean;
}

const TableSelectionOperationBar: React.FunctionComponent<TableSelectionOperationBarProps> = (props) => {
  const classes = useStyles({ minWidth: props.minWidth });
  const tableContainer = TableContainer.useContainer();

  useEffect(() => {
    return (): void => {
      document.documentElement.style.overflow = "";
    };
  }, []);

  return (
    <Collapse
      in={tableContainer.selectedRows.length !== 0}
      onEnter={(): void => {
        document.documentElement.style.overflow = "hidden";
        if (!props.hidden) {
          document.documentElement.style.overflow = "";
        }
      }}
      onExited={(): void => {
        setTimeout(() => {
          document.documentElement.style.overflow = "";
        }, 300);
      }}
    >
      <Box className={classes.root}>{props.children}</Box>
    </Collapse>
  );
};

export default TableSelectionOperationBar;

export { default as DeselectAllButton } from "./components/deselect-all-button";
export { default as SelectedItemsTip } from "./components/selected-items-tip";
export { default as SeperableVerticalBar } from "./components/seperable-vertical-bar";
export { default as RemoveItemsFromCollectionButton } from "./components/remove-items-from-collection-button";
export { default as UnfollowEntitiesButton } from "./components/unfollow-entities-button";
export { default as FollowEntitiesButton } from "./components/follow-entities-button";
export { default as ExportEntitiesButton } from "./components/export-entities-button";
