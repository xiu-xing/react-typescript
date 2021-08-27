// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i2;

part 'key_value_map.var.gql.g.dart';

abstract class GKeyValueMapVars
    implements Built<GKeyValueMapVars, GKeyValueMapVarsBuilder> {
  GKeyValueMapVars._();

  factory GKeyValueMapVars([Function(GKeyValueMapVarsBuilder b) updates]) =
      _$GKeyValueMapVars;

  String get funcID;
  String? get requestBody;
  _i1.GNextPlatform? get platform;
  static Serializer<GKeyValueMapVars> get serializer =>
      _$gKeyValueMapVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GKeyValueMapVars.serializer, this)
          as Map<String, dynamic>);
  static GKeyValueMapVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GKeyValueMapVars.serializer, json);
}
