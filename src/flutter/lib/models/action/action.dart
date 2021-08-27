import 'package:json_annotation/json_annotation.dart';

part 'action.g.dart';

@JsonSerializable()
class ActionModel {
  @JsonKey(defaultValue: "")
  String type;
  Map<String, dynamic>? args;
  Map<String, dynamic>? data;

  ActionModel(this.type, this.args);

  factory ActionModel.fromJson(Map<String, dynamic> json) =>
      _$ActionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActionModelToJson(this);
}
