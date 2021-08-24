import { List, ListItem, makeStyles } from "@material-ui/core";
import CloseCircleOutline from "mdi-material-ui/CloseCircleOutline";
import React, { FunctionComponent } from "react";
import { TagModel } from "../../../../../../models/risk/tagsConfigModel";
import EventTypeFilterContainer from "../eventTypeFilterContainer";

const useStyles = makeStyles({
  commonListStyles: {
    width: 300,
    height: 360,
    padding: 0,
    color: "#333333",
    overflow: "auto",
  },
  listItem: {
    height: 40,
    display: "flex",
    justifyContent: "space-between",
  },
  closeIcon: {
    fontSize: 16,
    color: "rgba(0, 0, 0, 0.54)",
  },
});

const SelectedItemList: FunctionComponent = () => {
  const classes = useStyles();
  const {
    tagsConfig,
    selectedTagParentIds,
    setSelectedTagParentIds,
    selectedTagIds,
    setSelectedTagIds,
  } = EventTypeFilterContainer.useContainer();

  function clickHandler(tag: TagModel, index: number): void {
    setSelectedTagIds((oldValue) => {
      const newValue = Array.from(oldValue);
      newValue.splice(index, 1);
      return newValue;
    });
    if (selectedTagParentIds.indexOf(tag.parentId) != -1) {
      setSelectedTagParentIds((oldValue) => {
        const newValue = Array.from(oldValue);
        const findIndex = newValue.indexOf(tag.parentId);
        newValue.splice(findIndex, 1);
        return newValue;
      });
    }
  }

  return (
    <List className={classes.commonListStyles}>
      {selectedTagIds.map((tagId, index) => {
        const item = tagsConfig.tags.get(tagId);
        return item ? (
          <ListItem
            key={item.id}
            button
            onClick={(): void => {
              clickHandler(item, index);
            }}
            className={classes.listItem}
          >
            <span>{item.name}</span>
            <CloseCircleOutline className={classes.closeIcon} />
          </ListItem>
        ) : null;
      })}
    </List>
  );
};

export default SelectedItemList;
