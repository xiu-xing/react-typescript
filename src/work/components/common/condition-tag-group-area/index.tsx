import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import { NextSearchConditionInput } from "../../../generated/graphql";
import { Option } from "../condition-dialog/types";
import Space from "../space";
import Upload from "../upload/upload";
import TagGroup from "./tag-group";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      maxHeight: 192,
      overflowY: "auto",
    },
  }),
);
Upload;

interface ConditionTagGroupAreaProps {
  conditions: NextSearchConditionInput[];
  computedConditionsConfigMap: Map<
    string,
    {
      isRequired?: boolean;
      mutiOperator: boolean;
    }
  >;
  onDelete?: (condition: NextSearchConditionInput) => void;
}

const ConditionTagGroupArea: React.FunctionComponent<ConditionTagGroupAreaProps> = (props) => {
  const classes = useStyles();
  const { conditions, onDelete, computedConditionsConfigMap } = props;

  function getLabel(condition: NextSearchConditionInput) {
    let label = condition.name;

    if (computedConditionsConfigMap.get(condition.id)?.mutiOperator && condition.options.length > 1) {
      label += `（${condition.operator.name}）`;
    }
    return label;
  }

  function onChange(id: string, value: string) {
    if (!onDelete) return;
    const option = JSON.parse(value) as Option;
    const newCondition = conditions.find((item) => item.id === id);

    if (!newCondition) return;

    newCondition.options = newCondition.options.filter((item) => item?.id !== option.id);
    onDelete(newCondition);
  }

  function getItems(condition: NextSearchConditionInput) {
    return condition.options.map((option) => ({ id: option, name: option?.name ?? "" }));
  }

  if (!conditions || conditions.length === 0) return <></>;

  return (
    <Space wrap size={["large", "middle"]} className={classes.root}>
      {conditions.map((condition, index) => (
        <TagGroup
          key={index}
          label={getLabel(condition)}
          tags={getItems(condition)}
          onDelete={onDelete ? (tag) => onChange(condition.id, tag) : undefined}
        />
      ))}
    </Space>
  );
};

export default ConditionTagGroupArea;
