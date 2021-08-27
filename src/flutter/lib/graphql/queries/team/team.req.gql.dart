// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/team/team.ast.gql.dart' as _i5;
import 'package:rime_app/graphql/queries/team/team.data.gql.dart' as _i2;
import 'package:rime_app/graphql/queries/team/team.var.gql.dart' as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'team.req.gql.g.dart';

abstract class GTeamsReq
    implements
        Built<GTeamsReq, GTeamsReqBuilder>,
        _i1.OperationRequest<_i2.GTeamsData, _i3.GTeamsVars> {
  GTeamsReq._();

  factory GTeamsReq([Function(GTeamsReqBuilder b) updates]) = _$GTeamsReq;

  static void _initializeBuilder(GTeamsReqBuilder b) => b
    ..operation = _i4.Operation(document: _i5.document, operationName: 'Teams')
    ..executeOnListen = true;
  _i3.GTeamsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GTeamsData? Function(_i2.GTeamsData?, _i2.GTeamsData?)? get updateResult;
  _i2.GTeamsData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GTeamsData? parseData(Map<String, dynamic> json) =>
      _i2.GTeamsData.fromJson(json);
  static Serializer<GTeamsReq> get serializer => _$gTeamsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GTeamsReq.serializer, this)
          as Map<String, dynamic>);
  static GTeamsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GTeamsReq.serializer, json);
}

abstract class GIsEmailBindingRequiredReq
    implements
        Built<GIsEmailBindingRequiredReq, GIsEmailBindingRequiredReqBuilder>,
        _i1.OperationRequest<_i2.GIsEmailBindingRequiredData,
            _i3.GIsEmailBindingRequiredVars> {
  GIsEmailBindingRequiredReq._();

  factory GIsEmailBindingRequiredReq(
          [Function(GIsEmailBindingRequiredReqBuilder b) updates]) =
      _$GIsEmailBindingRequiredReq;

  static void _initializeBuilder(GIsEmailBindingRequiredReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'IsEmailBindingRequired')
    ..executeOnListen = true;
  _i3.GIsEmailBindingRequiredVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GIsEmailBindingRequiredData? Function(
          _i2.GIsEmailBindingRequiredData?, _i2.GIsEmailBindingRequiredData?)?
      get updateResult;
  _i2.GIsEmailBindingRequiredData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GIsEmailBindingRequiredData? parseData(Map<String, dynamic> json) =>
      _i2.GIsEmailBindingRequiredData.fromJson(json);
  static Serializer<GIsEmailBindingRequiredReq> get serializer =>
      _$gIsEmailBindingRequiredReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
      GIsEmailBindingRequiredReq.serializer, this) as Map<String, dynamic>);
  static GIsEmailBindingRequiredReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GIsEmailBindingRequiredReq.serializer, json);
}
