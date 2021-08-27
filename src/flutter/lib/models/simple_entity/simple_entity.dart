import 'package:json_annotation/json_annotation.dart';

part 'simple_entity.g.dart';

@JsonSerializable()
class SimpleEntity {
  SimpleEntity(this.entityID, this.entityType, this.entityName,
      this.description, this.label, this.tag);

  @JsonKey(name: 'entity_id')
  String entityID;
  @JsonKey(name: 'entity_type')
  String entityType;
  @JsonKey(name: 'entity_name')
  String entityName;
  String? description;
  String label;
  String tag;
  @JsonKey(name: 'primary_portrait_uri')
  String? primaryPortraitUri;

  factory SimpleEntity.fromJson(Map<String, dynamic> json) =>
      _$SimpleEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SimpleEntityToJson(this);
}
