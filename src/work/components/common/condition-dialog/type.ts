import { DatePickerView } from "@material-ui/pickers";
import _ from "lodash";
import { ConditionType, NextOperator } from "../../../generated/graphql";

type IconType =
  | "LOCATION"
  | "FINANCING_STAGE"
  | "INSTITUTION"
  | "FILTER"
  | "CALENDAR"
  | "VERTICAL"
  | "AMOUNT"
  | "DEAL_TYPE"
  | "FUND_STATUS"
  | "FUND_TYPE"
  | "FUND_IS_REGISTERED_IN_AMAC"
  | "CURRENCY";

export class Group {
  id = "";
  name = "";
  conditions: string[] = [];

  static fromJSON(json: unknown): Group {
    const group: Group = new Group();

    const id = _.get(json, "id");
    id && (group.id = id);

    const name = _.get(json, "name");
    name && (group.name = name);

    const conditions = _.get(json, "conditions");
    conditions && (group.conditions = conditions);

    return group;
  }
}

export class Operator {
  name? = "";
  operator: NextOperator = NextOperator.IncludesAll;
  isLocked = false;

  static fromJSON(json: unknown): Operator {
    const newOperator = new Operator();

    const isLocked = _.get(json, "isLocked");
    isLocked && (newOperator.isLocked = isLocked);

    const name = _.get(json, "name");
    name && (newOperator.name = name);

    const operator = _.get(json, "operator");
    operator && (newOperator.operator = operator);

    return newOperator;
  }
}

export type SourceType = "number" | "date_picker" | "string";

class Option {
  id = "";
  name = "";
  operator: NextOperator = NextOperator.IncludesAll;
  values: string[] = [];
  isCustomized?: boolean;
}

export class NestedOption {
  name = "";
  value = "";
  children?: NestedOption[];
  display?: string;
}

export class InputTypeConfig {
  solo?: boolean;
  options?: Option[] = [];
  searchable?: boolean;
  suggestionId?: string;
  placeholder?: string;
  defaultShowNestedNum?: number;
  nestedOptions: NestedOption[] = [];
}

class PresetInputConfig {
  icon?: IconType;
  options?: Option[];
}

class Currency {
  code = "";
  isoCode = "";
  symbol = "";
}

interface Unit {
  name: string;
  value: string;
}
class SourceTypeConfig {
  datePickerType?: DatePickerView;
  currencies?: Currency[];
  unit?: Unit;
}

class DefaultValue {
  name = "";
  value = "";
}

export class Input {
  parentId = "";
  name? = "";
  operators: Operator[] = [];
  inputType: ConditionType = ConditionType.Field;
  sourceType: SourceType = "string";
  inputTypeConfig: InputTypeConfig = new InputTypeConfig();
  presetInputConfig?: PresetInputConfig;
  sourceTypeConfig: SourceTypeConfig = new SourceTypeConfig();
  defaultValues?: DefaultValue[];

  static fromJSON(json: unknown) {
    const input = new Input();

    const parentId = _.get(json, "parent_id");
    parentId && (input.parentId = parentId);

    const name = _.get(json, "name");
    name && (input.name = name);

    const operators = _.get(json, "operators");
    operators && (input.operators = operators);

    const sourceType = _.get(json, "source_type");
    sourceType && (input.sourceType = sourceType);

    const inputTypeConfig = _.get(json, "input_type_config");
    inputTypeConfig && (input.inputTypeConfig = inputTypeConfig);

    const presetInputConfig = _.get(json, "preset_input_config");
    presetInputConfig && (input.presetInputConfig = presetInputConfig);

    const sourceTypeConfig = _.get(json, "source_type_config");
    sourceTypeConfig && (input.sourceTypeConfig = sourceTypeConfig);

    const defaultValues = _.get(json, "default_values");
    defaultValues && (input.defaultValues = defaultValues);

    return input;
  }
}

export class Condition {
  id = "";
  name = "";
  input: Input = new Input();
  relatedColumnIds: string[] = [];
  tips? = "";
  nameInvisible = "";
  isRequired = false;

  static fromJSON(json: unknown) {
    const condition = new Condition();

    const id = _.get(json, "id");
    id && (condition.id = id);

    const name = _.get(json, "name");
    name && (condition.name = name);

    const relatedColumnIds = _.get(json, "related_column_ids");
    relatedColumnIds && (condition.relatedColumnIds = relatedColumnIds);

    const tips = _.get(json, "tips");
    tips && (condition.tips = tips);

    const nameInvisible = _.get(json, "name_invisible");
    nameInvisible && (condition.nameInvisible = nameInvisible);

    const isRequired = _.get(json, "is_required");
    isRequired && (condition.isRequired = isRequired);

    const input = _.get(json, "input");
    input && (condition.input = Input.fromJSON(input));

    return condition;
  }
}

export class CommonConditionConfig {
  presets: string[] = [];
  groups: Group[] = [];
  conditions: { [key: string]: Condition } = {};

  static fromJSON(json: unknown) {
    const commonConditionConfig = new CommonConditionConfig();

    const presets = _.get(json, "presets");
    presets && (commonConditionConfig.presets = presets);

    const groups: Group[] = _.get(json, "groups");
    groups && (commonConditionConfig.groups = groups);

    const conditions: { [key: string]: Condition } = _.get(json, "condition_map");
    // conditions && (commonConditionConfig.conditions = conditions);

    if (conditions) {
      const conditionMap: { [key: string]: Condition } = {};
      Object.entries(conditions).forEach(([childKey, childJSON]) => {
        if (typeof childKey === "string") {
          conditionMap[childKey] = Condition.fromJSON(childJSON);
          conditionMap[childKey].input = Input.fromJSON(childJSON.input);
        }
      });

      commonConditionConfig.conditions = conditionMap;
    }

    return commonConditionConfig;
  }
}
