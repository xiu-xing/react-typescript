import 'package:json_annotation/json_annotation.dart';

part 'recent_visit_entity_model.g.dart';

@JsonSerializable()
class RecentVisitEntityModel {
  RecentVisitEntityModel(this.entityID, this.entityType, this.primaryName);

  @JsonKey(name: 'entity_id')
  String entityID;
  @JsonKey(name: 'entity_type')
  String entityType;
  @JsonKey(name: 'primary_name')
  String primaryName;

  factory RecentVisitEntityModel.fromJson(Map<String, dynamic> json) =>
      _$RecentVisitEntityModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecentVisitEntityModelToJson(this);
}
