// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/research/research.ast.gql.dart' as _i5;
import 'package:rime_app/graphql/queries/research/research.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/queries/research/research.var.gql.dart' as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'research.req.gql.g.dart';

abstract class GArticleDetailReq
    implements
        Built<GArticleDetailReq, GArticleDetailReqBuilder>,
        _i1.OperationRequest<_i2.GArticleDetailData, _i3.GArticleDetailVars> {
  GArticleDetailReq._();

  factory GArticleDetailReq([Function(GArticleDetailReqBuilder b) updates]) =
      _$GArticleDetailReq;

  static void _initializeBuilder(GArticleDetailReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'ArticleDetail')
    ..executeOnListen = true;
  _i3.GArticleDetailVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GArticleDetailData? Function(
      _i2.GArticleDetailData?, _i2.GArticleDetailData?)? get updateResult;
  _i2.GArticleDetailData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GArticleDetailData? parseData(Map<String, dynamic> json) =>
      _i2.GArticleDetailData.fromJson(json);
  static Serializer<GArticleDetailReq> get serializer =>
      _$gArticleDetailReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GArticleDetailReq.serializer, this)
          as Map<String, dynamic>);
  static GArticleDetailReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GArticleDetailReq.serializer, json);
}

abstract class GArticleUriReq
    implements
        Built<GArticleUriReq, GArticleUriReqBuilder>,
        _i1.OperationRequest<_i2.GArticleUriData, _i3.GArticleUriVars> {
  GArticleUriReq._();

  factory GArticleUriReq([Function(GArticleUriReqBuilder b) updates]) =
      _$GArticleUriReq;

  static void _initializeBuilder(GArticleUriReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'ArticleUri')
    ..executeOnListen = true;
  _i3.GArticleUriVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GArticleUriData? Function(_i2.GArticleUriData?, _i2.GArticleUriData?)?
      get updateResult;
  _i2.GArticleUriData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GArticleUriData? parseData(Map<String, dynamic> json) =>
      _i2.GArticleUriData.fromJson(json);
  static Serializer<GArticleUriReq> get serializer =>
      _$gArticleUriReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GArticleUriReq.serializer, this)
          as Map<String, dynamic>);
  static GArticleUriReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GArticleUriReq.serializer, json);
}

abstract class GArticleListReq
    implements
        Built<GArticleListReq, GArticleListReqBuilder>,
        _i1.OperationRequest<_i2.GArticleListData, _i3.GArticleListVars> {
  GArticleListReq._();

  factory GArticleListReq([Function(GArticleListReqBuilder b) updates]) =
      _$GArticleListReq;

  static void _initializeBuilder(GArticleListReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'ArticleList')
    ..executeOnListen = true;
  _i3.GArticleListVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GArticleListData? Function(_i2.GArticleListData?, _i2.GArticleListData?)?
      get updateResult;
  _i2.GArticleListData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GArticleListData? parseData(Map<String, dynamic> json) =>
      _i2.GArticleListData.fromJson(json);
  static Serializer<GArticleListReq> get serializer =>
      _$gArticleListReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GArticleListReq.serializer, this)
          as Map<String, dynamic>);
  static GArticleListReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GArticleListReq.serializer, json);
}

abstract class GArticleTabsReq
    implements
        Built<GArticleTabsReq, GArticleTabsReqBuilder>,
        _i1.OperationRequest<_i2.GArticleTabsData, _i3.GArticleTabsVars> {
  GArticleTabsReq._();

  factory GArticleTabsReq([Function(GArticleTabsReqBuilder b) updates]) =
      _$GArticleTabsReq;

  static void _initializeBuilder(GArticleTabsReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'ArticleTabs')
    ..executeOnListen = true;
  _i3.GArticleTabsVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GArticleTabsData? Function(_i2.GArticleTabsData?, _i2.GArticleTabsData?)?
      get updateResult;
  _i2.GArticleTabsData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GArticleTabsData? parseData(Map<String, dynamic> json) =>
      _i2.GArticleTabsData.fromJson(json);
  static Serializer<GArticleTabsReq> get serializer =>
      _$gArticleTabsReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GArticleTabsReq.serializer, this)
          as Map<String, dynamic>);
  static GArticleTabsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GArticleTabsReq.serializer, json);
}
