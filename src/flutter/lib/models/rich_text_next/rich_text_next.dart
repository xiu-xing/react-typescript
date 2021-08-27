import 'package:json_annotation/json_annotation.dart';

import 'package:rime_app/models/action/action.dart';

part 'rich_text_next.g.dart';

@JsonSerializable()
class RichTextNextModel {
  @JsonKey(defaultValue: "")
  String pattern;
  @JsonKey(defaultValue: "")
  String value;
  @JsonKey(defaultValue: "")
  String icon;
  @JsonKey(defaultValue: false)
  bool isBold;
  ActionModel? action;

  RichTextNextModel(
      this.pattern, this.value, this.icon, this.isBold, this.action);

  factory RichTextNextModel.fromJson(Map<String, dynamic> json) =>
      _$RichTextNextModelFromJson(json);

  Map<String, dynamic> toJson() => _$RichTextNextModelToJson(this);
}
