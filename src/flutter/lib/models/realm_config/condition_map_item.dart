import 'package:json_annotation/json_annotation.dart';
import 'package:rime_app/models/realm_config/input.dart';

part 'condition_map_item.g.dart';

@JsonSerializable()
class ConditionMapItem {
  @JsonKey(defaultValue: "")
  String id;
  Input? input;
  @JsonKey(name: 'is_required', defaultValue: false)
  bool isRequired;
  @JsonKey(defaultValue: "")
  String name;

  ConditionMapItem(this.id, this.input, this.isRequired, this.name);

  factory ConditionMapItem.fromJson(Map<String, dynamic> json) =>
      _$ConditionMapItemFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionMapItemToJson(this);
}
