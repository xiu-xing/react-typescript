import React, { ReactNode } from "react";
import { ConditionType, NextSearchConditionInput } from "../../../generated/graphql";
import { Option } from "../../common/condition-dialog/types";
import SearchConditionInputIcon from "../../realm/search-condition-input-icon";
import { Condition, Config, PresetInputConfig } from "../condition-dialog/types";
import Space from "../space";
import ConditionSelect from "./condition-select";

interface ConfigSelectFilterAreaProps {
  prefix?: ReactNode;
  suffix?: ReactNode;
  conditions?: NextSearchConditionInput[];
  conditionConfigs?: Config;
  onSelectChange?: (select: NextSearchConditionInput) => void;
  moreOptionButton?: boolean;
  onMoreOptionClick?: () => void;
}

const ConfigSelectFilterArea: React.FunctionComponent<ConfigSelectFilterAreaProps> = (props) => {
  const {
    prefix,
    suffix,
    conditions,
    conditionConfigs,
    moreOptionButton = true,
    onSelectChange,
    onMoreOptionClick,
  } = props;

  function getValuesFromConditions(id: string) {
    if (!conditions) return [];
    const index = conditions.findIndex((value) => value.id === id);

    if (index === -1) return [];
    return conditions[index].options;
  }

  function getSelectItemList(prestInputConfig: PresetInputConfig) {
    return (
      prestInputConfig.options?.map((option) => ({
        id: option,
        name: option.name,
      })) ?? []
    );
  }

  function onChange(selectedOptions: any, conditionConfig: Condition) {
    if (!onSelectChange || !selectedOptions) return;
    if (selectedOptions[selectedOptions.length - 1] === undefined) return;

    const operator = conditionConfig.input.operators[0];
    const inputType = conditionConfig.input.input_type;
    let options: Option[] = [];
    try {
      options = selectedOptions.map((o: any) => JSON.parse(o) as Option);
    } catch (error) {
      options = [JSON.parse(selectedOptions) as Option];
    }

    const newSelectNextSearchConditionInput: NextSearchConditionInput = {
      id: conditionConfig.id,
      operator: operator.is_locked ? conditionConfig.input.operators[1] : operator,
      options: options,
      name: conditionConfig.name,
      type: inputType,
    };

    onSelectChange(newSelectNextSearchConditionInput);
  }

  function getSelectFilter(conditionConfig: Condition) {
    const prestInputConfig = conditionConfig.input.preset_input_config;
    if (!prestInputConfig) return <></>;

    const inputType = conditionConfig.input.input_type;
    const multiple = inputType !== ConditionType.DateRange && inputType !== ConditionType.Range;

    return (
      <ConditionSelect
        key={conditionConfig.id}
        values={getValuesFromConditions(conditionConfig.id)}
        renderValue={conditionConfig.name}
        multiple={multiple}
        selectItemList={getSelectItemList(prestInputConfig)}
        icon={prestInputConfig.icon ? <SearchConditionInputIcon type={prestInputConfig.icon} /> : undefined}
        onChange={(selectedOptions) => onChange(selectedOptions, conditionConfig)}
        moreOptionButton={moreOptionButton}
        onMoreOptionClick={onMoreOptionClick}
      />
    );
  }

  return (
    <Space wrap size="middle">
      {prefix}
      {conditionConfigs &&
        conditionConfigs.presets.map((key) => {
          const conditionConfig = conditionConfigs.condition_map[key];
          return getSelectFilter(conditionConfig);
        })}
      {suffix}
    </Space>
  );
};

export default ConfigSelectFilterArea;
