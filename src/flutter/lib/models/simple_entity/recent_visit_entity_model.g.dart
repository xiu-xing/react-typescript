// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_visit_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentVisitEntityModel _$RecentVisitEntityModelFromJson(
    Map<String, dynamic> json) {
  return RecentVisitEntityModel(
    json['entity_id'] as String,
    json['entity_type'] as String,
    json['primary_name'] as String,
  );
}

Map<String, dynamic> _$RecentVisitEntityModelToJson(
        RecentVisitEntityModel instance) =>
    <String, dynamic>{
      'entity_id': instance.entityID,
      'entity_type': instance.entityType,
      'primary_name': instance.primaryName,
    };
