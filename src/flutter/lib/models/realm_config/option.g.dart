// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) {
  return Option(
    json['id'] as String? ?? '',
    json['name'] as String? ?? '',
    json['operator'] as String? ?? '',
    (json['values'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
  )
    ..isCustomized = json['is_customized'] as bool? ?? false
    ..datePickerType = json['date_picker_type'] as String? ?? ''
    ..start = json['start'] as String? ?? ''
    ..end = json['end'] as String? ?? ''
    ..select = json['select'] as bool? ?? false
    ..userAdd = json['userAdd'] as bool? ?? false
    ..localAddRegion = json['localAddRegion'] as bool? ?? false;
}

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'operator': instance.operator,
      'values': instance.values,
      'is_customized': instance.isCustomized,
      'date_picker_type': instance.datePickerType,
      'start': instance.start,
      'end': instance.end,
      'select': instance.select,
      'userAdd': instance.userAdd,
      'localAddRegion': instance.localAddRegion,
    };
