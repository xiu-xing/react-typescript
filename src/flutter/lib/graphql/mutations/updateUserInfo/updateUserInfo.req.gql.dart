// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/mutations/updateUserInfo/updateUserInfo.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/mutations/updateUserInfo/updateUserInfo.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/mutations/updateUserInfo/updateUserInfo.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'updateUserInfo.req.gql.g.dart';

abstract class GUpdateUserInfoReq
    implements
        Built<GUpdateUserInfoReq, GUpdateUserInfoReqBuilder>,
        _i1.OperationRequest<_i2.GUpdateUserInfoData, _i3.GUpdateUserInfoVars> {
  GUpdateUserInfoReq._();

  factory GUpdateUserInfoReq([Function(GUpdateUserInfoReqBuilder b) updates]) =
      _$GUpdateUserInfoReq;

  static void _initializeBuilder(GUpdateUserInfoReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'UpdateUserInfo')
    ..executeOnListen = true;
  _i3.GUpdateUserInfoVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GUpdateUserInfoData? Function(
      _i2.GUpdateUserInfoData?, _i2.GUpdateUserInfoData?)? get updateResult;
  _i2.GUpdateUserInfoData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GUpdateUserInfoData? parseData(Map<String, dynamic> json) =>
      _i2.GUpdateUserInfoData.fromJson(json);
  static Serializer<GUpdateUserInfoReq> get serializer =>
      _$gUpdateUserInfoReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GUpdateUserInfoReq.serializer, this)
          as Map<String, dynamic>);
  static GUpdateUserInfoReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUpdateUserInfoReq.serializer, json);
}
