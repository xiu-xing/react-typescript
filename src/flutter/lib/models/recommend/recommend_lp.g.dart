// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_lp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendLP _$RecommendLPFromJson(Map<String, dynamic> json) {
  return RecommendLP(
    (json['company.entity_id'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['company.entity_type'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['overview.uri'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['overview.full_name'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['partner.types'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['overview.description'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['org.founded_on'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['org.headquarter_location'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['org.primary_website'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['partner.number_of_commitments'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['partner.number_of_ltm_commitments'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RecommendLPToJson(RecommendLP instance) =>
    <String, dynamic>{
      'company.entity_id': instance.companyEntityId,
      'company.entity_type': instance.companyEntityType,
      'overview.uri': instance.overviewUri,
      'overview.full_name': instance.overviewFullName,
      'partner.types': instance.lpType,
      'overview.description': instance.overviewDescription,
      'org.founded_on': instance.orgFoundedOn,
      'org.headquarter_location': instance.orgHeadquarterLocation,
      'org.primary_website': instance.orgPrimatyWebsite,
      'partner.number_of_commitments': instance.numberOfCommitments,
      'partner.number_of_ltm_commitments': instance.numberOfLTMCommitments,
    };
