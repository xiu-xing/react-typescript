// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/quick_search/quick_search.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/queries/quick_search/quick_search.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/queries/quick_search/quick_search.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'quick_search.req.gql.g.dart';

abstract class GQuickSearchTrendingReq
    implements
        Built<GQuickSearchTrendingReq, GQuickSearchTrendingReqBuilder>,
        _i1.OperationRequest<_i2.GQuickSearchTrendingData,
            _i3.GQuickSearchTrendingVars> {
  GQuickSearchTrendingReq._();

  factory GQuickSearchTrendingReq(
          [Function(GQuickSearchTrendingReqBuilder b) updates]) =
      _$GQuickSearchTrendingReq;

  static void _initializeBuilder(GQuickSearchTrendingReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'QuickSearchTrending')
    ..executeOnListen = true;
  _i3.GQuickSearchTrendingVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GQuickSearchTrendingData? Function(
          _i2.GQuickSearchTrendingData?, _i2.GQuickSearchTrendingData?)?
      get updateResult;
  _i2.GQuickSearchTrendingData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GQuickSearchTrendingData? parseData(Map<String, dynamic> json) =>
      _i2.GQuickSearchTrendingData.fromJson(json);
  static Serializer<GQuickSearchTrendingReq> get serializer =>
      _$gQuickSearchTrendingReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GQuickSearchTrendingReq.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchTrendingReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GQuickSearchTrendingReq.serializer, json);
}

abstract class GQuickSearchLatestViewReq
    implements
        Built<GQuickSearchLatestViewReq, GQuickSearchLatestViewReqBuilder>,
        _i1.OperationRequest<_i2.GQuickSearchLatestViewData,
            _i3.GQuickSearchLatestViewVars> {
  GQuickSearchLatestViewReq._();

  factory GQuickSearchLatestViewReq(
          [Function(GQuickSearchLatestViewReqBuilder b) updates]) =
      _$GQuickSearchLatestViewReq;

  static void _initializeBuilder(GQuickSearchLatestViewReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'QuickSearchLatestView')
    ..executeOnListen = true;
  _i3.GQuickSearchLatestViewVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GQuickSearchLatestViewData? Function(
          _i2.GQuickSearchLatestViewData?, _i2.GQuickSearchLatestViewData?)?
      get updateResult;
  _i2.GQuickSearchLatestViewData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GQuickSearchLatestViewData? parseData(Map<String, dynamic> json) =>
      _i2.GQuickSearchLatestViewData.fromJson(json);
  static Serializer<GQuickSearchLatestViewReq> get serializer =>
      _$gQuickSearchLatestViewReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GQuickSearchLatestViewReq.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchLatestViewReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GQuickSearchLatestViewReq.serializer, json);
}

abstract class GQuickSearchTabsReq
    implements
        Built<GQuickSearchTabsReq, GQuickSearchTabsReqBuilder>,
        _i1.OperationRequest<_i2.GQuickSearchTabsData,
            _i3.GQuickSearchTabsVars> {
  GQuickSearchTabsReq._();

  factory GQuickSearchTabsReq(
      [Function(GQuickSearchTabsReqBuilder b) updates]) = _$GQuickSearchTabsReq;

  static void _initializeBuilder(GQuickSearchTabsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'QuickSearchTabs')
    ..executeOnListen = true;
  _i3.GQuickSearchTabsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GQuickSearchTabsData? Function(
      _i2.GQuickSearchTabsData?, _i2.GQuickSearchTabsData?)? get updateResult;
  _i2.GQuickSearchTabsData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GQuickSearchTabsData? parseData(Map<String, dynamic> json) =>
      _i2.GQuickSearchTabsData.fromJson(json);
  static Serializer<GQuickSearchTabsReq> get serializer =>
      _$gQuickSearchTabsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GQuickSearchTabsReq.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchTabsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GQuickSearchTabsReq.serializer, json);
}

abstract class GQuickSearchReq
    implements
        Built<GQuickSearchReq, GQuickSearchReqBuilder>,
        _i1.OperationRequest<_i2.GQuickSearchData, _i3.GQuickSearchVars> {
  GQuickSearchReq._();

  factory GQuickSearchReq([Function(GQuickSearchReqBuilder b) updates]) =
      _$GQuickSearchReq;

  static void _initializeBuilder(GQuickSearchReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'QuickSearch')
    ..executeOnListen = true;
  _i3.GQuickSearchVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GQuickSearchData? Function(_i2.GQuickSearchData?, _i2.GQuickSearchData?)?
      get updateResult;
  _i2.GQuickSearchData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GQuickSearchData? parseData(Map<String, dynamic> json) =>
      _i2.GQuickSearchData.fromJson(json);
  static Serializer<GQuickSearchReq> get serializer =>
      _$gQuickSearchReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GQuickSearchReq.serializer, this)
          as Map<String, dynamic>);
  static GQuickSearchReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GQuickSearchReq.serializer, json);
}

abstract class GIncrementEntityClickThroughReq
    implements
        Built<GIncrementEntityClickThroughReq,
            GIncrementEntityClickThroughReqBuilder>,
        _i1.OperationRequest<_i2.GIncrementEntityClickThroughData,
            _i3.GIncrementEntityClickThroughVars> {
  GIncrementEntityClickThroughReq._();

  factory GIncrementEntityClickThroughReq(
          [Function(GIncrementEntityClickThroughReqBuilder b) updates]) =
      _$GIncrementEntityClickThroughReq;

  static void _initializeBuilder(GIncrementEntityClickThroughReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'IncrementEntityClickThrough')
    ..executeOnListen = true;
  _i3.GIncrementEntityClickThroughVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GIncrementEntityClickThroughData? Function(
      _i2.GIncrementEntityClickThroughData?,
      _i2.GIncrementEntityClickThroughData?)? get updateResult;
  _i2.GIncrementEntityClickThroughData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GIncrementEntityClickThroughData? parseData(Map<String, dynamic> json) =>
      _i2.GIncrementEntityClickThroughData.fromJson(json);
  static Serializer<GIncrementEntityClickThroughReq> get serializer =>
      _$gIncrementEntityClickThroughReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers
          .serializeWith(GIncrementEntityClickThroughReq.serializer, this)
      as Map<String, dynamic>);
  static GIncrementEntityClickThroughReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GIncrementEntityClickThroughReq.serializer, json);
}
