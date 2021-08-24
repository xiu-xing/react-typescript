import { List, ListItem, makeStyles } from "@material-ui/core";
import ChevronRight from "mdi-material-ui/ChevronRight";
import React, { FunctionComponent } from "react";
import { TagParentModel } from "../../../../../../models/risk/tagsConfigModel";
import RiskManagementContainer from "../../../../riskManagementContainer";
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
  listItemIcon: {
    color: "rgba(0, 0, 0, 0.54)",
  },
});

interface FirstLevelListItemProps {
  firstLevelItem: TagParentModel;
  onSelected: () => void;
  selected: boolean;
}

const FirstLevelListItem: FunctionComponent<FirstLevelListItemProps> = ({ firstLevelItem, onSelected, selected }) => {
  const classes = useStyles();

  return (
    <ListItem key={firstLevelItem.id} button selected={selected} onClick={onSelected} className={classes.listItem}>
      <span>{firstLevelItem.name}</span>
      <ChevronRight className={classes.listItemIcon} />
    </ListItem>
  );
};

const FirstLevelList: FunctionComponent = () => {
  const classes = useStyles();
  const { tagsConfig, tagParentIds } = RiskManagementContainer.useContainer();
  const { activeTagParentId, setActiveTagParent } = EventTypeFilterContainer.useContainer();

  return (
    <List className={classes.commonListStyles}>
      {tagParentIds.map((id) => {
        const item = tagsConfig.tagParents.get(id);
        if (item) {
          return (
            <FirstLevelListItem
              key={item.id}
              selected={activeTagParentId === item.id}
              onSelected={(): void => {
                setActiveTagParent(item.id);
              }}
              firstLevelItem={item}
            />
          );
        }
      })}
    </List>
  );
};

export default FirstLevelList;
