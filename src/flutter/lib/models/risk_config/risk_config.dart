import 'package:json_annotation/json_annotation.dart';
import 'package:rime_app/models/risk_config/tag_info.dart';

part 'risk_config.g.dart';

@JsonSerializable(explicitToJson: true)
class RiskConfig {
  RiskConfig(this.riskEventTags, this.riskPublicOptionTags);

  @JsonKey(name: 'risk_event_tags')
  TagInfo riskEventTags;
  @JsonKey(name: 'risk_public_opinion_tags')
  TagInfo riskPublicOptionTags;

  factory RiskConfig.fromJson(Map<String, dynamic> json) =>
      _$RiskConfigFromJson(json);
  Map<String, dynamic> toJson() => _$RiskConfigToJson(this);
}
