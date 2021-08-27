// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/mutations/tracker/tracker.ast.gql.dart' as _i5;
import 'package:rime_app/graphql/mutations/tracker/tracker.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/mutations/tracker/tracker.var.gql.dart' as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'tracker.req.gql.g.dart';

abstract class GTrackEntityReq
    implements
        Built<GTrackEntityReq, GTrackEntityReqBuilder>,
        _i1.OperationRequest<_i2.GTrackEntityData, _i3.GTrackEntityVars> {
  GTrackEntityReq._();

  factory GTrackEntityReq([Function(GTrackEntityReqBuilder b) updates]) =
      _$GTrackEntityReq;

  static void _initializeBuilder(GTrackEntityReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'TrackEntity')
    ..executeOnListen = true;
  _i3.GTrackEntityVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GTrackEntityData? Function(_i2.GTrackEntityData?, _i2.GTrackEntityData?)?
      get updateResult;
  _i2.GTrackEntityData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GTrackEntityData? parseData(Map<String, dynamic> json) =>
      _i2.GTrackEntityData.fromJson(json);
  static Serializer<GTrackEntityReq> get serializer =>
      _$gTrackEntityReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GTrackEntityReq.serializer, this)
          as Map<String, dynamic>);
  static GTrackEntityReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GTrackEntityReq.serializer, json);
}

abstract class GUnTrackEntityByEntityIDReq
    implements
        Built<GUnTrackEntityByEntityIDReq, GUnTrackEntityByEntityIDReqBuilder>,
        _i1.OperationRequest<_i2.GUnTrackEntityByEntityIDData,
            _i3.GUnTrackEntityByEntityIDVars> {
  GUnTrackEntityByEntityIDReq._();

  factory GUnTrackEntityByEntityIDReq(
          [Function(GUnTrackEntityByEntityIDReqBuilder b) updates]) =
      _$GUnTrackEntityByEntityIDReq;

  static void _initializeBuilder(GUnTrackEntityByEntityIDReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'UnTrackEntityByEntityID')
    ..executeOnListen = true;
  _i3.GUnTrackEntityByEntityIDVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GUnTrackEntityByEntityIDData? Function(
          _i2.GUnTrackEntityByEntityIDData?, _i2.GUnTrackEntityByEntityIDData?)?
      get updateResult;
  _i2.GUnTrackEntityByEntityIDData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GUnTrackEntityByEntityIDData? parseData(Map<String, dynamic> json) =>
      _i2.GUnTrackEntityByEntityIDData.fromJson(json);
  static Serializer<GUnTrackEntityByEntityIDReq> get serializer =>
      _$gUnTrackEntityByEntityIDReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
      GUnTrackEntityByEntityIDReq.serializer, this) as Map<String, dynamic>);
  static GUnTrackEntityByEntityIDReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GUnTrackEntityByEntityIDReq.serializer, json);
}
