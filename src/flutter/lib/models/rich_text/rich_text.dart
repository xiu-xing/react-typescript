import 'package:json_annotation/json_annotation.dart';
import 'package:rime_app/models/action/action.dart';

part 'rich_text.g.dart';

@JsonSerializable(explicitToJson: true)
class RichTextModel {
  RichTextModel(this.value, this.isBold);

  String value;
  @JsonKey(name: 'is_bold')
  bool isBold;
  ActionModel? action;

  factory RichTextModel.fromJson(Map<String, dynamic> json) =>
      _$RichTextModelFromJson(json);
  Map<String, dynamic> toJson() => _$RichTextModelToJson(this);
}
