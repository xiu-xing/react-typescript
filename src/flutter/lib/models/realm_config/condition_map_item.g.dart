// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_map_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionMapItem _$ConditionMapItemFromJson(Map<String, dynamic> json) {
  return ConditionMapItem(
    json['id'] as String? ?? '',
    json['input'] == null
        ? null
        : Input.fromJson(json['input'] as Map<String, dynamic>),
    json['is_required'] as bool? ?? false,
    json['name'] as String? ?? '',
  );
}

Map<String, dynamic> _$ConditionMapItemToJson(ConditionMapItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'input': instance.input,
      'is_required': instance.isRequired,
      'name': instance.name,
    };
