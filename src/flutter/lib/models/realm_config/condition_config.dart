import 'package:json_annotation/json_annotation.dart';

part 'condition_config.g.dart';

@JsonSerializable()
class ConditionConfig {
  @JsonKey(name: 'condition_map')
  Map<String, dynamic>? conditionMap;
  // ignore field groups[]
  List<String>? presets;

  ConditionConfig(this.conditionMap, this.presets);

  factory ConditionConfig.fromJson(Map<String, dynamic> json) =>
      _$ConditionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionConfigToJson(this);
}
