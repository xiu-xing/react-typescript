import 'package:json_annotation/json_annotation.dart';

part 'tag_info.g.dart';

@JsonSerializable(explicitToJson: true)
class TagInfo {
  TagInfo(
    this.theme,
    this.tags,
  );

  Map<String, String> theme;
  List<Map<String, String>> tags;

  factory TagInfo.fromJson(Map<String, dynamic> json) =>
      _$TagInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TagInfoToJson(this);
}
