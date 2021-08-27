import 'package:json_annotation/json_annotation.dart';

part 'map_data_vertical.g.dart';

@JsonSerializable()
class MapDataVertical {
  MapDataVertical(
    this.id,
    this.primaryName,
  );

  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'primary_name')
  String primaryName;

  factory MapDataVertical.fromJson(Map<String, dynamic> json) =>
      _$MapDataVerticalFromJson(json);
  Map<String, dynamic> toJson() => _$MapDataVerticalToJson(this);
}
