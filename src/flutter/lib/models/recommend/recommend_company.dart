import 'package:json_annotation/json_annotation.dart';
import 'package:rime_app/models/rich_text/rich_text.dart';

part 'recommend_company.g.dart';

@JsonSerializable()
class RecommendCompany {
  RecommendCompany(
    this.companyEntityId,
    this.companyEntityType,
    this.overviewUri,
    this.overviewFullName,
    this.verticalName,
    this.overviewDescription,
    this.orgFoundedOn,
    this.orgHeadquarterLocation,
    this.orgPrimatyWebsite,
    this.companyDealsCount,
    this.companyLastDealDate,
    this.companyLatDealType,
    this.companyLastDealPostMoneyValuation,
  );

  @JsonKey(name: 'company.entity_id')
  List<RichTextModel> companyEntityId;

  @JsonKey(name: 'company.entity_type')
  List<RichTextModel> companyEntityType;

  @JsonKey(name: 'overview.uri')
  List<RichTextModel> overviewUri;

  @JsonKey(name: 'overview.full_name')
  List<RichTextModel> overviewFullName;

  @JsonKey(name: 'vertical.name')
  List<RichTextModel> verticalName;

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

  // 融资总轮数
  @JsonKey(name: 'company.deals.count')
  List<RichTextModel> companyDealsCount;

  // 最新融资日期
  @JsonKey(name: 'company.last_deal.date')
  List<RichTextModel> companyLastDealDate;

  // 最新融资类型
  @JsonKey(name: 'company.last_deal.type')
  List<RichTextModel> companyLatDealType;

  // 最新投后估值
  @JsonKey(name: 'company.last_deal.post_money_valuation')
  List<RichTextModel> companyLastDealPostMoneyValuation;

  factory RecommendCompany.fromJson(Map<String, dynamic> json) =>
      _$RecommendCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendCompanyToJson(this);
}
