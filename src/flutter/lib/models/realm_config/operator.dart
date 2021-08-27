import 'package:json_annotation/json_annotation.dart';

part 'operator.g.dart';

@JsonSerializable()
class Operator {
  @JsonKey(defaultValue: "")
  String name;
  @JsonKey(defaultValue: "")
  String operator;

  Operator(this.name, this.operator);

  factory Operator.fromJson(Map<String, dynamic> json) =>
      _$OperatorFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorToJson(this);
}
