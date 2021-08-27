// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleEntity _$SimpleEntityFromJson(Map<String, dynamic> json) {
  return SimpleEntity(
    json['entity_id'] as String,
    json['entity_type'] as String,
    json['entity_name'] as String,
    json['description'] as String?,
    json['label'] as String,
    json['tag'] as String,
  )..primaryPortraitUri = json['primary_portrait_uri'] as String?;
}

Map<String, dynamic> _$SimpleEntityToJson(SimpleEntity instance) =>
    <String, dynamic>{
      'entity_id': instance.entityID,
      'entity_type': instance.entityType,
      'entity_name': instance.entityName,
      'description': instance.description,
      'label': instance.label,
      'tag': instance.tag,
      'primary_portrait_uri': instance.primaryPortraitUri,
    };
