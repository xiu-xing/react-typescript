// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Input _$InputFromJson(Map<String, dynamic> json) {
  return Input(
    json['input_type'] as String? ?? '',
    json['input_type_config'] == null
        ? null
        : InputTypeConfig.fromJson(
            json['input_type_config'] as Map<String, dynamic>),
    json['name'] as String? ?? '',
    json['source_type'] as String? ?? '',
    json['source_type_config'] as Map<String, dynamic>?,
    (json['operators'] as List<dynamic>?)
            ?.map((e) => Operator.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  )..parenetId = json['parenet_id'] as String? ?? '';
}

Map<String, dynamic> _$InputToJson(Input instance) => <String, dynamic>{
      'input_type': instance.inputType,
      'input_type_config': instance.inputTypeConfig,
      'name': instance.name,
      'source_type': instance.sourceType,
      'source_type_config': instance.sourceTypeConfig,
      'operators': instance.operators,
      'parenet_id': instance.parenetId,
    };
