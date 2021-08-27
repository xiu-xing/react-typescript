// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagInfo _$TagInfoFromJson(Map<String, dynamic> json) {
  return TagInfo(
    Map<String, String>.from(json['theme'] as Map),
    (json['tags'] as List<dynamic>)
        .map((e) => Map<String, String>.from(e as Map))
        .toList(),
  );
}

Map<String, dynamic> _$TagInfoToJson(TagInfo instance) => <String, dynamic>{
      'theme': instance.theme,
      'tags': instance.tags,
    };
