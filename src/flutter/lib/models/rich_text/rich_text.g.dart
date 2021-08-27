// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rich_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RichTextModel _$RichTextModelFromJson(Map<String, dynamic> json) {
  return RichTextModel(
    json['value'] as String,
    json['is_bold'] as bool,
  )..action = json['action'] == null
      ? null
      : ActionModel.fromJson(json['action'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RichTextModelToJson(RichTextModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'is_bold': instance.isBold,
      'action': instance.action?.toJson(),
    };
