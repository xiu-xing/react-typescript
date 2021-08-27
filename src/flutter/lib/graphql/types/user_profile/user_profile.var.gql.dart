// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'user_profile.var.gql.g.dart';

abstract class GUserProfileFieldsVars
    implements Built<GUserProfileFieldsVars, GUserProfileFieldsVarsBuilder> {
  GUserProfileFieldsVars._();

  factory GUserProfileFieldsVars(
          [Function(GUserProfileFieldsVarsBuilder b) updates]) =
      _$GUserProfileFieldsVars;

  static Serializer<GUserProfileFieldsVars> get serializer =>
      _$gUserProfileFieldsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserProfileFieldsVars.serializer, this)
          as Map<String, dynamic>);
  static GUserProfileFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserProfileFieldsVars.serializer, json);
}
