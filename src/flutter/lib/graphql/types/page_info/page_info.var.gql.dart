// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'page_info.var.gql.g.dart';

abstract class GPageInfoFieldsVars
    implements Built<GPageInfoFieldsVars, GPageInfoFieldsVarsBuilder> {
  GPageInfoFieldsVars._();

  factory GPageInfoFieldsVars(
      [Function(GPageInfoFieldsVarsBuilder b) updates]) = _$GPageInfoFieldsVars;

  static Serializer<GPageInfoFieldsVars> get serializer =>
      _$gPageInfoFieldsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPageInfoFieldsVars.serializer, this)
          as Map<String, dynamic>);
  static GPageInfoFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPageInfoFieldsVars.serializer, json);
}
