// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rime_app/graphql/queries/authorization/authorization.ast.gql.dart'
    as _i5;
import 'package:rime_app/graphql/queries/authorization/authorization.data.gql.dart'
    as _i2;
import 'package:rime_app/graphql/queries/authorization/authorization.var.gql.dart'
    as _i3;
import 'package:rime_app/graphql/schema/serializers.gql.dart' as _i6;

part 'authorization.req.gql.g.dart';

abstract class GUserInfoReq
    implements
        Built<GUserInfoReq, GUserInfoReqBuilder>,
        _i1.OperationRequest<_i2.GUserInfoData, _i3.GUserInfoVars> {
  GUserInfoReq._();

  factory GUserInfoReq([Function(GUserInfoReqBuilder b) updates]) =
      _$GUserInfoReq;

  static void _initializeBuilder(GUserInfoReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'UserInfo')
    ..executeOnListen = true;
  _i3.GUserInfoVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GUserInfoData? Function(_i2.GUserInfoData?, _i2.GUserInfoData?)?
      get updateResult;
  _i2.GUserInfoData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GUserInfoData? parseData(Map<String, dynamic> json) =>
      _i2.GUserInfoData.fromJson(json);
  static Serializer<GUserInfoReq> get serializer => _$gUserInfoReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GUserInfoReq.serializer, this)
          as Map<String, dynamic>);
  static GUserInfoReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUserInfoReq.serializer, json);
}

abstract class GUserProfileReq
    implements
        Built<GUserProfileReq, GUserProfileReqBuilder>,
        _i1.OperationRequest<_i2.GUserProfileData, _i3.GUserProfileVars> {
  GUserProfileReq._();

  factory GUserProfileReq([Function(GUserProfileReqBuilder b) updates]) =
      _$GUserProfileReq;

  static void _initializeBuilder(GUserProfileReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'UserProfile')
    ..executeOnListen = true;
  _i3.GUserProfileVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GUserProfileData? Function(_i2.GUserProfileData?, _i2.GUserProfileData?)?
      get updateResult;
  _i2.GUserProfileData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GUserProfileData? parseData(Map<String, dynamic> json) =>
      _i2.GUserProfileData.fromJson(json);
  static Serializer<GUserProfileReq> get serializer =>
      _$gUserProfileReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GUserProfileReq.serializer, this)
          as Map<String, dynamic>);
  static GUserProfileReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUserProfileReq.serializer, json);
}

abstract class GUserPremiumSubscriptionBalanceReq
    implements
        Built<GUserPremiumSubscriptionBalanceReq,
            GUserPremiumSubscriptionBalanceReqBuilder>,
        _i1.OperationRequest<_i2.GUserPremiumSubscriptionBalanceData,
            _i3.GUserPremiumSubscriptionBalanceVars> {
  GUserPremiumSubscriptionBalanceReq._();

  factory GUserPremiumSubscriptionBalanceReq(
          [Function(GUserPremiumSubscriptionBalanceReqBuilder b) updates]) =
      _$GUserPremiumSubscriptionBalanceReq;

  static void _initializeBuilder(GUserPremiumSubscriptionBalanceReqBuilder b) =>
      b
        ..operation = _i4.Operation(
            document: _i5.document,
            operationName: 'UserPremiumSubscriptionBalance')
        ..executeOnListen = true;
  _i3.GUserPremiumSubscriptionBalanceVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GUserPremiumSubscriptionBalanceData? Function(
      _i2.GUserPremiumSubscriptionBalanceData?,
      _i2.GUserPremiumSubscriptionBalanceData?)? get updateResult;
  _i2.GUserPremiumSubscriptionBalanceData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GUserPremiumSubscriptionBalanceData? parseData(
          Map<String, dynamic> json) =>
      _i2.GUserPremiumSubscriptionBalanceData.fromJson(json);
  static Serializer<GUserPremiumSubscriptionBalanceReq> get serializer =>
      _$gUserPremiumSubscriptionBalanceReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers
          .serializeWith(GUserPremiumSubscriptionBalanceReq.serializer, this)
      as Map<String, dynamic>);
  static GUserPremiumSubscriptionBalanceReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers
          .deserializeWith(GUserPremiumSubscriptionBalanceReq.serializer, json);
}
