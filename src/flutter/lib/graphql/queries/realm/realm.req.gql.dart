// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/realm/realm.ast.gql.dart' as _i5;
import 'package:rime_app/graphql/queries/realm/realm.data.gql.dart' as _i2;
import 'package:rime_app/graphql/queries/realm/realm.var.gql.dart' as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'realm.req.gql.g.dart';

abstract class GAppRealmReq
    implements
        Built<GAppRealmReq, GAppRealmReqBuilder>,
        _i1.OperationRequest<_i2.GAppRealmData, _i3.GAppRealmVars> {
  GAppRealmReq._();

  factory GAppRealmReq([Function(GAppRealmReqBuilder b) updates]) =
      _$GAppRealmReq;

  static void _initializeBuilder(GAppRealmReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'AppRealm')
    ..executeOnListen = true;
  _i3.GAppRealmVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GAppRealmData? Function(_i2.GAppRealmData?, _i2.GAppRealmData?)?
      get updateResult;
  _i2.GAppRealmData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GAppRealmData? parseData(Map<String, dynamic> json) =>
      _i2.GAppRealmData.fromJson(json);
  static Serializer<GAppRealmReq> get serializer => _$gAppRealmReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GAppRealmReq.serializer, this)
          as Map<String, dynamic>);
  static GAppRealmReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GAppRealmReq.serializer, json);
}

abstract class GAppRealmSearchResultReq
    implements
        Built<GAppRealmSearchResultReq, GAppRealmSearchResultReqBuilder>,
        _i1.OperationRequest<_i2.GAppRealmSearchResultData,
            _i3.GAppRealmSearchResultVars> {
  GAppRealmSearchResultReq._();

  factory GAppRealmSearchResultReq(
          [Function(GAppRealmSearchResultReqBuilder b) updates]) =
      _$GAppRealmSearchResultReq;

  static void _initializeBuilder(GAppRealmSearchResultReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'AppRealmSearchResult')
    ..executeOnListen = true;
  _i3.GAppRealmSearchResultVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GAppRealmSearchResultData? Function(
          _i2.GAppRealmSearchResultData?, _i2.GAppRealmSearchResultData?)?
      get updateResult;
  _i2.GAppRealmSearchResultData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GAppRealmSearchResultData? parseData(Map<String, dynamic> json) =>
      _i2.GAppRealmSearchResultData.fromJson(json);
  static Serializer<GAppRealmSearchResultReq> get serializer =>
      _$gAppRealmSearchResultReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GAppRealmSearchResultReq.serializer, this)
          as Map<String, dynamic>);
  static GAppRealmSearchResultReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GAppRealmSearchResultReq.serializer, json);
}
