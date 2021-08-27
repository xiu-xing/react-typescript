// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/market/market.ast.gql.dart' as _i5;
import 'package:rime_app/graphql/queries/market/market.data.gql.dart' as _i2;
import 'package:rime_app/graphql/queries/market/market.var.gql.dart' as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'market.req.gql.g.dart';

abstract class GCommodityReq
    implements
        Built<GCommodityReq, GCommodityReqBuilder>,
        _i1.OperationRequest<_i2.GCommodityData, _i3.GCommodityVars> {
  GCommodityReq._();

  factory GCommodityReq([Function(GCommodityReqBuilder b) updates]) =
      _$GCommodityReq;

  static void _initializeBuilder(GCommodityReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Commodity')
    ..executeOnListen = true;
  _i3.GCommodityVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCommodityData? Function(_i2.GCommodityData?, _i2.GCommodityData?)?
      get updateResult;
  _i2.GCommodityData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCommodityData? parseData(Map<String, dynamic> json) =>
      _i2.GCommodityData.fromJson(json);
  static Serializer<GCommodityReq> get serializer => _$gCommodityReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GCommodityReq.serializer, this)
          as Map<String, dynamic>);
  static GCommodityReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCommodityReq.serializer, json);
}

abstract class GCheckPaymentReq
    implements
        Built<GCheckPaymentReq, GCheckPaymentReqBuilder>,
        _i1.OperationRequest<_i2.GCheckPaymentData, _i3.GCheckPaymentVars> {
  GCheckPaymentReq._();

  factory GCheckPaymentReq([Function(GCheckPaymentReqBuilder b) updates]) =
      _$GCheckPaymentReq;

  static void _initializeBuilder(GCheckPaymentReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'CheckPayment')
    ..executeOnListen = true;
  _i3.GCheckPaymentVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GCheckPaymentData? Function(
      _i2.GCheckPaymentData?, _i2.GCheckPaymentData?)? get updateResult;
  _i2.GCheckPaymentData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GCheckPaymentData? parseData(Map<String, dynamic> json) =>
      _i2.GCheckPaymentData.fromJson(json);
  static Serializer<GCheckPaymentReq> get serializer =>
      _$gCheckPaymentReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GCheckPaymentReq.serializer, this)
          as Map<String, dynamic>);
  static GCheckPaymentReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GCheckPaymentReq.serializer, json);
}

abstract class GUserOrdersReq
    implements
        Built<GUserOrdersReq, GUserOrdersReqBuilder>,
        _i1.OperationRequest<_i2.GUserOrdersData, _i3.GUserOrdersVars> {
  GUserOrdersReq._();

  factory GUserOrdersReq([Function(GUserOrdersReqBuilder b) updates]) =
      _$GUserOrdersReq;

  static void _initializeBuilder(GUserOrdersReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'UserOrders')
    ..executeOnListen = true;
  _i3.GUserOrdersVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GUserOrdersData? Function(_i2.GUserOrdersData?, _i2.GUserOrdersData?)?
      get updateResult;
  _i2.GUserOrdersData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GUserOrdersData? parseData(Map<String, dynamic> json) =>
      _i2.GUserOrdersData.fromJson(json);
  static Serializer<GUserOrdersReq> get serializer =>
      _$gUserOrdersReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GUserOrdersReq.serializer, this)
          as Map<String, dynamic>);
  static GUserOrdersReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUserOrdersReq.serializer, json);
}

abstract class GOrderByIDReq
    implements
        Built<GOrderByIDReq, GOrderByIDReqBuilder>,
        _i1.OperationRequest<_i2.GOrderByIDData, _i3.GOrderByIDVars> {
  GOrderByIDReq._();

  factory GOrderByIDReq([Function(GOrderByIDReqBuilder b) updates]) =
      _$GOrderByIDReq;

  static void _initializeBuilder(GOrderByIDReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'OrderByID')
    ..executeOnListen = true;
  _i3.GOrderByIDVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GOrderByIDData? Function(_i2.GOrderByIDData?, _i2.GOrderByIDData?)?
      get updateResult;
  _i2.GOrderByIDData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GOrderByIDData? parseData(Map<String, dynamic> json) =>
      _i2.GOrderByIDData.fromJson(json);
  static Serializer<GOrderByIDReq> get serializer => _$gOrderByIDReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GOrderByIDReq.serializer, this)
          as Map<String, dynamic>);
  static GOrderByIDReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GOrderByIDReq.serializer, json);
}
