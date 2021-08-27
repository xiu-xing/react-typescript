// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealModel _$DealModelFromJson(Map<String, dynamic> json) {
  return DealModel(
    json['deal_id'] as String,
    json['deal_type'] as String,
    json['deal_primary_name'] as String,
    json['org_primary_name'] as String,
    json['closed_on'] as String,
    json['primary_portrait_uri'] as String,
    json['deal_size'] as String,
  );
}

Map<String, dynamic> _$DealModelToJson(DealModel instance) => <String, dynamic>{
      'deal_id': instance.id,
      'deal_type': instance.type,
      'deal_primary_name': instance.primaryName,
      'org_primary_name': instance.entityPrimaryName,
      'closed_on': instance.closedOn,
      'primary_portrait_uri': instance.primaryPortraitUri,
      'deal_size': instance.dealSize,
    };
