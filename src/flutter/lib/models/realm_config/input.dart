import 'package:json_annotation/json_annotation.dart';
import 'package:rime_app/models/realm_config/input_type_config.dart';
import 'package:rime_app/models/realm_config/operator.dart';

part 'input.g.dart';

@JsonSerializable()
class Input {
  // enum string: DATE_RANGE SEARCH_FIELD CHECKBOX RANGE FIELD
  @JsonKey(name: 'input_type', defaultValue: "")
  String inputType;
  @JsonKey(name: 'input_type_config')
  InputTypeConfig? inputTypeConfig;
  @JsonKey(defaultValue: "")
  String name;
  // date_picker number
  @JsonKey(name: 'source_type', defaultValue: "")
  String sourceType;
  @JsonKey(name: 'source_type_config')
  Map<String, dynamic>? sourceTypeConfig;
  @JsonKey(defaultValue: [])
  List<Operator> operators;

  @JsonKey(name: 'parenet_id', defaultValue: "")
  String parenetId = "";

  Input(this.inputType, this.inputTypeConfig, this.name, this.sourceType,
      this.sourceTypeConfig, this.operators);

  factory Input.fromJson(Map<String, dynamic> json) => _$InputFromJson(json);

  Map<String, dynamic> toJson() => _$InputToJson(this);
}
