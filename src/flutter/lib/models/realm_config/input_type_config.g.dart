// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_type_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputTypeConfig _$InputTypeConfigFromJson(Map<String, dynamic> json) {
  return InputTypeConfig(
    (json['options'] as List<dynamic>?)
            ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    json['searchable'] as bool? ?? false,
    json['suggestion_id'] as String? ?? '',
    json['placeholder'] as String? ?? '',
    json['extra_text'] as String? ?? '',
  );
}

Map<String, dynamic> _$InputTypeConfigToJson(InputTypeConfig instance) =>
    <String, dynamic>{
      'options': instance.options,
      'searchable': instance.searchable,
      'suggestion_id': instance.suggestionId,
      'placeholder': instance.placeholder,
      'extra_text': instance.extraText,
    };
