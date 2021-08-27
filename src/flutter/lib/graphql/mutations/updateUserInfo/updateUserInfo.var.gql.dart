// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/schema.schema.gql.dart' as _i1;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i2;

part 'updateUserInfo.var.gql.g.dart';

abstract class GUpdateUserInfoVars
    implements Built<GUpdateUserInfoVars, GUpdateUserInfoVarsBuilder> {
  GUpdateUserInfoVars._();

  factory GUpdateUserInfoVars(
      [Function(GUpdateUserInfoVarsBuilder b) updates]) = _$GUpdateUserInfoVars;

  _i1.GUpdateUserInfoInput? get input;
  static Serializer<GUpdateUserInfoVars> get serializer =>
      _$gUpdateUserInfoVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GUpdateUserInfoVars.serializer, this)
          as Map<String, dynamic>);
  static GUpdateUserInfoVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GUpdateUserInfoVars.serializer, json);
}
