// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operator _$OperatorFromJson(Map<String, dynamic> json) {
  return Operator(
    json['name'] as String? ?? '',
    json['operator'] as String? ?? '',
  );
}

Map<String, dynamic> _$OperatorToJson(Operator instance) => <String, dynamic>{
      'name': instance.name,
      'operator': instance.operator,
    };
