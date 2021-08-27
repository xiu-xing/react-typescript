// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'risk_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiskConfig _$RiskConfigFromJson(Map<String, dynamic> json) {
  return RiskConfig(
    TagInfo.fromJson(json['risk_event_tags'] as Map<String, dynamic>),
    TagInfo.fromJson(json['risk_public_opinion_tags'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RiskConfigToJson(RiskConfig instance) =>
    <String, dynamic>{
      'risk_event_tags': instance.riskEventTags.toJson(),
      'risk_public_opinion_tags': instance.riskPublicOptionTags.toJson(),
    };
