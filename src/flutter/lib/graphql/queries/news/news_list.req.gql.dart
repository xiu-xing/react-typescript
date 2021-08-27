// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/news/news_list.ast.gql.dart' as _i5;
import 'package:rime_app/graphql/queries/news/news_list.data.gql.dart' as _i2;
import 'package:rime_app/graphql/queries/news/news_list.var.gql.dart' as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'news_list.req.gql.g.dart';

abstract class GNewsListReq
    implements
        Built<GNewsListReq, GNewsListReqBuilder>,
        _i1.OperationRequest<_i2.GNewsListData, _i3.GNewsListVars> {
  GNewsListReq._();

  factory GNewsListReq([Function(GNewsListReqBuilder b) updates]) =
      _$GNewsListReq;

  static void _initializeBuilder(GNewsListReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'NewsList')
    ..executeOnListen = true;
  _i3.GNewsListVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GNewsListData? Function(_i2.GNewsListData?, _i2.GNewsListData?)?
      get updateResult;
  _i2.GNewsListData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GNewsListData? parseData(Map<String, dynamic> json) =>
      _i2.GNewsListData.fromJson(json);
  static Serializer<GNewsListReq> get serializer => _$gNewsListReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GNewsListReq.serializer, this)
          as Map<String, dynamic>);
  static GNewsListReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GNewsListReq.serializer, json);
}
