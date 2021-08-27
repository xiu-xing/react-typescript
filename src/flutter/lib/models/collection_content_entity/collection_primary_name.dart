import 'package:json_annotation/json_annotation.dart';

part 'collection_primary_name.g.dart';

@JsonSerializable()
class CollectionPrimaryName {
  CollectionPrimaryName(this.value, this.action);

  @JsonKey(name: 'value')
  String value;
  @JsonKey(name: 'action')
  Map<String, dynamic>? action;

  factory CollectionPrimaryName.fromJson(Map<String, dynamic> json) =>
      _$CollectionPrimaryNameFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionPrimaryNameToJson(this);
}
