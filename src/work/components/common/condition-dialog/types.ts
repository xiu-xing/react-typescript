import { DatePickerView } from "@material-ui/pickers";
import { ConditionType, NextOperator } from "../../../generated/graphql";

export type IconType =
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

export type Configs = Record<string, Config>;
export interface Config {
  presets: string[];
  groups: Group[];
  "condition_map": ConditionMap;
}

export interface Group {
  id: string;
  name: string;
  conditions: string[];
}

export interface ConditionMap {
  [key: string]: Condition;
}

export interface Condition {
  id: string;
  name: string;
  input: Input;
  related_column_ids: string[];
  tips?: string;
  name_invisible: string;
  is_required?: boolean;
}

export type SourceType = "number" | "date_picker" | "string";
export interface Input {
  "parent_id": string;
  name?: string;
  operators: Operator[];
  "input_type": ConditionType;
  "source_type": SourceType;
  "input_type_config": InputTypeConfig;
  "preset_input_config"?: PresetInputConfig;
  "source_type_config": SourceTypeConfig;
  "default_values"?: DefaultValue[];
}

export interface PresetInputConfig {
  icon?: IconType;
  options?: Option[];
}

interface Operator {
  name?: string;
  operator: NextOperator;
  "is_locked"?: boolean;
}

export interface InputTypeConfig {
  solo?: boolean;
  options?: Option[];
  searchable?: boolean;
  "suggestion_id"?: string;
  placeholder?: string;
  "default_show_nested_num"?: number;
  "nested_options": NestedOption[];
  "suggestion_origin"?: string;
}

export interface Option {
  id: string;
  name: string;
  operator: NextOperator;
  values: string[];
  "is_customized"?: boolean;
}

export interface NestedOption {
  name: string;
  value: string;
  children?: NestedOption[];
  display?: string;
}

interface SourceTypeConfig {
  "date_picker_type"?: DatePickerView;
  currencies?: Currency[];
  unit?: Unit;
}

interface Currency {
  code: string;
  "iso_code": string;
  symbol: string;
}

interface Unit {
  name: string;
  value: string;
}

interface DefaultValue {
  name: string;
  value: string;
}
