import 'package:json_annotation/json_annotation.dart';

part 'collection_value.g.dart';

@JsonSerializable()
class CollectionValue {
  CollectionValue(this.value);

  @JsonKey(name: 'value')
  String value;

  factory CollectionValue.fromJson(Map<String, dynamic> json) =>
      _$CollectionValueFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionValueToJson(this);
}
