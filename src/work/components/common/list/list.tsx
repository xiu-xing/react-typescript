import MuiList, { ListProps as MuiListProps } from "@material-ui/core/List";
import React, { ReactNode } from "react";
import Cell from "./components/cell";
import ListHeader from "./components/list-header";
import RowSection from "./components/row-section";
import ListItem from "./components/list-item";

interface ListProps extends MuiListProps {
  showDivider?: boolean;
  listItems: ListItem[];
  columnWidths?: ColumnWidths;
  // Default: 0
  dividerInsetLeft?: number;
  // Default: 0
  dividerInsetRight?: number;
  highlightRows?: Set<number>;
  // Default: false
  listItemClickRipple?: boolean
}

export type ListItem = ListSectionHeader | ListHeader | ListBodyItem;

export enum RowType {
  header,
  section,
  bodyRow,
}

export interface ListSectionHeader {
  type: RowType.section;
  child: ReactNode;
  id: string | number;
}

export interface ListHeader {
  type: RowType.header;
  children: ReactNode[];
  id: string | number;
}

export interface ListBodyItem {
  type: RowType.bodyRow;
  children: ReactNode[];
  id: string | number;
  onClick?(index: number): void;
}

interface ListItemProps {
  showDivider: boolean
  key: React.ReactText
  highlight: boolean
  onClick?(): void
  dividerInsetLeft?: number
  dividerInsetRight?: number
  ripple: boolean
  children: ReactNode,
}

interface ColumnWidthsItem {
  grow?: number;
  basisWidth?: number;
}

export type ColumnWidths = Array<ColumnWidthsItem | undefined | null>;

export const EXTRA_HORIZONTAL_PADDING = 28;

const List: React.FC<ListProps> = (props) => {
  const {
    showDivider = false,
    dividerInsetLeft = 0,
    dividerInsetRight = 0,
    listItems: listData,
    columnWidths = [],
    highlightRows,
    listItemClickRipple = false,
    ...leftProps
  } = props;

  const generateCells = (item: ListHeader | ListBodyItem): ReactNode =>
    item.children.map((child, columnIndex) => (
      <Cell key={`${item.id}-${columnIndex}`} columnIndex={columnIndex} columnWidths={columnWidths}>
        {child}
      </Cell>
    ));
  const renderComponent = (preItem?: ListItem) => (item: ListItem, index: number): ReactNode => {
    const preItemTemp = preItem;
    preItem = item;
    switch (item.type) {
      case RowType.header:
        return <ListHeader key={item.id}>{generateCells(item)}</ListHeader>;
      case RowType.section:
        return <RowSection key={item.id}>{item.child}</RowSection>;
      case RowType.bodyRow: {

        const listItemProps: ListItemProps = {
          showDivider: false,
          key: item.id,
          onClick() {
            item.onClick?.(index)
          },
          highlight: highlightRows?.has(index) ?? false,
          ripple: listItemClickRipple,
          children: generateCells(item),
        }

        if (showDivider && preItemTemp?.type === RowType.bodyRow) {
          listItemProps.showDivider = true
          listItemProps.dividerInsetLeft = dividerInsetLeft
          listItemProps.dividerInsetRight = dividerInsetRight
        }

        return (
          <ListItem {...listItemProps} />
        );
      }
      default:
        return null;
    }
  };
  return <MuiList {...leftProps}>{listData.map(renderComponent())}</MuiList>;
};

export default List;
