// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i5;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;
import 'package:rime_app/graphql/types/permission/permission.ast.gql.dart'
    as _i4;
import 'package:rime_app/graphql/types/permission/permission.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/types/permission/permission.var.gql.dart'
    as _i3;

part 'permission.req.gql.g.dart';

abstract class GFrequencyPermissionFieldsReq
    implements
        Built<GFrequencyPermissionFieldsReq,
            GFrequencyPermissionFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GFrequencyPermissionFieldsData,
            _i3.GFrequencyPermissionFieldsVars> {
  GFrequencyPermissionFieldsReq._();

  factory GFrequencyPermissionFieldsReq(
          [Function(GFrequencyPermissionFieldsReqBuilder b) updates]) =
      _$GFrequencyPermissionFieldsReq;

  static void _initializeBuilder(GFrequencyPermissionFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'FrequencyPermissionFields';
  _i3.GFrequencyPermissionFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GFrequencyPermissionFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GFrequencyPermissionFieldsData.fromJson(json);
  static Serializer<GFrequencyPermissionFieldsReq> get serializer =>
      _$gFrequencyPermissionFieldsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
      GFrequencyPermissionFieldsReq.serializer, this) as Map<String, dynamic>);
  static GFrequencyPermissionFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GFrequencyPermissionFieldsReq.serializer, json);
}

abstract class GPaginationPermissionFieldsReq
    implements
        Built<GPaginationPermissionFieldsReq,
            GPaginationPermissionFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GPaginationPermissionFieldsData,
            _i3.GPaginationPermissionFieldsVars> {
  GPaginationPermissionFieldsReq._();

  factory GPaginationPermissionFieldsReq(
          [Function(GPaginationPermissionFieldsReqBuilder b) updates]) =
      _$GPaginationPermissionFieldsReq;

  static void _initializeBuilder(GPaginationPermissionFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'PaginationPermissionFields';
  _i3.GPaginationPermissionFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GPaginationPermissionFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GPaginationPermissionFieldsData.fromJson(json);
  static Serializer<GPaginationPermissionFieldsReq> get serializer =>
      _$gPaginationPermissionFieldsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
      GPaginationPermissionFieldsReq.serializer, this) as Map<String, dynamic>);
  static GPaginationPermissionFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GPaginationPermissionFieldsReq.serializer, json);
}

abstract class GLockPermissionFieldsReq
    implements
        Built<GLockPermissionFieldsReq, GLockPermissionFieldsReqBuilder>,
        _i1.FragmentRequest<_i2.GLockPermissionFieldsData,
            _i3.GLockPermissionFieldsVars> {
  GLockPermissionFieldsReq._();

  factory GLockPermissionFieldsReq(
          [Function(GLockPermissionFieldsReqBuilder b) updates]) =
      _$GLockPermissionFieldsReq;

  static void _initializeBuilder(GLockPermissionFieldsReqBuilder b) => b
    ..document = _i4.document
    ..fragmentName = 'LockPermissionFields';
  _i3.GLockPermissionFieldsVars get vars;
  _i5.DocumentNode get document;
  String? get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GLockPermissionFieldsData? parseData(Map<String, dynamic> json) =>
      _i2.GLockPermissionFieldsData.fromJson(json);
  static Serializer<GLockPermissionFieldsReq> get serializer =>
      _$gLockPermissionFieldsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GLockPermissionFieldsReq.serializer, this)
          as Map<String, dynamic>);
  static GLockPermissionFieldsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GLockPermissionFieldsReq.serializer, json);
}
