// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionConfig _$ConditionConfigFromJson(Map<String, dynamic> json) {
  return ConditionConfig(
    json['condition_map'] as Map<String, dynamic>?,
    (json['presets'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ConditionConfigToJson(ConditionConfig instance) =>
    <String, dynamic>{
      'condition_map': instance.conditionMap,
      'presets': instance.presets,
    };
