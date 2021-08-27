// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/business_card/business_card.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/queries/business_card/business_card.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/queries/business_card/business_card.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'business_card.req.gql.g.dart';

abstract class GBusinessCardDetailReq
    implements
        Built<GBusinessCardDetailReq, GBusinessCardDetailReqBuilder>,
        _i1.OperationRequest<_i2.GBusinessCardDetailData,
            _i3.GBusinessCardDetailVars> {
  GBusinessCardDetailReq._();

  factory GBusinessCardDetailReq(
          [Function(GBusinessCardDetailReqBuilder b) updates]) =
      _$GBusinessCardDetailReq;

  static void _initializeBuilder(GBusinessCardDetailReqBuilder b) => b
    ..operation = _i4.Operation(
        document: _i5.document, operationName: 'BusinessCardDetail')
    ..executeOnListen = true;
  _i3.GBusinessCardDetailVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GBusinessCardDetailData? Function(
          _i2.GBusinessCardDetailData?, _i2.GBusinessCardDetailData?)?
      get updateResult;
  _i2.GBusinessCardDetailData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GBusinessCardDetailData? parseData(Map<String, dynamic> json) =>
      _i2.GBusinessCardDetailData.fromJson(json);
  static Serializer<GBusinessCardDetailReq> get serializer =>
      _$gBusinessCardDetailReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GBusinessCardDetailReq.serializer, this)
          as Map<String, dynamic>);
  static GBusinessCardDetailReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GBusinessCardDetailReq.serializer, json);
}
