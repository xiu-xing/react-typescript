// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i1;

part 'permission.var.gql.g.dart';

abstract class GFrequencyPermissionFieldsVars
    implements
        Built<GFrequencyPermissionFieldsVars,
            GFrequencyPermissionFieldsVarsBuilder> {
  GFrequencyPermissionFieldsVars._();

  factory GFrequencyPermissionFieldsVars(
          [Function(GFrequencyPermissionFieldsVarsBuilder b) updates]) =
      _$GFrequencyPermissionFieldsVars;

  static Serializer<GFrequencyPermissionFieldsVars> get serializer =>
      _$gFrequencyPermissionFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GFrequencyPermissionFieldsVars.serializer, this) as Map<String, dynamic>);
  static GFrequencyPermissionFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GFrequencyPermissionFieldsVars.serializer, json);
}

abstract class GPaginationPermissionFieldsVars
    implements
        Built<GPaginationPermissionFieldsVars,
            GPaginationPermissionFieldsVarsBuilder> {
  GPaginationPermissionFieldsVars._();

  factory GPaginationPermissionFieldsVars(
          [Function(GPaginationPermissionFieldsVarsBuilder b) updates]) =
      _$GPaginationPermissionFieldsVars;

  static Serializer<GPaginationPermissionFieldsVars> get serializer =>
      _$gPaginationPermissionFieldsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GPaginationPermissionFieldsVars.serializer, this)
      as Map<String, dynamic>);
  static GPaginationPermissionFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GPaginationPermissionFieldsVars.serializer, json);
}

abstract class GLockPermissionFieldsVars
    implements
        Built<GLockPermissionFieldsVars, GLockPermissionFieldsVarsBuilder> {
  GLockPermissionFieldsVars._();

  factory GLockPermissionFieldsVars(
          [Function(GLockPermissionFieldsVarsBuilder b) updates]) =
      _$GLockPermissionFieldsVars;

  static Serializer<GLockPermissionFieldsVars> get serializer =>
      _$gLockPermissionFieldsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLockPermissionFieldsVars.serializer, this)
          as Map<String, dynamic>);
  static GLockPermissionFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GLockPermissionFieldsVars.serializer, json);
}
