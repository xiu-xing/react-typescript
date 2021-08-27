import 'package:json_annotation/json_annotation.dart';
import 'package:rime_app/models/rich_text/rich_text.dart';

part 'recommend_lp.g.dart';

@JsonSerializable()
class RecommendLP {
  RecommendLP(
    this.companyEntityId,
    this.companyEntityType,
    this.overviewUri,
    this.overviewFullName,
    this.lpType,
    this.overviewDescription,
    this.orgFoundedOn,
    this.orgHeadquarterLocation,
    this.orgPrimatyWebsite,
    this.numberOfCommitments,
    this.numberOfLTMCommitments,
  );

  @JsonKey(name: 'company.entity_id')
  List<RichTextModel> companyEntityId;

  @JsonKey(name: 'company.entity_type')
  List<RichTextModel> companyEntityType;

  @JsonKey(name: 'overview.uri')
  List<RichTextModel> overviewUri;

  @JsonKey(name: 'overview.full_name')
  List<RichTextModel> overviewFullName;

  @JsonKey(name: 'partner.types')
  List<RichTextModel> lpType;

  @JsonKey(name: 'overview.description')
  List<RichTextModel> overviewDescription;

  // 成立日期
  @JsonKey(name: 'org.founded_on')
  List<RichTextModel> orgFoundedOn;

  // 主要地区
  @JsonKey(name: 'org.headquarter_location')
  List<RichTextModel> orgHeadquarterLocation;

  // 官网
  @JsonKey(name: 'org.primary_website')
  List<RichTextModel> orgPrimatyWebsite;

  // 基金投资
  @JsonKey(name: 'partner.number_of_commitments')
  List<RichTextModel> numberOfCommitments;

  // 近一年基金投资
  @JsonKey(name: 'partner.number_of_ltm_commitments')
  List<RichTextModel> numberOfLTMCommitments;

  factory RecommendLP.fromJson(Map<String, dynamic> json) =>
      _$RecommendLPFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendLPToJson(this);
}
