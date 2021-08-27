import 'package:json_annotation/json_annotation.dart';

part 'deal.g.dart';

@JsonSerializable()
class DealModel {
  @JsonKey(name: "deal_id")
  String id;
  @JsonKey(name: "deal_type")
  String type;
  @JsonKey(name: "deal_primary_name")
  String primaryName;
  @JsonKey(name: "org_primary_name")
  String entityPrimaryName;
  @JsonKey(name: "closed_on")
  String closedOn;
  @JsonKey(name: "primary_portrait_uri")
  String primaryPortraitUri;
  @JsonKey(name: "deal_size")
  String dealSize;

  DealModel(
    this.id,
    this.type,
    this.primaryName,
    this.entityPrimaryName,
    this.closedOn,
    this.primaryPortraitUri,
    this.dealSize,
  );

  factory DealModel.fromJson(Map<String, dynamic> json) =>
      _$DealModelFromJson(json);

  Map<String, dynamic> toJson() => _$DealModelToJson(this);
}
