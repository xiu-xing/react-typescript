import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@JsonSerializable()
class Option {
  static final String localAddAll = "全部";
  static final String localAdd = "添加";

  @JsonKey(defaultValue: "")
  String id;
  @JsonKey(defaultValue: "")
  String name;
  @JsonKey(defaultValue: "")
  String operator;
  @JsonKey(defaultValue: [])
  List<String> values;

  // may not exist
  @JsonKey(
    name: "is_customized",
    defaultValue: false,
  )
  bool isCustomized = false;

  // may not exist
  @JsonKey(
    name: "date_picker_type",
    defaultValue: "",
  )
  String datePickerType = "";
  @JsonKey(defaultValue: "")
  String start = "";
  @JsonKey(defaultValue: "")
  String end = "";

  // local add
  @JsonKey(defaultValue: false)
  bool select = false;
  @JsonKey(defaultValue: false)
  bool userAdd = false;

  // 标识为添加按钮
  @JsonKey(defaultValue: false)
  bool localAddRegion = false;

  bool isLocalAddAll() => name == localAddAll;

  bool isLocalAddRegion() => localAddRegion;

  bool isLocalAdd() => isLocalAddAll() || isLocalAddRegion();

  Option(this.id, this.name, this.operator, this.values);

  factory Option.buildAll() => Option("", localAddAll, "", [])..select = true;

  factory Option.buildAddRegion(String? addRegion) {
    String name =
        addRegion == null || addRegion.isEmpty ? Option.localAdd : addRegion;
    return Option("", name, "", [])..localAddRegion = true;
  }

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
