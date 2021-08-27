// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionModel _$ActionModelFromJson(Map<String, dynamic> json) {
  return ActionModel(
    json['type'] as String? ?? '',
    json['args'] as Map<String, dynamic>?,
  )..data = json['data'] as Map<String, dynamic>?;
}

Map<String, dynamic> _$ActionModelToJson(ActionModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'args': instance.args,
      'data': instance.data,
    };
