import { Checkbox, List, ListItem, makeStyles } from "@material-ui/core";
import React, { FunctionComponent } from "react";
import { TagModel } from "../../../../../../models/risk/tagsConfigModel";
import EventTypeFilterContainer from "../eventTypeFilterContainer";

const useStyles = makeStyles({
  commonListStyles: {
    width: 300,
    height: 360,
    padding: 0,
    overflow: "auto",
    borderRight: "1px solid #EEE",
    color: "#333333",
  },
  listItem: {
    height: 40,
    display: "flex",
    justifyContent: "space-between",
  },
});

interface SecondLevelListItemProps {
  tag: TagModel;
}

const SecondLevelListItem: FunctionComponent<SecondLevelListItemProps> = ({ tag }) => {
  const classes = useStyles();
  const {
    tagsConfig,
    selectedTagParentIds,
    setSelectedTagParentIds,
    selectedTagIds,
    setSelectedTagIds,
  } = EventTypeFilterContainer.useContainer();
  // 是否是 全部 的选项
  const isParent = !tag.parentId;
  // 是否选中
  const checked = isParent
    ? selectedTagParentIds.indexOf(tag.id) != -1
    : selectedTagParentIds.indexOf(tag.parentId) !== -1 || selectedTagIds.indexOf(tag.id) != -1;

  // 处理点击事件
  const clickHandler = (): void => {
    // 从选中到未选中
    if (checked) {
      if (isParent) {
        setSelectedTagParentIds((oldValue) => {
          const newValue = Array.from(oldValue);
          const findIndex = newValue.indexOf(tag.id);
          newValue.splice(findIndex, 1);
          return newValue;
        });
        setSelectedTagIds((oldValue) => {
          const newValue = Array.from(oldValue);
          const children = tagsConfig.tagParents.get(tag.id)?.children;
          children?.forEach((value) => {
            const findIndex = newValue.indexOf(value);
            findIndex != -1 && newValue.splice(findIndex, 1);
          });
          return newValue;
        });
        return;
      }

      setSelectedTagParentIds((oldValue) => {
        const newValue = Array.from(oldValue);
        const findIndex = newValue.indexOf(tag.parentId);
        newValue.splice(findIndex, 1);
        return newValue;
      });
      setSelectedTagIds((oldValue) => {
        const newValue = Array.from(oldValue);
        const findIndex = newValue.indexOf(tag.id);
        newValue.splice(findIndex, 1);
        return newValue;
      });
      return;
    }

    // 从未选中到选中
    if (isParent) {
      setSelectedTagParentIds((oldValue) => {
        const newValue = Array.from(oldValue);
        newValue.push(tag.id);
        return newValue;
      });
      setSelectedTagIds((oldValue) => {
        const newValue = Array.from(oldValue);
        const children = tagsConfig.tagParents.get(tag.id)?.children;
        children?.forEach((value) => {
          const findIndex = newValue.indexOf(value);
          findIndex == -1 && newValue.push(value);
        });
        return newValue;
      });
      return;
    }

    // 子项

    setSelectedTagIds((oldValue) => {
      const newValue = Array.from(oldValue);
      const findIndex = newValue.indexOf(tag.id);
      findIndex == -1 && newValue.push(tag.id);
      return newValue;
    });

    // 修改父节点状态
    const children = tagsConfig.tagParents.get(tag.parentId)?.children;
    const findIndex = children?.findIndex((value) => selectedTagIds.indexOf(value) == -1 && value !== tag.id);
    if (findIndex == -1) {
      setSelectedTagParentIds((oldValue) => {
        const newValue = Array.from(oldValue);
        newValue.push(tag.parentId);
        return newValue;
      });
    }
  };

  return (
    <ListItem key={tag.id} button onClick={clickHandler} className={classes.listItem}>
      <span>
        <Checkbox size="small" checked={checked} disableRipple={false} indeterminate={false} color="primary" />
        {tag.name}
      </span>
    </ListItem>
  );
};

const SecondLevelList: FunctionComponent = () => {
  const classes = useStyles();
  const { tagsConfig, activeTagParentId } = EventTypeFilterContainer.useContainer();
  const tagIds = tagsConfig.tagParents.get(activeTagParentId)?.children;

  return tagIds ? (
    <List className={classes.commonListStyles}>
      <SecondLevelListItem key={activeTagParentId} tag={{ name: "全部", id: activeTagParentId, parentId: "" }} />
      {tagIds.map((tagId) => {
        const tag = tagsConfig.tags.get(tagId);
        return tag ? <SecondLevelListItem key={tag.id} tag={tag} /> : null;
      })}
    </List>
  ) : null;
};

export default SecondLevelList;
