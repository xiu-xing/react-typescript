// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/mutations/market/market.ast.gql.dart' as _i5;
import 'package:rime_app/graphql/mutations/market/market.data.gql.dart' as _i2;
import 'package:rime_app/graphql/mutations/market/market.var.gql.dart' as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'market.req.gql.g.dart';

abstract class GCreateOrderReq
    implements
        Built<GCreateOrderReq, GCreateOrderReqBuilder>,
        _i1.OperationRequest<_i2.GCreateOrderData, _i3.GCreateOrderVars> {
  GCreateOrderReq._();

  factory GCreateOrderReq([Function(GCreateOrderReqBuilder b) updates]) =
      _$GCreateOrderReq;

  static void _initializeBuilder(GCreateOrderReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'CreateOrder')
    ..executeOnListen = true;
  _i3.GCreateOrderVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCreateOrderData? Function(_i2.GCreateOrderData?, _i2.GCreateOrderData?)?
      get updateResult;
  _i2.GCreateOrderData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCreateOrderData? parseData(Map<String, dynamic> json) =>
      _i2.GCreateOrderData.fromJson(json);
  static Serializer<GCreateOrderReq> get serializer =>
      _$gCreateOrderReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GCreateOrderReq.serializer, this)
          as Map<String, dynamic>);
  static GCreateOrderReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCreateOrderReq.serializer, json);
}

abstract class GPayOrderReq
    implements
        Built<GPayOrderReq, GPayOrderReqBuilder>,
        _i1.OperationRequest<_i2.GPayOrderData, _i3.GPayOrderVars> {
  GPayOrderReq._();

  factory GPayOrderReq([Function(GPayOrderReqBuilder b) updates]) =
      _$GPayOrderReq;

  static void _initializeBuilder(GPayOrderReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'PayOrder')
    ..executeOnListen = true;
  _i3.GPayOrderVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GPayOrderData? Function(_i2.GPayOrderData?, _i2.GPayOrderData?)?
      get updateResult;
  _i2.GPayOrderData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GPayOrderData? parseData(Map<String, dynamic> json) =>
      _i2.GPayOrderData.fromJson(json);
  static Serializer<GPayOrderReq> get serializer => _$gPayOrderReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GPayOrderReq.serializer, this)
          as Map<String, dynamic>);
  static GPayOrderReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPayOrderReq.serializer, json);
}

abstract class GCancelOrderReq
    implements
        Built<GCancelOrderReq, GCancelOrderReqBuilder>,
        _i1.OperationRequest<_i2.GCancelOrderData, _i3.GCancelOrderVars> {
  GCancelOrderReq._();

  factory GCancelOrderReq([Function(GCancelOrderReqBuilder b) updates]) =
      _$GCancelOrderReq;

  static void _initializeBuilder(GCancelOrderReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'CancelOrder')
    ..executeOnListen = true;
  _i3.GCancelOrderVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCancelOrderData? Function(_i2.GCancelOrderData?, _i2.GCancelOrderData?)?
      get updateResult;
  _i2.GCancelOrderData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCancelOrderData? parseData(Map<String, dynamic> json) =>
      _i2.GCancelOrderData.fromJson(json);
  static Serializer<GCancelOrderReq> get serializer =>
      _$gCancelOrderReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GCancelOrderReq.serializer, this)
          as Map<String, dynamic>);
  static GCancelOrderReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCancelOrderReq.serializer, json);
}

abstract class GApplePayReq
    implements
        Built<GApplePayReq, GApplePayReqBuilder>,
        _i1.OperationRequest<_i2.GApplePayData, _i3.GApplePayVars> {
  GApplePayReq._();

  factory GApplePayReq([Function(GApplePayReqBuilder b) updates]) =
      _$GApplePayReq;

  static void _initializeBuilder(GApplePayReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'ApplePay')
    ..executeOnListen = true;
  _i3.GApplePayVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GApplePayData? Function(_i2.GApplePayData?, _i2.GApplePayData?)?
      get updateResult;
  _i2.GApplePayData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GApplePayData? parseData(Map<String, dynamic> json) =>
      _i2.GApplePayData.fromJson(json);
  static Serializer<GApplePayReq> get serializer => _$gApplePayReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GApplePayReq.serializer, this)
          as Map<String, dynamic>);
  static GApplePayReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GApplePayReq.serializer, json);
}
