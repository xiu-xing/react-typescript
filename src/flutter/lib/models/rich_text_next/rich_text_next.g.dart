// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rich_text_next.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RichTextNextModel _$RichTextNextModelFromJson(Map<String, dynamic> json) {
  return RichTextNextModel(
    json['pattern'] as String? ?? '',
    json['value'] as String? ?? '',
    json['icon'] as String? ?? '',
    json['isBold'] as bool? ?? false,
    json['action'] == null
        ? null
        : ActionModel.fromJson(json['action'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RichTextNextModelToJson(RichTextNextModel instance) =>
    <String, dynamic>{
      'pattern': instance.pattern,
      'value': instance.value,
      'icon': instance.icon,
      'isBold': instance.isBold,
      'action': instance.action,
    };
