import 'package:json_annotation/json_annotation.dart';
import 'package:rime_app/models/realm_config/option.dart';

part 'input_type_config.g.dart';

// "options": [],
// "searchable": true,
// "suggestion_id": "pevc.suggestion.region",
// "placeholder": "请输入总部地区"
// "extra_text": "添加地区",

@JsonSerializable()
class InputTypeConfig {
  // String? icon;
  @JsonKey(defaultValue: [])
  List<Option> options;
  @JsonKey(defaultValue: false)
  bool searchable;

  // 用于确定搜索内容
  @JsonKey(defaultValue: "", name: "suggestion_id")
  String suggestionId;

  @JsonKey(defaultValue: "")
  String placeholder;
  @JsonKey(defaultValue: "", name: "extra_text")
  String extraText;

  InputTypeConfig(this.options, this.searchable, this.suggestionId,
      this.placeholder, this.extraText);

  factory InputTypeConfig.fromJson(Map<String, dynamic> json) =>
      _$InputTypeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$InputTypeConfigToJson(this);
}
