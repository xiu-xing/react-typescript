// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendCompany _$RecommendCompanyFromJson(Map<String, dynamic> json) {
  return RecommendCompany(
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
    (json['vertical.name'] as List<dynamic>)
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
    (json['company.deals.count'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['company.last_deal.date'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['company.last_deal.type'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['company.last_deal.post_money_valuation'] as List<dynamic>)
        .map((e) => RichTextModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RecommendCompanyToJson(RecommendCompany instance) =>
    <String, dynamic>{
      'company.entity_id': instance.companyEntityId,
      'company.entity_type': instance.companyEntityType,
      'overview.uri': instance.overviewUri,
      'overview.full_name': instance.overviewFullName,
      'vertical.name': instance.verticalName,
      'overview.description': instance.overviewDescription,
      'org.founded_on': instance.orgFoundedOn,
      'org.headquarter_location': instance.orgHeadquarterLocation,
      'org.primary_website': instance.orgPrimatyWebsite,
      'company.deals.count': instance.companyDealsCount,
      'company.last_deal.date': instance.companyLastDealDate,
      'company.last_deal.type': instance.companyLatDealType,
      'company.last_deal.post_money_valuation':
          instance.companyLastDealPostMoneyValuation,
    };
